package com.example.demo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MemberMapper;

@Service
public class Schedule {
	
	@Autowired
	private MemberMapper mapper;
    /*
	@Scheduled(fixedDelay=1000) // fixedRate
	public void firstSchedule()
	{
		System.out.println("안녕하세요1");
	}
	
	@Scheduled(cron="0 00 12 * * *")  // 초 분 시 일 월 요일(0~6)  
	public void secondSchedule()
	{
		System.out.println("토요일");
	}
	*/
	
	@Scheduled(cron="0 16 14 * * *")  // 초 분 시 일 월 요일(0~6)  
	public void secondSchedule()
	{
		mapper.isTest();
	}
}
