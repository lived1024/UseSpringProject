package com.myweb.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.model.LaptopVO;
import com.myweb.model.UserVO;
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
	public void applyRental(int lno, int surchange, HttpServletRequest req) {
		HttpSession session=req.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		String wid="";
		String nid="";
		if(uv.getNid().equals("")) {
			wid=uv.getWid();
		}
		if(uv.getWid().equals("")) {
			nid=uv.getNid();
		}
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lno",lno);
		hm.put("surchange",surchange);
		hm.put("wid",wid);
		hm.put("nid",nid);
		
		service.applyRental(hm);
	}
}
