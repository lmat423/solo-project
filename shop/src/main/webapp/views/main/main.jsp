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
      margin:auto;
    }
    section #slideimg {
      width:1800px;
      height:300px;
      margin:auto;
      background:red;
    }
    section #newpro {
      width:1100px;
      height:300px;
      margin:auto;
    }
    section #best {
      width:1100px;
      height:300px;
      margin:auto;
    }
    section #sale {
      width:1100px;
      height:300px;
      margin:auto;
    }
    section #event {
      width:1100px;
      height:300px;
      margin:auto;
    }
    
    section .pro {
       display:table-cell;
       width:220px;
       
    }
    
    section h3 {
      border-bottom:2px solid green;
      margin-top:60px;
    }
    section .sang {
      margin-top:100px;
    }
  </style>
</head>
<body>
  <section>
      <!-- 슬라이딩 되는 이미지 -->
      <div id="slideimg">
        <img src="/static/main/1.png" width="1800" height="300">
      </div>
      <!-- 신규상품 -->
      <div id="newpro" class="sang">
        <h3> 신 상 품 </h3>
        <c:forEach items="${newlist}" var="pvo">
           <div class="pro">
              <div align="center"> <img src="/static/pro/${pvo.pimg}" width="214" height="200"> </div>
              <div> ${pvo.title} </div>
              <div> <fmt:formatNumber value="${pvo.price}" type="number"/></div>
           </div>
        </c:forEach>
      </div>
      <!-- 인기상품 -->
      <div id="best" class="sang">
        <h3> 인기 상품 </h3>
        <c:forEach items="${bestlist}" var="pvo">
           <div class="pro">
              <div align="center"> <img src="/static/pro/${pvo.pimg}" width="214" height="200"> </div>
              <div> ${pvo.title} </div>
              <div> <fmt:formatNumber value="${pvo.price}" type="number"/></div>
           </div>
        </c:forEach>
      </div>
      <!-- 특가상품 -->
      <div id="sale" class="sang">
        <h3> 특가 상품 </h3>
        <c:forEach items="${salelist}" var="pvo">
           <div class="pro">
              <div align="center"> <img src="/static/pro/${pvo.pimg}" width="214" height="200"> </div>
              <div> ${pvo.title} </div>
              <div> <fmt:formatNumber value="${pvo.price}" type="number"/></div>
           </div>
        </c:forEach>
      </div>
      <!-- 이벤트 -->
      <div id="event" class="sang">
        <h3> 이 벤 트 </h3>
        <c:forEach items="${eventlist}" var="pvo">
           <div class="pro">
              <div align="center"> <img src="/static/pro/${pvo.pimg}" width="214" height="200"> </div>
              <div> ${pvo.title} </div>
              <div> <fmt:formatNumber value="${pvo.price}" type="number"/></div>
           </div>
        </c:forEach>
      </div>
   </section>
  
</body>
</html>
  
  
  
  
  
  
  
  
  