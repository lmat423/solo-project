package com.example.demo.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.BookVo;
import com.example.demo.vo.MemberVo;

@Controller
public class TestController {
    
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("/test/member")
	public String member(Model model)
	{
		model.addAttribute("mlist",mapper.member());
		return "/test/member";
	}
	
	@RequestMapping("/test/member2")
	public String member2(Model model)
	{
		model.addAttribute("mlist",mapper.member());
		return "/test/member2";
	}
	
	@RequestMapping("/test/getMember")
	public @ResponseBody MemberVo getMember(HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		MemberVo mvo=mapper.getMember(userid);
		return mvo;
	}
	
	@RequestMapping("/test/bookwrite")
	public String bookwrite()
	{
		return "/test/bookwrite";
	}
	
	@RequestMapping("/test/bookAdd")
	public String bookAdd(BookVo bvo)
	{
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		String mm=String.format("%02d", m);
		int d=today.getDayOfMonth();
		String dd=String.format("%02d", d);
		
		String code="b"+y+mm+dd;   // b20230828  => 2023828
		System.out.println(code);
		
		int num=mapper.getCode(code);  // 2
		code=code+String.format("%03d", num); 
		                 // 002
		bvo.setBookcode(code); 
		
		mapper.bookAdd(bvo);
		return null;
	}
	
	@RequestMapping("/test/cal")
	public String cal(Model model)
	{
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		LocalDate xday=LocalDate.of(y, m, 1);
		
		int chong=xday.lengthOfMonth();
		int yoil=xday.getDayOfWeek().getValue();
		int ju= (int)Math.ceil( (chong+yoil)/7.0 );
		
		model.addAttribute("chong",chong);
		model.addAttribute("yoil",yoil);
		model.addAttribute("ju",ju);
		return "/test/cal";
	}
	
	@RequestMapping("/test/yd")
	public String yd()
	{
		return "/test/yd";
	}
	
	@RequestMapping("/test/caljs")
	public String caljs()
	{
		return "/test/caljs";
	}
	
	@RequestMapping("/test/caljs2")
	public String caljs2()
	{
		return "/test/caljs2";
	}
	
	@RequestMapping("/test/caljs3")
	public String caljs3()
	{
		return "/test/caljs3";
	}
	@RequestMapping("/test/caljs4")
	public String caljs4()
	{
		return "/test/caljs4";
	}
	
	@RequestMapping("/test/caljs22")
	public String caljs22()
	{
		return "/test/caljs22";
	}
	
	@RequestMapping("/test/getCal")
	public @ResponseBody ArrayList<HashMap> getCal(HttpServletRequest request)
	{
		String y=request.getParameter("y");
		int m=Integer.parseInt( request.getParameter("m") );
		String mm=String.format("%02d", m);
				 
		ArrayList<HashMap> mapall=mapper.getCal(y+"-"+mm);  // 2023-09
		
		return mapall;
	}
	@RequestMapping("/test/getCal2")
	public @ResponseBody ArrayList<HashMap> getCal2(HttpServletRequest request)
	{
		String y=request.getParameter("y");
		int m=Integer.parseInt( request.getParameter("m") );
		String mm=String.format("%02d", m);
				 
		ArrayList<HashMap> mapall=mapper.getCal2(y+"-"+mm);  // 2023-09
		
		return mapall;
	}
	

	@RequestMapping("/test/cal4")
	public String cal4()
	{
		return "/test/cal4";
	}
}












