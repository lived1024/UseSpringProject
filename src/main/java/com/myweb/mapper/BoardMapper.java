package com.myweb.mapper;

import java.util.ArrayList;

import com.myweb.model.BoardVO;

public interface BoardMapper {
	public void writeBoard(BoardVO bv);
	public ArrayList<BoardVO> getList(int kind);
}
