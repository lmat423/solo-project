<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function del(n)
    {
    	document.getElementsByClassName("aa")[n].remove();
    }
    function view()
    {
    	var n=document.getElementById("num").value;
        alert(document.getElementsByClassName("aa")[n].innerText);
    }
  </script>
</head>
<body> <!-- test.jsp -->
   <p class="aa"> 학교종이 땡땡땡 1   <input type="button" value="삭제" onclick="del(0)"></p>
   <p class="aa"> 학교종이 땡땡땡 2   <input type="button" value="삭제" onclick="del(1)"></p>
   <p class="aa"> 학교종이 땡땡땡 3   <input type="button" value="삭제" onclick="del(2)"></p>
   <p class="aa"> 학교종이 땡땡땡 4   <input type="button" value="삭제" onclick="del(3)"></p>
   <p class="aa"> 학교종이 땡땡땡 5   <input type="button" value="삭제" onclick="del(4)"></p>
   <p class="aa"> 학교종이 땡땡땡 6   <input type="button" value="삭제" onclick="del(5)"></p>
   <hr>
   <input type="text" name="num" id="num">
   <input type="button" onclick="view()" value="클릭">
</body>
</html>