package com.myweb.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.mapper.AdminMapper;
import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;
import com.myweb.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private AdminService service;
	
	@Autowired
	private AdminMapper mapper;
	
	@GetMapping("adminLogin")
	public void adminLogin() {
		
	}
	
	@PostMapping("pwcheck")
	@ResponseBody
	public int pwcheck(String pwd, HttpServletRequest req) {
		int pwdcheck=service.pwcheck(pwd);
		if(pwdcheck==1) {
			UserVO admin=service.adminSession();
			
			HttpSession session=req.getSession();
			session.setAttribute("admin", admin);
		}
		return pwdcheck;
	}
	
	@GetMapping("adminMain")
	public void adminMain() {
		
	}
	
	@PostMapping("rentalList")
	public String rentalList(Model model) {
		ArrayList<RentalVO> arr=service.rentalList();
		model.addAttribute("arr", arr);
		return "/admin/RentalList";
	}
	
	@PostMapping("confirmCancel")
	@ResponseBody
	public int confirmCancel(int rno) {
		return service.confirmCancel(rno);
	}
	
	@PostMapping("accept")
	@ResponseBody
	public int accept(int rno) {
		return service.accept(rno);
	}
	
	@PostMapping("rconfirm")
	@ResponseBody
	public int rconfirm(int rno) {
		return service.rconfirm(rno);
	}
	
	@PostMapping("confirmReturn")
	@ResponseBody
	public int confirmReturn(int rno) {
		return service.confirmReturn(rno);
	}
}
