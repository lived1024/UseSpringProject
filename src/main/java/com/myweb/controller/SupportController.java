package com.myweb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.service.SupportService;

@Controller
@RequestMapping("/support/*")
public class SupportController {
	
	@Inject
	private SupportService service;
	
	@GetMapping("supportMain")
	public void main() {
		
	}
}
