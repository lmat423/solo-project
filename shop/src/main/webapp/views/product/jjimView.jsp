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
    section #psu {
      font-size:12px;
      color:red;
    }
    
    section table {
      margin-bottom:30px;
    }
    section table tr td {
      height:80px;
      border-bottom:1px solid green;
    }
     section table tr:first-child td{
      border-top:2px solid green;
      height:50px;
    }
    section table tr:last-child td {
      border-bottom:2px solid green;
      height:50px;
    }
    section #mainrow  td{
      height:50px;
    }
    section #btn {
      width:100px;
      height:26px;
      background:white;
      border:1px solid green;
    }
     
   
  </style>
  <script>
    function mainClick(my,n)
    {
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	for(i=0;i<len;i++)
    	{
    		sub[i].checked=my.checked; // main의 checked속성을 그대로 전달
    	}	
    	
    	document.getElementsByClassName("main")[n].checked=my.checked;
    }
    function subClick()
    {
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	var sel=0; // class="sub"의 체크된 숫자 파악
    	for(i=0;i<len;i++)
    	{
    		if(sub[i].checked)
    			sel++;
    	}	
    	
    	var main=document.getElementsByClassName("main");
    	if(len==sel)
    	{
    		main[0].checked=true;
    		main[1].checked=true;
    	}	
    	else
    	{
    		main[0].checked=false;
    		main[1].checked=false;
    	}	
    }
    
    function selectDel()
    {
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	
    	var delsub="";   // 삭제할 상품의 no필드값을 ,로 구분하여 저장하는 변수
    	for(i=0;i<len;i++)
    	{
    		if(sub[i].checked)
    		{
    			delsub=delsub+sub[i].value+",";
    		}	
    	}	
    	
    	location="jjimDel?nos="+delsub;
    }
    
    function jjimDel(nos)
    {
    	location="jjimDel?nos="+nos; //  33
    }
  </script>
</head>
<body> <!-- jjimView.jsp -->
  <section>
  
     <table width="900" align="center" cellspacing="0">
        <caption> <h3> 찜 목록 </h3> </caption>
        <tr>
          <td width="120"> <input type="checkbox" class="main" onclick="mainClick(this,1)"> 전체선택 </td>
          <td> &nbsp; </td>
          <td width="120"> &nbsp; </td>
        </tr>
      <c:forEach items="${mapall}" var="map">     
        <tr> 
          <td> 
             <input type="checkbox" class="sub" value="${map.no}" onclick="subClick()"> 
             <img src="/static/pro/${map.pimg}" width="50" valign="middle">
          </td>
          <td> 
            <c:if test="${map.bprice == 0}">
              무료배송
            </c:if>
            <c:if test="${map.bprice != 0}">
              <fmt:formatNumber value="${map.bprice}" type="number"/>원
            </c:if> 
            <br>
              ${map.title}
            <br>
              <fmt:formatNumber value="${map.price}" type="number"/>원
          </td>
          <td> 
           <c:if test="${map.cnt != 0}">
              <input type="button" value="장바구니 담기" disabled>
           </c:if>
           <c:if test="${map.cnt == 0}">
            <input type="button" value="장바구니 담기" id="btn" onclick="location='moveCart?pcode=${map.pcode}&no=${map.no}'"> <br>
           </c:if>
            <input type="button" style="margin-top:3px;" value="삭제" id="btn" onclick="jjimDel(${map.no})">
          </td>
        </tr>
      </c:forEach>
        <tr>
          <td colspan="3" > 
            <input type="checkbox" class="main" onclick="mainClick(this,0)"> 전체선택   
            <input type="button" value="선택삭제" id="btn" onclick="selectDel()">  
          </td>
        </tr>
        
     </table>
  
  </section>
</body>
</html>












