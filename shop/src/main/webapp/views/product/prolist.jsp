<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      
      width:1100px;
      margin:auto;
      margin-top:30px;
    }
    
    section .pro {
      width:250px;
      height:420px; 
      border:1px solid #cccccc;
      display:table-cell;
      padding-left:5px;
    }
    section .pro div {
      font-size:14px;
    }
    section .line {
      width:1100px;
      height:420px;
      margin:auto;
      display:table;
      border-spacing:5px;
    }
    section #jukline {
      display:inline;
      padding:2px;
      padding-left:8px;
      padding-right:8px;
      border:1px solid #cccccc;
      border-radius:10px;
    }
    section #sectiontop {
      width:1100px;
      height:40px;
      margin-left:6px;
      font-size:12px;
    }
    section #sectiontop span {
      cursor:pointer;
      margin-left:15px;
    }
  </style>
  <script>
    function listChange(num)
    {
    	location="prolist?pcode=${pcode}&num="+num;
    }
    window.onload=function()
    {
    	document.getElementsByClassName("order")[${num-1}].style.color="blue";
    }
  </script>
</head>
<body> <!-- prolist.jsp -->
 <section>
    <div id="sectiontop" align="left"> <!-- 현재 보는 상품들의  대-중-소를 출력하기 -->
      ${sectiontop} &nbsp;&nbsp;&nbsp;
      <span class="order" id="lprice" onclick="listChange(1)"> 낮은가격순 </span>
      <span class="order" id="hprice" onclick="listChange(2)"> 높은가격순 </span>
      <span class="order" id="pansu" onclick="listChange(3)"> 판매량순 </span>
      <span class="order" id="new" onclick="listChange(4)"> 최신순 </span>
    </div>
    <div class="line">
  <c:forEach items="${plist}" var="pvo" varStatus="no"> <!-- no.index , no.count -->
     <c:if test="${pvo.su==0}">
      <div class="pro" style="background:#eeeeee">
     </c:if>
     <c:if test="${pvo.su!=0 }">
      <div class="pro" onclick="location='procontent?pcode=${pvo.pcode}'">
     </c:if>
        <div align="center"> <img src="/static/pro/${pvo.pimg}" width="250" height="250"> </div>
        <div style="font-size:12px;">  
          <c:if test="${pvo.bprice == 0}">
            무료배송
          </c:if>
          <c:if test="${pvo.bprice != 0}">
            &nbsp;
          </c:if>
        </div>
        <div>  ${pvo.title} </div>   
        <div style="font-size:12px;"> 
          <c:if test="${pvo.halin != 0}">        
           ${pvo.halin}% <s> <fmt:formatNumber value="${pvo.price}" type="number"/> </s>
          </c:if> 
        </div>
        <div style="font-size:16px;color:red;font-weight:900"> <!-- 판매가격 : 상품가격-(상품가격*(할인율/100))           -->
         <fmt:formatNumber  value="${pvo.price-(pvo.price*(pvo.halin/100) )}" type="number" pattern="#,###"/>원      
        </div>
        <div>
          <c:if test="${pvo.su == 0}">
            <b style="color:red"> 상품품절 </b>
          </c:if>
          <c:if test="${pvo.su != 0}">
            ${pvo.writeday}(${pvo.yoil}) 도착예정
          </c:if>
          
        </div>
        <div style="letter-spacing:-3px;"> <!-- 별점 : double형 -->
          <!-- 노란별 -->
          <c:forEach begin="1" end="${pvo.ystar}">
            <img src="/static/product/star1.png" width="10">
          </c:forEach>
          <!-- 반별 -->
          <c:if test="${pvo.banstar==1}">
            <img src="/static/product/star3.png" width="10">
          </c:if>
          <!-- 회색별 -->
          <c:forEach begin="1" end="${pvo.gstar}">
            <img src="/static/product/star2.png" width="10">
          </c:forEach>
        </div>
        <div style="font-size:12px;margin-top:5px;"> <!-- 적립금 : 상품평쓰기 100원-->
          <div id="jukline">
           <img src="/static/product/juk.png" valign="top"> 최대 <fmt:formatNumber value="${pvo.price*(pvo.juk/100)+100}" type="number" pattern="#,###"/>원 적립
          </div>
        </div>
        
      </div>
      
     <!-- 마지막 라인에 4개 아니라면 빈칸으로 채우기 -->
      <c:if test="${no.last}"> <!-- 모든 레코드를 forEach가 끝났다면 -->
        <c:set var="ck" value="${no.count%4}"/> <!-- 마지막 행이 몇개 출력되었는지 확인 -->
       <c:if test="${ck!=0}">  <!-- ck가 0이면 마지막 행에 4개가 출력 되었다 -->
        <c:forEach begin="${ck+1}" end="4"> <!-- ck의 수가 출력된 상품의 수 -->
          <div class="pro" style="border:none;">&nbsp;</div>
        </c:forEach>
       </c:if>
      </c:if>  
  
   <c:if test="${no.count%4 == 0}"> <!-- 상품 4개가 출력되면 -->
    </div>
     <c:if test="${!no.last}">
       <div class="line">
     </c:if>
   </c:if>
     
  </c:forEach>
  </div>
  
  <div id="pagechul">
   
   <!-- 10페이지 이전으로  -->
   <c:if test="${pstart != 1}">
    <a href="prolist?pcode=${pcode}&page=${pstart-1}"> << </a>
   </c:if>
   <c:if test="${pstart == 1}">
    <<
   </c:if>   
   <!-- 1페이지 왼쪽(이전)으로 -->
   <c:if test="${page != 1}"> 
    <a href="prolist?pcode=${pcode}&page=${page-1}"> < </a>
   </c:if>
   <c:if test="${page == 1}"> 
    <
   </c:if> 
   
     <c:forEach begin="${pstart}" end="${pend}" var="i">
       <c:set var="nowpage" value=""/>
       <c:if test="${i==page}"> <!-- 현재페이지는 빨간색 -->
          <c:set var="nowpage" value="style='color:red'"/>
       </c:if>
        <a href="prolist?page=${i}&pcode=${pcode}" ${nowpage}> ${i} </a>  
     </c:forEach>
     
     
   <!-- 1페이지 오른쪽(다음)으로 -->
   <c:if test="${page != chong}"> 
    <a href="prolist?pcode=${pcode}&page=${page+1}"> > </a>  
   </c:if>
   <c:if test="${page == chong}"> 
    >
   </c:if> 
   
   <!-- 10페이지 다음으로 -->
   <c:if test="${pend != chong}"> 
     <a href="prolist?pcode=${pcode}&page=${pend+1}"> >> </a>
   </c:if>
   <c:if test="${pend == chong}"> 
     >>
   </c:if>  
  </div>
  
  <style>
    #pagechul {
      width:1100px;
      height:80px;
      line-height:80px;
      text-align:center;
    }
    #pagechul a {
      text-decoration:none;
      color:black;
      display:inline-block;
      width:30px;
    }
  </style>
 </section>
</body>
</html> 














