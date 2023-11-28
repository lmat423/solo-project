<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function test1()
    {
    	document.querySelector(".aa").style.color="red";
    }
    function test2()
    {
    	var aa=document.querySelectorAll(".aa");
    	for(i=0;i<aa.length;i++)
    	{
    		aa[i].style.color="blue";
    	}	
    }
  </script>
</head>
<body> <!-- querySelector.jsp -->
  <input type="button" onclick="test1()" value="querySelector">
  <input type="button" onclick="test2()" value="querySelectorAll">
  <hr>
  <div class="aa"> 홍길동 </div>
  <div class="aa"> 슈퍼맨 </div>
  <div class="aa"> 배트맨 </div>
  <div class="aa"> 원더우먼 </div>
  <div class="aa"> 뽀로로 </div>
</body>
</html>