<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    section {
      width:1100px;
      height:700px;
      margin:auto;
      margin-top:70px;
    }
    section div {
      text-align:center;
      margin-bottom:13px;
    }
    section input[type=text] {
      width:400px;
      height:40px;
      border:1px solid green;
      outline:none;
    }
    section input[type=password] {
      width:400px;
      height:40px;
      border:1px solid green;
      outline:none;
    }
    section input[type=submit] {
      width:407px;
      height:43px;
      background:green;
      color:white;
      border:1px solid green;
    }
  </style>
</head>
<body> <!-- login.jsp -->
  <section>
  
     <form method="post" action="loginOk">
       <div> <h3> 로그인 </h3></div>
       <input type="hidden" name="pcode" value="${pcode}">
       <input type="hidden" name="su" value="${su}">
       <div> <input type="text" name="userid" id="userid" placeholder="아이디" value="channy"> </div>
       <div> <input type="password" name="pwd" id="pwd" placeholder="비밀번호" value="12345678"> </div>
       <div> <input type="submit" value="로그인"> </div> 
     </form>
  
  </section>
</body>
</html>