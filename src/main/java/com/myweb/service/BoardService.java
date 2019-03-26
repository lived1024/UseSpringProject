package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.BoardVO;
import com.myweb.model.Criteria;

public interface BoardService {
	public void writeBoard(BoardVO bv);
	public ArrayList<BoardVO> getList(int kind, Criteria cri, int start, int end);
	public int countBoard(int kind, Criteria cri);
}
