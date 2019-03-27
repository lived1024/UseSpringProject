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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.model.BoardVO;
import com.myweb.model.CommentVO;
import com.myweb.model.Criteria;
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
	
	@GetMapping("boardList")
	public String boardList(int kind, Criteria cri, Model model) {
		//페이지 설정
		int count=service.countBoard(kind,cri);
		int totpage=count/cri.getAmount()+(count%cri.getAmount()==0?0:1);
		
		if(cri.getPageNum()<=1) { cri.setPageNum(1);	}
		if(cri.getPageNum()>=totpage) {	cri.setPageNum(totpage);	}
		
		int start=(cri.getPageNum()-1)*cri.getAmount()+1;
		int end=cri.getPageNum()*cri.getAmount();
		
		int blockpage=5;		//페이지 출력 갯수
		int startPage=cri.getPageNum()-2;
		if(startPage<=1) {	startPage=1;	}
		
		int endPage=startPage+blockpage-1;
		if(endPage>totpage) {	endPage=totpage;	}
		
		ArrayList<BoardVO> arr=service.getList(kind, cri, start, end);
		for(int i=0;i<arr.size();i++) {
			if(arr.get(i).getWid()==null || arr.get(i).getWid()=="") {
				//네이버 로그인의 경우 이메일의 아이디로 글을 남기도록 한다!
				String[] email=arr.get(i).getEmail().split("@");
				String nickname=email[0];
				arr.get(i).setEmail(nickname);
			}
		}
		
		model.addAttribute("arr",arr);
		model.addAttribute("cri",cri);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("totpage",totpage);
		model.addAttribute("blockpage",blockpage);
		model.addAttribute("list",kind);
		
		return "/board/boardListView";
	}
	
	@GetMapping("view")
	public String boardView(int b_num, Criteria cri, Model model, HttpServletRequest req) {
		BoardVO bv=service.boardView(b_num, req);
		model.addAttribute("bv",bv);
		model.addAttribute("cri",cri);
		return "/board/boardView";
	}
	
	@GetMapping("deleteBoard")
	public String deleteBoard(int b_num, int kind, Model model) {
		service.deleteBoard(b_num);
		model.addAttribute("list", kind);
		return "/board/boardMain";
	}
	
	@PostMapping("updateBoard")
	@ResponseBody
	public int updateBoard(MultipartFile b_file, String b_subject, String b_content, int b_kind, int b_num) {
		BoardVO bv=new BoardVO();
		if(b_file != null) {
			bv.setB_file(b_file.getOriginalFilename());
		}
		bv.setB_num(b_num);
		bv.setB_subject(b_subject);
		bv.setB_kind(b_kind);			// 자유게시판 분류 3
		
		b_content=b_content.replace("\r\n", "<br>");
		
		bv.setB_content(b_content);
		
		service.updateBoard(bv);
		if(b_file != null) {			
			String uploadFolder="c:\\SpringImg";
			File saveFile = new File(uploadFolder, b_file.getOriginalFilename());
			try {
				b_file.transferTo(saveFile);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return 1;
	}
	
	@GetMapping("insertComment")
	public String insertComment(int b_num, String c_comment, HttpServletRequest req) {
		CommentVO cv=new CommentVO();
		cv.setB_num(b_num);
		cv.setC_comment(c_comment);
		
		HttpSession session=req.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		
		if(uv.getWid()==null || uv.getWid()=="") {
			cv.setEmail(uv.getEmail());
		}else if(uv.getWid()!=null || uv.getWid() != "") {
			cv.setWid(uv.getWid());
		}
		//댓글 입력
		service.insertComment(cv);
		//댓글 불러오기로 연결!	콘트롤러로 바로 연결하기때문에 파라미터값을 수동으로 설정해준다!
		return "redirect:/board/callCommentList?b_num="+b_num;
	}
	
	@GetMapping("callCommentList")
	public String callCommentList(String b_num, Model model) {
		int bnum=Integer.parseInt(b_num);
		ArrayList<CommentVO> carr=service.commentList(bnum);
		model.addAttribute("carr", carr);
		return "/board/commentList";
	}
}
