package com.myweb.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.mapper.UserMapper;
import com.myweb.model.UserVO;
import com.myweb.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user/*")
public class UserController {
	@Inject
	private UserService service;
	
	@Autowired
	private UserMapper mapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@GetMapping("/login")
	public void userLogin() {
		
	}
	@PostMapping("/login")
	@ResponseBody
	public int webUserLogin(HttpServletRequest request, String wid, String pwd) {
		int check=service.checkUserLogin(wid, pwd);
		return check;
	}
	
	@RequestMapping("/getWebUserInfo")
	public String getWebUserInfo(HttpServletRequest request, String wid) {
		UserVO uv=service.getWebUser(wid);
		
		HttpSession session=request.getSession();
		session.setAttribute("uv", uv);
		request.setAttribute("msg", uv.getName()+"님 재방문을 환영합니다!");
		return "home";
	}
	
	@GetMapping("/callback")
	public void naverLogin() {
		
	}
	
	@PostMapping("/checkNaverId")
	public String checkNaverId(String token, HttpServletRequest request) {
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);	// JSON -> 스트링버퍼형으로 변환
            }
            br.close();	            
            
            //JSON 파싱차례
            String result = response.toString();	//String으로 변환
            System.out.println(result);				//값 출력
            JSONParser parser=new JSONParser();		//파서 생성! - JSON simple 라이브러리
            JSONObject obj=(JSONObject)parser.parse(result);
            // result의 response 값이다!
            JSONObject afterparse = (JSONObject)obj.get("response");   
            
            String nid=(String)afterparse.get("id");
            String age=(String)afterparse.get("age");
            String gender=(String)afterparse.get("gender");
            String email=(String)afterparse.get("email");
            String name=(String)afterparse.get("name");
            String birthday=(String)afterparse.get("birthday");
            
            System.out.println("name : "+name);
            
            UserVO uv=new UserVO();
            uv.setNid(nid);
            uv.setAge(age);
            uv.setGender(gender);
            uv.setEmail(email);
            uv.setName(name);
            uv.setBirthday(birthday);
            
            HttpSession session=request.getSession();
            //기존 회원인지 판별
            int check=service.naverIdCheck(nid);
            System.out.println("check : "+check);
            if(check==0) {
            	//네이버 로그인 회원 회원가입
            	service.naverUser(uv);
            	session.setAttribute("uv", uv);
            	request.setAttribute("msg", "첫 방문을 환영합니다!");
            }else if(check==1) {
            	uv=service.getNaverUser(nid);
            	session.setAttribute("uv", uv);
            	request.setAttribute("msg", uv.getName()+"님 재방문을 환영합니다!");
            }else {
            	logger.info("네이버 ID 중복");
            	request.setAttribute("msg", "ID 중복에러입니다!");
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return "home";
	}
	
	@PostMapping("/create")
	public String createUser(HttpServletRequest request, UserVO uv, String addr1, String addr2, String tel1, String tel2, String tel3) {
		String addr = addr1 + " " + addr2;
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		
		uv.setAddr(addr);
		uv.setTel(tel);
		
		service.createWebUser(uv);
		HttpSession session=request.getSession();
		session.setAttribute("uv", uv);
		request.setAttribute("msg", uv.getName()+"님 가입이 완료되었습니다");
		return "home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		if(uv.getNid() != null && !uv.getNid().equals("")) {
			session.invalidate();
			return "redirect:http://www.naver.com";
		}
		session.invalidate();
		return "/user/login";
	}
	
}
