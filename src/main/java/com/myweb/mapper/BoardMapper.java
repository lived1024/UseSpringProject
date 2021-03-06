package com.myweb.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.BoardVO;
import com.myweb.model.CommentVO;
import com.myweb.model.Criteria;

public interface BoardMapper {
	public void writeBoard(BoardVO bv);
	public ArrayList<BoardVO> getList(HashMap<String, Object> hm);
	public int countBoard(@Param("kind")int kind, @Param("cri")Criteria cri);
	public BoardVO boardView(int b_num);
	public void addCount(int b_num);
	public void deleteBoard(int b_num);
	public void updateBoard(BoardVO bv);
	public void insertComment(CommentVO cv);
	public ArrayList<CommentVO> commentList(int b_num);		//��� ����Ʈ
}