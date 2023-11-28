package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BookVo;
import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {
    public int useridCheck(MemberVo mvo);
    public void memberOk(MemberVo mvo);
    public MemberVo loginOk(MemberVo mvo);
    public void addjjim(String pcode, String userid);
    public void addCart(String pcode,String su,String userid);
    
 // 예제
    public ArrayList<MemberVo> member();
    public MemberVo getMember(String userid);
    public int getCode(String code);
    public void bookAdd(BookVo bvo);
    
  // 달력예제
   public ArrayList<HashMap> getCal(String day);
   public ArrayList<HashMap> getCal2(String day);
   
   // 쿠키에 있던 상품을 cart에 저장
   //public void setCart(String pcode,String userid,String su);
   
   public void isTest();
   
   public void chgState(String no);
}
