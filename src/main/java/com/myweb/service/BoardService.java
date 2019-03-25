package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.BoardVO;

public interface BoardService {
	public void writeBoard(BoardVO bv);
	public ArrayList<BoardVO> getList(int kind);
	
}
