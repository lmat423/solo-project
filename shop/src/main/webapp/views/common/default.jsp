<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      margin:0px;
    }
    #first {
      width:100%;
      height:40px;
      line-height:40px;
      background:green;
      color:white;
    }
    #first #outer {
      width:1100px;
      margin:auto;
    }
    #first #left {
      display:inline-block;
      width:1060px;
      height:40px;
      line-height:40px;
      text-align:center;
    }
    #first #right {
      display:inline-block;
      width:30px;
      height:40px;
      line-height:40px;
      text-align:right;
    }
    header {
      width:1100px;
      height:60px;
      line-height:60px;
      margin:auto;
    }
    header #left {
      width:200px;
      height:60px;
      line-height:60px;
      display:inline-block;
    }
    header #search {
      width:560px;
      height:60px;
      line-height:60px;
      display:inline-block;
      text-align:center;
    }
    header #right {
      width:320px;
      height:60px;
      line-height:60px;
      display:inline-block;
      text-align:right;
    }
    header a {
      text-decoration:none;
      color:black;
    }
    
    header #mypage {
      position:relative;
      display:inline-block;
      height:60px;
 
    }
    header #mypagemenu {  /* ul태그 */
      position:absolute;
      padding-left:0px;
      left:-10px;
      top:30px;
      border:1px solid green;
      background:white;
      visibility:hidden;
    }
    header #mypagemenu li {
      list-style-type:none;
      width:80px;
      height:26px;
      line-height:26px;
      text-align:center;
    }
    nav {
      width:1100px;
      height:50px;
      line-height:50px;
      margin:auto;
    }
    nav #main {
      padding-left:5px;
      
    }
    nav #main > li {
       display:inline-block;
       margin-left:125px;
       font-size:17px;
       font-weight:900;
    }
    nav #main #all {      /* 전체카테고리 li태그 */
       margin-left:0px;
       position:relative;
       z-index:10;
    }
  
    nav #main #all .dae {  /* 대분류 ul태그 */
       position:absolute;
       padding-left:0px;
       left:-12px;
       width:120px;
       height:230px;
       background:white;
       visibility:hidden;
       border:1px solid  green;
    }
  
    nav #main #all .dae li {
       list-style-type:none;
       width:120px;
       height:30px;
       line-height:30px;
       margin-left:0px;
       text-align:center;
       position:relative;
    }
    nav #main #all .dae li:hover {
      background:#E8FFE2;
    }
    nav #main #all .dae .jung {
       position:absolute;
       width:120px;
       height:230px;
       background:white;
       left:120px;
       top:-1px;
       border:1px solid  green;
       margin-left:0px;
       padding-left:0px;
       visibility:hidden;
    }
    
    nav #main #all .dae .jung > li {
       margin-left:0px;
       width:120px;
       height:30px;
       position:relative;
    }
    nav #main #all .dae .jung > li:hover {
       background:#E8FFE2;
    }
    nav #main #all .dae .jung .so {
       position:absolute;
       width:120px;
       height:230px;
       background:white;
       left:120px;
       top:-1px;
       border:1px solid green;
       margin-left:0px;
       padding-left:0px;
       visibility:hidden;
    }
    nav #main #all .dae .jung .so li {
       margin-left:0px;
       width:120px;
       height:30px;
    }
    nav #main #all .dae .jung .so li:hover {
       background:#E8FFE2;
    }
    nav a {
      text-decoration:none;
      color:black;
    }
    footer {
      
      clear:both;
      width:1100px;
      height:200px;
      margin:auto;
      margin-top:60px;
    }
    
  </style>
   <sitemesh:write property="head"/> 
  <script>
    function daeview()
    {
    	document.getElementsByClassName("dae")[0].style.visibility="visible";
    }
    function daehide()
    {
    	document.getElementsByClassName("dae")[0].style.visibility="hidden";
    }
    
    function jungview(n,h)
    {
    	document.getElementsByClassName("jung")[n].style.visibility="visible";
    	document.getElementsByClassName("jung")[n].style.top="-"+h+"px";
    	
    }
    function junghide(n)
    {
    	document.getElementsByClassName("jung")[n].style.visibility="hidden";
    }
    
    function soview(n,h)
    {
    	document.getElementsByClassName("so")[n].style.visibility="visible";
    	document.getElementsByClassName("so")[n].style.top="-"+h+"px";
    	
    }
    function sohide(n)
    {
    	document.getElementsByClassName("so")[n].style.visibility="hidden";
    }
    
    function viewMypage()
    {
    	document.getElementById("mypagemenu").style.visibility="visible";
    }
    function hideMypage()
    {
    	document.getElementById("mypagemenu").style.visibility="hidden";
    }
  </script>
</head>
<body>
   <div id="first">
     <div id="outer">
      <div id="left"> 회원가입 후 첫 구매고객 이벤트 99%할인 해 드립니다.</div>
      <div id="right"> X </div>
     </div>
   </div>
   <header>
     <div id="left"> <a href="../main/main"> <img src="/static/main/logo.png" valign="middle" width="100" height="80"> </a> </div>
     <div id="search">검색창</div>
     <div id="right"> 
       <a href="../product/cartView"> <img src="/static/product/cart.png" width="20" valign="middle"> </a>  
       <c:if test="${userid == null}">
       | <a href="../member/login"> 로그인 </a> | <a href="../member/member"> 회원가입 </a>
       </c:if>
       <c:if test="${userid != null }"> 
        
        | <a href="../member/logout"> 로그아웃 </a>
        | <span id="mypage" onmouseover="viewMypage()" onmouseout="hideMypage()"> Mypage 
            <ul id="mypagemenu">
              <li> <a href="../mypage/myinfo"> 회원 정보 </a></li>
              <li> <a href="../mypage/mygumae"> 구매 내역 </a></li>
              <li> <a href="../mypage/mylist"> 나의 글 </a></li>
              <li> <a href="../product/jjimView"> 찜 확인 </a></li>
            </ul>
          </span>  <!-- 회원정보 , 구매내역 , 나의 글 , 찜리스트-->
       </c:if> 
        
         | <a href="../mypage/mtm"> 고객센터 </a>     
     
        
     </div>
   </header>
   <nav>
     <ul id="main">
       <li id="all" onmouseover="daeview()" onmouseout="daehide()"> 전체 카테고리 
         <ul class="dae">
           <li onmouseover="jungview(0,1)" onmouseout="junghide(0)"> <a href="../product/prolist?pcode=p01"> 가전제품 </a> 
             <ul class="jung">
               <li onmouseover="soview(0,1)" onmouseout="sohide(0)"> <a href="../product/prolist?pcode=p0101"> TV </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p010101"> 대형TV </a></li>
                   <li> <a href="../product/prolist?pcode=p010102"> 중형TV </a></li>
                   <li> <a href="../product/prolist?pcode=p010103"> 소형TV </a></li>
                   <li> <a href="../product/prolist?pcode=p010104"> 휴대용TV </a></li>
                 </ul>
               </li>
               <li onmouseover="soview(1,31)" onmouseout="sohide(1)"> <a href="../product/prolist?pcode=p0102"> 냉장고 </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p010201"> 양문형냉장고</a> </li>
                   <li> <a href="../product/prolist?pcode=p010202"> 김치냉장고 </a></li>
                   <li> <a href="../product/prolist?pcode=p010203"> 와인냉장고 </a></li>
                   <li> <a href="../product/prolist?pcode=p010204"> 소형냉장고 </a></li>
                 </ul>
               </li>
               <li onmouseover="soview(2,61)" onmouseout="sohide(2)"> <a href="../product/prolist?pcode=p0103"> 세탁기  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p010301"> 드럼세탁기 </a></li>
                   <li> <a href="../product/prolist?pcode=p010302"> 일반세탁기 </a></li>
                   <li> <a href="../product/prolist?pcode=p010303"> 미니세탁기 </a></li>
                   <li> <a href="../product/prolist?pcode=p010304"> 건조기 </a></li>
                 </ul>
               </li>
               <li onmouseover="soview(3,91)" onmouseout="sohide(3)"> <a href="../product/prolist?pcode=p0104"> 컴퓨터  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p010401"> 데스크탑 </a></li>
                   <li> <a href="../product/prolist?pcode=p010402"> 노트북 </a></li>
                   <li> <a href="../product/prolist?pcode=p010403"> 서 버 </a></li>
                   <li> <a href="../product/prolist?pcode=p010404"> 미니PC </a></li>
                 </ul>
               </li>
               <li onmouseover="soview(4,121)" onmouseout="sohide(4)"> <a href="../product/prolist?pcode=p0105"> 청소기  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p010501"> 유선청소기 </a></li>
                   <li> <a href="../product/prolist?pcode=p010502"> 무선청소기 </a></li>
                   <li> <a href="../product/prolist?pcode=p010503"> 휴대용청소기 </a></li>
                 </ul>
               </li>
             </ul>
           </li>
           <li onmouseover="jungview(1,31)" onmouseout="junghide(1)" > <a href="../product/prolist?pcode=p02"> 패션 </a>
             <ul class="jung">
               <li onmouseover="soview(5,1)" onmouseout="sohide(5)"> <a href="../product/prolist?pcode=p0201"> 남성의류  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p020101"> 양 복 </a></li>
                   <li> <a href="../product/prolist?pcode=p020102"> 스포츠 </a></li>
                   <li> <a href="../product/prolist?pcode=p020103"> 캐주얼 </a><li>
                 </ul>
               </li>
               <li onmouseover="soview(6,31)" onmouseout="sohide(6)"> <a href="../product/prolist?pcode=p0202"> 여성의류  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p020201"> 정 장 </a></li>
                   <li> <a href="../product/prolist?pcode=p020202"> 스포츠 </a></li>
                   <li> <a href="../product/prolist?pcode=p020203"> 캐주얼 </a></li>
                 </ul>
               </li>
               <li onmouseover="soview(7,61)" onmouseout="sohide(7)"> <a href="../product/prolist?pcode=p0203"> 아동의류  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p020301"> 캐주얼 </a></li>
                   <li> <a href="../product/prolist?pcode=p020302"> 스포츠 </a></li>
                   <li> <a href="../product/prolist?pcode=p020303"> 내 의 </a></li>
                 </ul>
               </li>
               <li onmouseover="soview(8,91)" onmouseout="sohide(8)"> <a href="../product/prolist?pcode=p0204"> 잡 화  </a>
                 <ul class="so">
                   <li> <a href="../product/prolist?pcode=p020401"> 가 방 </a></li>
                   <li> <a href="../product/prolist?pcode=p020402"> 핸드백 </a></li>
                   <li> <a href="../product/prolist?pcode=p020403"> 지 갑 </a></li>
                 </ul>
               </li>
             </ul> 
           </li>
           <li onmouseover="jungview(2,61)" onmouseout="junghide(2)"> 농수산물 
             <ul class="jung">
               <li> 농산물 </li>
               <li> 수산물 </li>
               <li> 축산물 </li>
               <li> 가공품 </li>
             </ul>
           </li>
           <li> 주방용품 </li>
           <li> 생활용품 </li>
           <li> 자동차용품 </li>
           <li> 스포츠/레저 </li>
         </ul>
       </li>
       <li> 신 상 품 </li>
       <li> 베 스 트 </li>
       <li> 특가상품 </li>
       <li> 이 벤 트 </li>  
       <li> 쿠폰잔치 </li>
     </ul>
   </nav>
   
   <sitemesh:write property="body"/>
   
   
   <footer>
      <img src="/static/main/footer.png">
   </footer>
</body>
</html>