<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
     var test1="홍길동";
     var test2="배트맨";
     var test3="슈퍼맨";
     
     // 순서대로 경고창 출력하기 => for문을 이용
     for(i=1;i<=3;i++)
     {
    	 eval("alert(test"+i+")");  // alert(test1);  alert(test2) , alert(test3)
     }
     
     
  </script>
</head>
<body>

</body>
</html>













