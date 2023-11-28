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
     height:500px;
     margin:auto;
     text-align:center;
   }
   section > form > div {
     margin-top:30px;
   }
   section > form > div > input[type=text] {
     width:400px;
     height:30px;
     border:1px solid green;
     outline:none;
   }
   section > form > div > input[type=submit] {
     width:406px;
     height:36px;
     border:1px solid green;
     background:green;
     color:white;
   }
   section > form > div > textarea {
     width:400px;
     height:150px;
     border:1px solid green;
     outline:none;
   }
   section > form > div >  select {
     width:400px;
     height:34px;
     border:1px solid green;
     outline:none;
   }
   section .inner {
     display:none;
   }
   section #phone {
     width:394px;
     height:24px;
     border:1px solid green;
     border-top:none;
     outline:none;
   }
   section #uid {
     width:100px;
     height:24px;
     border:1px solid green;
     border-top:none;
     outline:none;
   }
   section #server {
     width:166px;
     height:24px;
     border:1px solid green;
     border-top:none;
     outline:none;
   }
   section #sel {
     width:100px;
     height:27px;
     border:1px solid green;
     border-top:none;
     outline:none;
   }
 </style>
 <script>
   function selinner(chk)
   {

       document.getElementsByClassName("inner")[0].style.display="none";
 	   document.getElementsByClassName("inner")[1].style.display="none";
	  	    
	   if(chk==1 || chk==2)
	   {
		   document.getElementsByClassName("inner")[chk-1].style.display="block";
	   }	   
   }
   function selemail(str)
   {
	   document.mform.server.value=str;
   }
   
   function check()
   {
	   var uid=document.mform.uid.value;
	   var server=document.mform.server.value;
	   
	   document.mform.email.value=uid+"@"+server;
	   
	   return true;
   }
 </script>
</head>
<body> <!-- mtm -->
  <section>
    <form name="mform" method="post" action="mtmOk" onsubmit="return check()">
      <input type="hidden" name="email">
      <h2> 1:1 문의하기 </h2>
      <div> <input type="text" name="title" placeholder="문의 제목"> </div>
      <div> <textarea name="content" placeholder="문의 내용"></textarea> </div>
      <div> 
         <select name="answer" onchange="selinner(this.value)">
           <option value="0"> 선 택 </option>
           <option value="1"> 전화번호 </option>
           <option value="2"> 이메일 </option>
           <option value="3"> 홈페이지 </option>
         </select>
         
         <div class="inner"> <input type="text" name="phone" placeholder="전화번호입력" id="phone"> </div>
         <div class="inner"> 
            <input type="text" name="uid" id="uid">@<input type="text" name="server" id="server">
            <select onchange="selemail(this.value)" id="sel">
              <option value=""> 직접선택 </option>
              <option value="naver.com"> 네이버 </option>
              <option value="google.com"> 구글 </option>
              <option value="daum.net"> 다음 </option>
              <option value="hotmail.com"> 핫메일 </option>
            </select> 
         </div>
      </div>
      <div> <input type="submit" value="문의하기"> </div>
    </form>
  </section>
</body>
</html>







