<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section .content {
      width:500px;
      height:50px;
      border:1px solid green;
      outline:none;
    }
    section table {
      border-spacing:0px;
    }
    section table caption {
      text-align:left;
      margin-top:40px;
      border-bottom:3px solid green;
    }
    section table tr td {
      height:80px;
      border-bottom:1px solid green;
      font-size:14px;
 
   
    }
    section table tr:last-child td {
      border-width:3px;
    }
    section table img {
      margin-left:-3px;
    }
    
    section .rtitle {
      border:none;
      outline:none;
    }
  </style>
  <script>
    function rupdate(n)
    {
    	var rtitle=document.getElementsByClassName("rtitle");
    	for(i=0;i<rtitle.length;i++) // 모든 속성을 지우기
    	{
    		document.getElementsByClassName("rtitle")[i].readOnly=true;
    		document.getElementsByClassName("rtitle")[i].style.border="none";
    		document.getElementsByClassName("content")[i].readOnly=true;
    	}
    	
    	document.getElementsByClassName("rtitle")[n].readOnly=false;
    	document.getElementsByClassName("rtitle")[n].style.border="1px solid green";
    	document.getElementsByClassName("content")[n].readOnly=false;
    }
    
    function chgStar(n)
    {
    	// 매개변수 n까지 별을 노란색(stat1.png)으로 변경
    	for(i=0;i<=n;i++)
    	{
    		document.getElementsByClassName("star")[i].src="/static/product/star1.png";
    	}	
    	
    	// 클릭된 위치 오른쪽 별은 회색으로 (star2.png)
    	for(i=n+1;i<5;i++)
        {
    		document.getElementsByClassName("star")[i].src="/static/product/star2.png";
        }    
    	
    	document.pkc.star.value=n+1; // 별점을 계산하여 reviewOk로 보내는 input태그에 값을 전달
     } 
  </script>
</head>
<body> <!-- mylist.jsp -->
<%-- 
  <c:forEach begin="1" end="5" var="i" varStatus="sss">
      ${i} : ${sss.index} : ${sss.count} : ${sss.first} : ${sss.last}
  </c:forEach>
  
  <c:forEach items="${reviewmap}" var="map" varStatus="sss">
        ${sss.index} : ${sss.count} : ${sss.first} : ${sss.last}
  </c:forEach> --%>
  
  
  <section>
    <div align="center"> <h1> 나의 글 </h1> </div>
    <table width="1100" align="center">
     <caption> <h3> 상 품 평 </h3> </caption>
     <c:forEach items="${reviewmap}" var="map" varStatus="sts">
       <form method="post" action="reviewUpdate">
        <input type="hidden" name="star" value="${map.star}">
       <tr>
         <td onclick="rupdate(${sts.index})"> ${map.ptitle} </td>
         <td width="60" align="center">
           <c:forEach begin="1" end="${map.star}" varStatus="sss">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(${sss.count})">
           </c:forEach>
           <c:forEach begin="1" end="${5-map.star}" varStatus="fff">
              <img src="/static/product/star2.png" width="10" onclick="chgStar(${map.star+fff.count})">
           </c:forEach>
         </td>
         <td width="200" align="center"> 
           <input class="rtitle"  type="text" name="title" value="${map.title}" readonly> 
         </td>
         <td width="520"> 
           <textarea name="title" class="content" readonly>${map.content}</textarea> 
         </td>
         <td width="80" align="center"> ${map.writeday} </td>
       </tr>
      </form>
     </c:forEach>
    </table>
    
    <table width="1100" align="center">
     <caption> <h3> 상품 문의 </h3> </caption>
     <c:forEach items="${questmap}" var="map">
       <tr>
         <td> ${map.ptitle} </td>
         <td width="100" align="center"> ${map.title} </td>
         <td width="520"> <div class="content"> ${map.content} </div> </td>
         <td width="80"> ${map.writeday} </td>
       </tr>
     </c:forEach>
    </table>
    
    <table width="1100" align="center">
     <caption> <h3> 1:1 문의 </h3> </caption>
     <c:forEach items="${mlist}" var="mvo">
       <tr>
         <td> ${mvo.title} </td>
         <td width="520"> <div class="content"> ${mvo.content} </div> </td>
         <td width="80" align="center"> 
           <c:if test="${mvo.answer==1}">
             전화번호
           </c:if>
           <c:if test="${mvo.answer==2}">
             이메일
           </c:if>
           <c:if test="${mvo.answer==3}">
             홈페이지
           </c:if>
         </td>
         <td width="80"> ${mvo.writeday} </td>
       </tr>
     </c:forEach>
    </table>
  </section>
</body>
</html>




