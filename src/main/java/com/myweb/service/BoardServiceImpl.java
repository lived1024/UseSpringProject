package com.myweb.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.mapper.BoardMapper;
import com.myweb.model.BoardVO;
import com.myweb.model.Criteria;

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
	public BoardVO boardView(int b_num) {
		// TODO Auto-generated method stub
		mapper.addCount(b_num);
		return mapper.boardView(b_num);
	}
}
