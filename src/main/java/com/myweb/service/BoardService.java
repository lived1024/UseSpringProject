package com.myweb.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.myweb.model.BoardVO;
import com.myweb.model.Criteria;

public interface BoardService {
	public void writeBoard(BoardVO bv);
	public ArrayList<BoardVO> getList(int kind, Criteria cri, int start, int end);
	public int countBoard(int kind, Criteria cri);
	public BoardVO boardView(int b_num, HttpServletRequest req);
	public void deleteBoard(int b_num);
	public void updateBoard(BoardVO bv);
}
