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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  $(function()
  {
	   var imsi=$(".member");
	   $(".member").click(function()
	   {
	       	 var n=imsi.index(this);
	       	
	       	$.getJSON({
				  type:"get",
				  url:"getMember",
				  data:{userid:$(".userid").eq(n).val()},
				  success:function(mem)
				  {
					  $("#name").text(mem.name);
					  $("#userid").text(mem.userid);
					  $("#phone").text(mem.phone);
					  $("#email").text(mem.email);
					  $("#mem").css("visibility","visible");
				  }
	       	});
	   });
  });
  </script>
</head>
<body>
   <c:forEach items="${mlist}" var="mvo">
     <span class="member">${mvo.name}</span>
     <input type="hidden" class="userid" value="${mvo.userid}">
   </c:forEach>
   <div id="mem">
      이름 : <span id="name"></span> <p>
      아이디 : <span id="userid"></span> <p>
      전화번호: <span id="phone"> </span> </p>
      이메일 : <span id="email"> </span>
      
   </div>
</body>
</html>









