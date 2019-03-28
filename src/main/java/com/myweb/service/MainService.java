package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.CrawlingVO;

public interface MainService {
	public ArrayList<CrawlingVO> betanews();	//베타뉴스 크롤링
	public ArrayList<CrawlingVO> itWorld();		//IT WORLD 크롤링
	public ArrayList<CrawlingVO> notebookcheck();	//노트포럼 크롤링
}
