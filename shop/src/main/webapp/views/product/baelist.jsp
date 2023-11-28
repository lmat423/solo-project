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
    #top {
      position:fixed;
      left:0px;
      top:0px;
      width:100%;
      height:40px;
      line-height:40px;
      text-align:center;
      border-bottom:1px solid green;
      background:white;
    }
    #chuga {
      margin:auto;
      width:94%;
      height:40px;
      line-height:40px;
      text-align:center;
      border:1px solid green;
      background:white;
      font-size:18px;
      margin-top:10px;
    }
    #imsi {
      margin-top:40px;
    }
    .baejuso {
      width:90%;
      height:165px;
      border:1px solid green;
      margin:auto;
      margin-top:10px;
      padding:10px;
      
    }
    .baejuso > div {
      margin-top:8px;
    }
    .baejuso #gibon {
      border:1px solid green;
      padding:2px;
      border-radius:10px;
      font-size:12px;
    }
    #leftbtn , #rightbtn {
     height:24px;
     border:1px solid green;
     background:green;
     color:white;
     cursor:pointer;
     vertical-align:top;
     border-radius:2px;
  }
 
 </style>
 <script>
  function move(n,no)
  {
	  opener.document.getElementById("name").innerHTML=document.getElementsByClassName("name")[n].innerHTML;
	  opener.document.getElementById("juso").innerText=document.getElementsByClassName("juso")[n].innerText;
	  opener.document.getElementById("phone").innerText=document.getElementsByClassName("phone")[n].innerText;
	  opener.document.getElementById("req").innerText=document.getElementsByClassName("req")[n].innerText;
	  
	  // baesong테이블의 no값을 전달
	  opener.document.getElementById("baeno").value=no;
	  
	  close();
  }
 </script>
</head>
<body>
   <div id="top"> 배송지 선택 </div>
   <div id="imsi">&nbsp;</div> 
   <c:if test="${blist.size()==0}">
   <div align="center"> 배송주소가 없습니다. </div>
   </c:if>
  <c:forEach items="${blist}" var="bvo" varStatus="sts">
   <div class="baejuso">
     <div class="name">
         ${bvo.name} 
      <c:if test="${bvo.gibon==1}">
        <span id="gibon">기본배송지</span>
      </c:if>
     </div> 
     <div class="juso"> ${bvo.juso} ${bvo.jusoEtc}   </div> 
     <div class="phone"> ${bvo.phone} </div>   
     <div class="req"> 
       <c:if test="${bvo.req==0}">
        문 앞
       </c:if>
       <c:if test="${bvo.req==1}">
        직접 받고 부재시 문 앞
       </c:if>
       <c:if test="${bvo.req==2}">
        경비실
       </c:if>
       <c:if test="${bvo.req==3}">
        택배함
       </c:if>
     </div>  
     <div> 
       <div id="left" style="float:left;"> <input type="button" id="leftbtn" value="수정" onclick="location='baeUpdate?no=${bvo.no}'"> </div>
       <div id="right" style="float:right;"> <input type="button" id="rightbtn" value="선택" onclick="move(${sts.index},${bvo.no})"> </div>
     </div>
   </div>
  </c:forEach>
   
   <div id="chuga" onclick="location='baeWrite'"> 배송지 추가 </div>
</body>
</html>




