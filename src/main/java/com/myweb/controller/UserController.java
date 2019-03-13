package com.myweb.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;
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
            int responseCode1 = con.getResponseCode();
            BufferedReader br;
            if(responseCode1==200) { // ���� ȣ��
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
            String result1 = response.toString();	//String���� ��ȯ
            JSONParser parser1=new JSONParser();		//�ļ� ����! - JSON simple ���̺귯��
            JSONObject obj1=(JSONObject)parser1.parse(result1);
            // result�� response ���̴�!
            JSONObject afterparse1 = (JSONObject)obj1.get("response");   
            
            String nid=(String)afterparse1.get("id");
            String age=(String)afterparse1.get("age");
            String gender=(String)afterparse1.get("gender");
            String email=(String)afterparse1.get("email");
            String name=(String)afterparse1.get("name");
            String birthday=(String)afterparse1.get("birthday");
            
            System.out.println("name : "+name);
            
            //��ϵ� ID���� Ȯ���ϱ�,,
//            int check=service.naverIdCheck(nid);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return "redirect:/home";
	}
	
}
