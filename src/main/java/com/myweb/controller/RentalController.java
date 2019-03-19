package com.myweb.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.model.LaptopVO;
import com.myweb.service.RentalServiceImpl;

@Controller
@RequestMapping("/rental/*")
public class RentalController {
	@Inject
	private RentalServiceImpl service;
	
	@GetMapping("main")
	public void main() {
		
	}
	
	@RequestMapping("getList")
	public String moveRental(String kind, String field, Model model) {
		ArrayList<LaptopVO> list=service.list(kind,field);
		model.addAttribute("list", list);
		return "/rental/getListPage";
	}
	
}
