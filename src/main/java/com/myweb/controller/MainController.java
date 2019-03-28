package com.myweb.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.mapper.MainMapper;
import com.myweb.model.CrawlingVO;
import com.myweb.service.MainService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	private MainService service;
	
	@Autowired
	private MainMapper mapper;
	
	@PostMapping("betanewsCrawling")
	public String crawling(Model model) {
		ArrayList<CrawlingVO> crawling=service.betanews();
		model.addAttribute("cr", crawling);
		return "main/betanews";
	}
	
	@PostMapping("itWorldCrawling")
	public String itWorldCrawling(Model model) {
		ArrayList<CrawlingVO> crawling=service.itWorld();
		model.addAttribute("cr", crawling);
		return "main/itWorld";
	}

	@PostMapping("notebookcheck")
	public String noteForumCrawling(Model model) {
		ArrayList<CrawlingVO> crawling=service.notebookcheck();
		model.addAttribute("cr", crawling);
		return "main/notebookcheck";
	}
}
