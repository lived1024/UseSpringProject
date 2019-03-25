package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.BoardMapper;
import com.myweb.model.BoardVO;

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
	public ArrayList<BoardVO> getList(int kind) {
		// TODO Auto-generated method stub
		return mapper.getList(kind);
	}
}