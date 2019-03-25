package com.myweb.controller;

import java.io.File;
import java.util.ArrayList;

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
	public void writeBoard(MultipartFile b_file, String b_subject, String b_content, int b_kind, HttpServletRequest req) {
		BoardVO bv=new BoardVO();
		if(b_file != null) {
			bv.setB_file(b_file.getOriginalFilename());
		}
		bv.setB_subject(b_subject);
		bv.setB_kind(b_kind);			// 자유게시판 분류 3
		
		b_content=b_content.replace("\r\n", "<br>");
		
		bv.setB_content(b_content);
		
		HttpSession session=req.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		
		if(uv.getWid()==null || uv.getWid()=="") {
			bv.setEmail(uv.getEmail());
		}else if(uv.getWid()!=null || uv.getWid() != "") {
			bv.setWid(uv.getWid());
		}
		
		service.writeBoard(bv);
		if(b_file != null) {			
			String uploadFolder="c:\\SpringImg";
			File saveFile = new File(uploadFolder, b_file.getOriginalFilename());
			try {
				b_file.transferTo(saveFile);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	@PostMapping("boardList")
	public String boardList(int kind, Model model) {
		ArrayList<BoardVO> arr=service.getList(kind);
		for(int i=0;i<arr.size();i++) {
			if(arr.get(i).getWid()==null || arr.get(i).getWid()=="") {
				//네이버 로그인의 경우 이메일의 아이디로 글을 남기도록 한다!
				String[] email=arr.get(i).getEmail().split("@");
				String nickname=email[0];
				arr.get(i).setEmail(nickname);
			}
		}
		model.addAttribute("arr",arr);
		return "/board/boardListView";
	}
}
