package com.myweb.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.model.BoardVO;
import com.myweb.model.UserVO;
import com.myweb.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private BoardService service;
	
	@RequestMapping("boardMain")
	public void boardMain(int list, Model model) {
		model.addAttribute("list",list);
	}
	
	@GetMapping("writeForm")
	public void writeForm() {
		
	}
	
	@PostMapping("writeForm")
	public void writeBoard(MultipartFile b_file, String b_subject, String b_content, HttpServletRequest req) {
		BoardVO bv=new BoardVO();
		bv.setB_file(b_file.getOriginalFilename());
		bv.setB_subject(b_subject);
		
		b_content=b_content.replace("\r\n", "<br>");
		
		bv.setB_content(b_content);
		
		HttpSession session=req.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		
		bv.setWid(uv.getWid());
		bv.setNid(uv.getNid());
		
		service.writeBoard(bv);
		
		String uploadFolder="c:\\SpringImg";
		File saveFile = new File(uploadFolder, b_file.getOriginalFilename());
		try {
			b_file.transferTo(saveFile);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
