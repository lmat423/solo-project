<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:1100px;
      height:400px;
      margin:auto;
      text-align:center;   
      margin-top:100px; 
    }
  </style>
</head>
<body> <!-- member/reState.jsp -->
 <section>
   <h2> 현재 탈퇴신청중 입니다. 탈퇴신청을 취소하시려면 아래의 버튼을 클릭해주세요</h2>
   <a href="chgState?no=${no}"> 탈퇴신청 취소하기 </a>
 </section>
</body>
</html>