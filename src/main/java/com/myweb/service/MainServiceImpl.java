package com.myweb.service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.MainMapper;
import com.myweb.model.CrawlingVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mapper;

	@Override
	public ArrayList<CrawlingVO> betanews() {
		// TODO Auto-generated method stub
		Document doc;
		ArrayList<CrawlingVO> crawling = new ArrayList<>();
		String content = "";
		String tag = "";
		
		try {
			doc=Jsoup.connect("http://www.betanews.net/bbs/list.html?tkind=1&lkind=3&gnb_newslist").get();
			Elements newsTitle=doc.select("li.vtl");
			Elements news=newsTitle.select("dl dt a");
			Elements a = newsTitle.select("dl dt");
			
			for(int i=0;i<news.size();i++) {
				content += news.get(i).text() + " / ";
				tag += "http://www.betanews.net"+news.get(i).attr("href") + " / ";
			}
			// 뉴스 제목
			String[] title = content.split(" / ");
			// 뉴스 <a> 태그
			String[] tags = tag.split(" / ");
			
			for(int i=0;i<title.length;i++) {
				CrawlingVO cv = new CrawlingVO();
				cv.setTitle(title[i]);
				cv.setAddress(tags[i]);
				crawling.add(cv);
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return crawling;
	}

	@Override
	public ArrayList<CrawlingVO> itWorld() {
		// TODO Auto-generated method stub
		Document doc;
		ArrayList<CrawlingVO> crawling=new ArrayList<>();
		String content = "";
		String tag = "";
		
		try {
			doc=Jsoup.connect("http://www.itworld.co.kr/news").get();
			Elements list = doc.select("div.sub_list_ div h4 a");
			for(int i=0;i<list.size();i++) {
				content += list.get(i).text() + " / ";
				tag += "http://www.itworld.co.kr"+list.get(i).attr("href") + " / ";
			}
			String[] title = content.split(" / ");
			String[] href = tag.split(" / ");
			
			for(int i=0;i<title.length;i++) {
				CrawlingVO cv=new CrawlingVO();
				cv.setTitle(title[i]);
				cv.setAddress(href[i]);
				crawling.add(cv);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return crawling;
	}

	@Override
	public ArrayList<CrawlingVO> notebookcheck() {
		// TODO Auto-generated method stub
		Document doc;
		ArrayList<CrawlingVO> arr=new ArrayList<>();
		String content="";
		String tag="";
		try {
			doc=Jsoup.connect("https://www.notebookcheck.net/Reviews.55.0.html").get();
			Elements list=doc.select(".introa_title");
			Elements tags=doc.select("#introa_content_1824503 a");
			
			for(int i=0;i<5;i++) {
				content += list.get(i).text() + " / ";
				tag += tags.get(i).attr("href") + " / ";
			}
			
			String[] title=content.split(" / ");
			String[] href=tag.split(" / ");
			
			for(int i=0;i<title.length;i++) {
				title[i] = title[i].substring(4);
				CrawlingVO cv=new CrawlingVO();
				cv.setTitle(title[i]);
				cv.setTitle(title[i]);
				arr.add(cv);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
}
