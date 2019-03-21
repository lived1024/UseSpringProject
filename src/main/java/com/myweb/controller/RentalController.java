package com.myweb.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.model.LaptopVO;
import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;
import com.myweb.service.RentalService;

@Controller
@RequestMapping("/rental/*")
public class RentalController {
	@Inject
	private RentalService service;
	
	@GetMapping("main")
	public void main() {
		
	}
	
	@RequestMapping("getList")
	public String moveRental(String kind, String field, Model model) {
		ArrayList<LaptopVO> list=service.list(kind,field);
		model.addAttribute("list", list);
		return "/rental/getListPage";
	}
	
	@RequestMapping("detail")
	public String getDetail(int lno ,String kind, String field, Model model) {
		model.addAttribute("lv", service.getDetail(lno));
		model.addAttribute("kind", kind);
		model.addAttribute("field", field);
		model.addAttribute("view", 1);
		return "/rental/main";
	}
	
	@RequestMapping("price")
	public void priceWin() {
		
	}
	
	@RequestMapping("apply")
	@ResponseBody
	public String applyRental(RentalVO rv, HttpServletRequest req) {
		HttpSession session=req.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		String wid="";
		String nid="";
		if(!uv.getNid().equals("")) {
			nid=uv.getNid();
		}
		if(!uv.getWid().equals("")) {
			wid=uv.getWid();
		}
		
		int total=rv.getTotalprice()*rv.getR_count();
		
		rv.setNid(nid);
		rv.setWid(wid);
		rv.setTotalprice(total);
		
		service.applyRental(rv);
		return "신청 완료";
	}
}
