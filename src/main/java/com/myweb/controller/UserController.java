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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.myweb.mapper.UserMapper;
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
	
	@GetMapping("/callback")
	public void naverLogin() {
		
	}
	
	@PostMapping("/checkNaverId")
	public String checkNaverId(String token) {
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
            
//            ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
//            HttpServletRequest request = sra.getRequest();
//            HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
//            HttpSession session=req.getSession();
//            System.out.println("콘트롤러 : "+session.getAttribute("JSESSIONID"));
            
            //등록된 ID인지 확인하기,,
//            int check=service.naverIdCheck(nid);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return "redirect:/home";
	}
	
}
