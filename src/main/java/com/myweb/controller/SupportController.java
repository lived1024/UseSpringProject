package com.myweb.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;
import com.myweb.service.SupportService;

@Controller
@RequestMapping("/support/*")
public class SupportController {
	
	@Inject
	private SupportService service;
	
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
	
}
