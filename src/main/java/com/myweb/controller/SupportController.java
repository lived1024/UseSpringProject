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
			//�뿩 ���� ���� ����
			String[] startDate=arr.get(i).getR_start().split(" ");
			String[] staDate=startDate[0].split("-");
			String sDate="20"+staDate[0];
			
			arr.get(i).setR_start(sDate+"-"+staDate[1]+"-"+staDate[2]);
			
			//�ݳ��� ���� ����
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
		UserVO suv=(UserVO) session.getAttribute("uv");		//���� ���� ������ suv�� ����
		session.removeAttribute("uv");						//���� ���� ����
		
		if(!suv.getNid().equals("") && suv.getNid()!=null) {	//���� ������ ���̹� �α����� ���
			uv.setNid(suv.getNid());
		}
		
		service.updateInfo(uv);		//������Ʈ ����
		
		if(!suv.getNid().equals("") && suv.getNid()!=null) {	//���� ������ ���̹� �α����� ���
			uv=uservice.getNaverUser(suv.getNid());			//uv�� ������ ���� �ٽ� ����
		}
		
		session.setAttribute("uv", uv);
		return 0;
	}
}
