package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.CrawlingVO;

public interface MainService {
	public ArrayList<CrawlingVO> betanews();	//��Ÿ���� ũ�Ѹ�
	public ArrayList<CrawlingVO> itWorld();		//IT WORLD ũ�Ѹ�
	public ArrayList<CrawlingVO> notebookcheck();	//��Ʈ���� ũ�Ѹ�
}
