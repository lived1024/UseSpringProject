package com.myweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.SupportMapper;

@Service
public class SupportServiceImpl implements SupportService{
	
	@Autowired
	private SupportMapper mapper;
}
