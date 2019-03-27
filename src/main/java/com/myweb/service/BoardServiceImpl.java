package com.myweb.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.mapper.BoardMapper;
import com.myweb.model.BoardVO;
import com.myweb.model.CommentVO;
import com.myweb.model.Criteria;
import com.myweb.model.UserVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper mapper;

	@Override
	public void writeBoard(BoardVO bv) {
		// TODO Auto-generated method stub
		mapper.writeBoard(bv);
	}

	@Override
	public ArrayList<BoardVO> getList(int kind, Criteria cri, int start, int end) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("kind",kind);
		hm.put("cri",cri);
		hm.put("start", start);
		hm.put("end",end);
		return mapper.getList(hm);
	}

	@Override
	public int countBoard(int kind, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.countBoard(kind, cri);
	}

	@Transactional
	@Override
	public BoardVO boardView(int b_num, HttpServletRequest req) {
		// TODO Auto-generated method stub
		BoardVO bv=mapper.boardView(b_num);
		
		//작성자가 아닐 경우에만 조회수 +1
		HttpSession session=req.getSession();
		UserVO uv=(UserVO) session.getAttribute("uv");
		if(uv.getWid() != null || uv.getWid() != "") {
			if(uv.getWid() != bv.getWid()) {
				mapper.addCount(b_num);
			}
		}else if(uv.getNid() != null || uv.getNid() != ""){
			if(uv.getEmail() != bv.getEmail()) {
				mapper.addCount(b_num);
			}
		}
		return bv;
	}

	@Override
	public void deleteBoard(int b_num) {
		// TODO Auto-generated method stub
		mapper.deleteBoard(b_num);
	}

	@Override
	public void updateBoard(BoardVO bv) {
		// TODO Auto-generated method stub
		mapper.updateBoard(bv);
	}

	@Override
	public void insertComment(CommentVO cv) {
		// TODO Auto-generated method stub
		mapper.insertComment(cv);
	}

	@Override
	public ArrayList<CommentVO> commentList(int b_num) {
		// TODO Auto-generated method stub
		return mapper.commentList(b_num);
	}
	
	
}
