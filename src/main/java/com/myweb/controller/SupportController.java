package com.myweb.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;
import com.myweb.service.SupportService;
import com.myweb.service.UserService;

@Controller
@RequestMapping("/support/*")
public class SupportController {
	
	@Inject
	private SupportService service;
	
	@Inject
	private UserService uservice;
	
	@GetMapping("supportMain")
	public void main() {
	}
	
	@RequestMapping("rentalState")
	public String callRental(HttpServletRequest req) {
		HttpSession session=req.getSession();
		UserVO uv=(UserVO)session.getAttribute("uv");
		
		ArrayList<RentalVO> arr=service.rentalState(uv.getNid(), uv.getWid());
		
		for(int i=0;i<arr.size();i++) {
			//대여 시작 연도 변경
			String[] startDate=arr.get(i).getR_start().split(" ");
			String[] staDate=startDate[0].split("-");
			String sDate="20"+staDate[0];
			
			arr.get(i).setR_start(sDate+"-"+staDate[1]+"-"+staDate[2]);
			
			//반납일 연도 변경
			String[] endDate=arr.get(i).getR_end().split(" ");
			String[] enDate=endDate[0].split("-");
			String eDate="20"+enDate[0];
			
			arr.get(i).setR_end(eDate+"-"+enDate[1]+"-"+enDate[2]);
		}
		
		req.setAttribute("arr", arr);
		return "support/rentalView";
	}
	
	@GetMapping("updateForm")
	public void updateForm() {
		
	}
	
	@PostMapping("updateForm")
	@ResponseBody
	public int conPassword(String pass, HttpServletRequest req) {
		HttpSession session=req.getSession();
		UserVO uv=(UserVO)session.getAttribute("uv");
		int res=service.confirmPass(pass,uv.getWid());
		return res;
	}
	
	@PostMapping("update")
	@ResponseBody
	public int updateInfo(UserVO uv, HttpServletRequest req, String addr1, String addr2, String tel1, String tel2, String tel3) {
		String addr = addr1 + " / " + addr2;
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		
		uv.setAddr(addr);
		uv.setTel(tel);	
		
		HttpSession session=req.getSession();
		UserVO suv=(UserVO) session.getAttribute("uv");		//이전 세션 내용을 suv에 저장
		session.removeAttribute("uv");						//이전 세션 삭제
		
		if(!suv.getNid().equals("") && suv.getNid()!=null) {	//이전 세션이 네이버 로그인일 경우
			uv.setNid(suv.getNid());
		}
		
		service.updateInfo(uv);		//업데이트 실행
		
		if(!suv.getNid().equals("") && suv.getNid()!=null) {	//이전 세션이 네이버 로그인일 경우
			uv=uservice.getNaverUser(suv.getNid());			//uv에 가져온 값을 다시 설정
		}
		
		session.setAttribute("uv", uv);
		return 0;
	}
}
