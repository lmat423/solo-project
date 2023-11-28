package com.example.demo.util;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class Date_Ex {

	public static void main(String[] args) {
		Date today1=new Date();
		System.out.println(today1.getDay()); // 일~토 , 0~6

		Calendar today2=Calendar.getInstance();
		System.out.println(today2.get(Calendar.DAY_OF_WEEK)); // 일~토 , 1~7
		
		LocalDate today3=LocalDate.now();
		System.out.println(today3.getDayOfWeek().getValue()); // 월~일 , 1~7
	}

}
