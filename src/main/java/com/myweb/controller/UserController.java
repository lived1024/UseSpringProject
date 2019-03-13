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
		String header = "Bearer " + token; // Bearer ������ ���� �߰�
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // ���� ȣ��
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // ���� �߻�
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);	// JSON -> ��Ʈ������������ ��ȯ
            }
            br.close();	            
            
            //JSON �Ľ�����
            String result = response.toString();	//String���� ��ȯ
            System.out.println(result);				//�� ���
            JSONParser parser=new JSONParser();		//�ļ� ����! - JSON simple ���̺귯��
            JSONObject obj=(JSONObject)parser.parse(result);
            // result�� response ���̴�!
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
//            System.out.println("��Ʈ�ѷ� : "+session.getAttribute("JSESSIONID"));
            
            //��ϵ� ID���� Ȯ���ϱ�,,
//            int check=service.naverIdCheck(nid);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return "redirect:/home";
	}
	
}
