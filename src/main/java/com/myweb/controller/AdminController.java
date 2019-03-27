package com.myweb.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.mapper.AdminMapper;
import com.myweb.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private AdminService service;
	
	@Autowired
	private AdminMapper mapper;
	
	@GetMapping("adminMain")
	public void adminMain() {
		
	}
	
	@PostMapping
	@ResponseBody
	public int pwcheck(String pwd) {
		
		return service.pwcheck(pwd);
	}
}
