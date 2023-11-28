package com.example.demo.util;

public class TTT {

	public static void main(String[] args) {
		// 몇자리 인줄 몰라도 자동으로 3자리로 만들기
		int a=1;
		System.out.println( String.format("%04d",a) );
		
		a=12;
		System.out.println( String.format("%04d",a) );
		
		a=215;
		System.out.println( String.format("%04d",a) );

	}

}
