<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #member {
      border:1px solid black;
      padding:3px;
    }
    #mem {
      width:300px;
      height:150px;
      border:1px solid black;
      position:absolute;
      left:200px;
      top:100px;
      background:white;
      visibility:hidden;
    }
  </style>
  <script>
    function getMember(userid)
    {
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		//alert(chk.responseText);
    		var data=JSON.parse(chk.responseText);
    		document.getElementById("name").innerText=data.name;
    		document.getElementById("userid").innerText=data.userid;
    		document.getElementById("phone").innerText=data.phone;
    		document.getElementById("email").innerText=data.email;
    		document.getElementById("mem").style.visibility="visible";
    	}
    	chk.open("get","getMember?userid="+userid);
    	chk.send();
    }
  </script>
</head>
<body>
   <c:forEach items="${mlist}" var="mvo">
     <span id="member" onclick="getMember('${mvo.userid}')">  ${mvo.name}</span>
   </c:forEach>
   
   <div id="mem">
      이름 : <span id="name"></span> <p>
      아이디 : <span id="userid"></span> <p>
      전화번호: <span id="phone"> </span> </p>
      이메일 : <span id="email"> </span>
      
   </div>
</body>
</html>









