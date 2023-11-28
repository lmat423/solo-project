<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   section #txt {
     display:inline-block;
     width:180px;
   }
   section input[type=button] {
     border:1px solid green;
     
     background:white;
     width:120px;
     height:27px;
   }
   section input[type=submit] {
     border:1px solid green;
     padding:4px;
     background:white;
     width:100px;
   }
   section #out{
     border:1px solid green;
     padding:4px;
     background:green;
     color:white;
     width:300px;
     height:40px;
     font-size:17px;
     font-weight:900;
   }
   section input[type=password] {
     border:1px solid green;
     outline:none;
     background:white;
     width:150px;
     height:23px;
   }
   section input[type=text] {
     border:1px solid green;
     outline:none;
     background:white;
     width:150px;
     height:23px;
     vertical-align:bottom;
   }
   section table tr {
     height:100px;
   }
   section table tr td:first-child{
     padding-left:20px;
     font-weight:900;
     background:#F5FFED;
     border-right:1px solid green;
   }
   section table tr td:last-child{
     padding-left:20px;
     
   }
   section table tr td {
     border-bottom:1px solid green;
     font-size:14px;
     font-weight:900;
   }
   section table tr:first-child td {
     border-top:2px solid green;
     
   }
   section table tr:last-child td {
     border-bottom:2px solid green;
     background:white;
     border-right:none;
   }
   section table #pwd {
     height:140px;
   }
   section table #pwd td{
     padding-top:10px;
   }
   section table #pwd div{
     height:36px;
   }
   section #msg , section #msg2 {
     font-size:12px;
   }
   section h1 {
     text-align:left;
     padding-bottom:10px;
   }
   #chgname , #chgphone, #chgemail {
     margin-top:15px;
   }
 </style>
 <script>
   function chgName(sts,my,n)
   {
	   document.getElementById("chgname").style.display=sts; // 이름변경 text가 포함된 div
	   my.style.display="none";
	   document.getElementsByClassName("nameBtn")[n].style.display="inline";
   }
   
   function chgPhone(sts,my,n)
   {
	   document.getElementById("chgphone").style.display=sts;
	   my.style.display="none";
	   document.getElementsByClassName("phoneBtn")[n].style.display="inline";
   }
   function chgEmail(sts,my,n)
   {
	   document.getElementById("chgemail").style.display=sts;
	   my.style.display="none";
	   document.getElementsByClassName("emailBtn")[n].style.display="inline";
   }
   
   function updateName()
   {
 
	   var name=document.getElementById("name").value;
	   if(name.trim().length!=0)
	   	  location="chgName?name="+name;
   }
   function updatePhone()
   {
	   var phone=document.getElementById("phone").value;
	   if(phone.trim().length!=0)
	      location="chgPhone?phone="+phone;
   }
   function updateEmail()
   {
	   var email=document.getElementById("email").value;
	   if(email.trim().length!=0)
	      location="chgEmail?email="+email;
   }
   
   var pchk=0;
   function pwdCheck()
   {
   	// pwd 와 pwd2인 입력폼의 값을 비교한다..
   	var pwd=document.mform.pwd.value;   // document.getElementById("pwd").value
   	var pwd2=document.mform.pwd2.value; // document.getElementById("pwd2").value
   	
   	if(pwd2.length > 0)
    {
   	   if(pwd==pwd2)
   	   {
   	   	   document.getElementById("msg2").innerText="비밀번호가 일치합니다";
   		   document.getElementById("msg2").style.color="blue";
   		   pchk=1;
   	   }	
   	   else
   	   {
   		   document.getElementById("msg2").innerText="비밀번호가 불일치합니다";
   		   document.getElementById("msg2").style.color="red";
   		   pchk=0;
   	   }
    }
   	console.log(pchk);
   }
   
   function pwdLength(my)  
   {
   	var len=my.length; // pwd의 길이
   	
   	if(len < 8)
   	{
   		document.getElementById("msg").innerText="비밀번호는 8자 이상 입력하세요";
   		document.getElementById("msg").style.color="red";
   		document.mform.pwd.focus();
   		pchk=0;
   	}	
   	else
   	{
   		document.getElementById("msg").innerText="비밀번호의 길이가 적당합니다";
   		document.getElementById("msg").style.color="blue";
   		var pwd=document.mform.pwd.value;   
   	   	var pwd2=document.mform.pwd2.value; 
   	   	if(pwd==pwd2)
   	   	{
   	   		pchk=1;
   	   	}
   	}	
   }
   
   function check()
   {
	   if(document.mform.opwd.value.trim().length==0)
	   {
		   alert("현재 비밀번호를 입력하세요");
		   return false;
	   }
	   else if(pchk==0)
		    {
		       alert("새 비밀번호가 잘못 입력되었네요");
		       return false;
		    }
	        else
	           return true;
   }
   
   function out()
   {
	   if(confirm("정말 탈퇴하시겠습니까?"))
	       location="memberOut";
   }
 </script>
</head>
<body>
  <section>
    <table width="1000" align="center" cellspacing="0">
      <caption> <h1> 회원정보 수정 </h1></caption>
      <tr class="mytr">
        <td width="160"> 아이디 </td>
        <td> ${mvo.userid} </td>
      </tr>
      <tr>
        <td> 이름 </td>
        <td>
            <span id="txt"> ${mvo.name} </span> 
            <input type="button" value="이름변경" onclick="chgName('block',this,1)" class="nameBtn">
            <input type="button" value="이름변경 취소" onclick="chgName('none',this,0)" class="nameBtn" style="display:none">
            <div id="chgname" style="display:none;">
              <input type="text" id="name"> <input type="button" value="변경하기" onclick="updateName()"> 
            </div> 
        </td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td> 
            <span id="txt"> ${mvo.phone} </span> 
            <input type="button" value="전화번호변경" onclick="chgPhone('block',this,1)" class="phoneBtn">
            <input type="button" value="전화번호변경 취소" onclick="chgPhone('none',this,0)" class="phoneBtn" style="display:none">
            <div id="chgphone" style="display:none;">
              <input type="text" id="phone"> <input type="button" value="변경하기" onclick="updatePhone()"> 
            </div> 
        </td>
      </tr>
      <tr>
        <td> 이메일 </td>
        <td> 
            <span id="txt"> ${mvo.email} </span> 
            <input type="button" value="이메일변경" onclick="chgEmail('block',this,1)" class="emailBtn">
            <input type="button" value="이메일변경 취소" onclick="chgEmail('none',this,0)" class="emailBtn" style="display:none">
            <div id="chgemail" style="display:none;">
              <input type="text" id="email"> <input type="button" value="변경하기" onclick="updateEmail()"> 
            </div> 
        </td>
      </tr>
      <tr id="pwd">
        <td> 비밀번호 변경 </td>
        <td> 
         <form name="mform" method="post" action="pwdChange" onsubmit="return check()">
          <div> <span id="txt"> 현재비밀번호 </span> <input type="password" name="opwd"> </div>
          <div> <span id="txt"> 새비밀번호 </span> <input type="password" name="pwd" onblur="pwdLength(this.value)" onkeyup="pwdCheck()">
                <span id="msg"></span>
          </div>
          <div> <span id="txt"> 비밀번호확인 </span> <input type="password" name="pwd2" onkeyup="pwdCheck()">
                <span id="msg2"></span>
          </div>
          <div> <input type="submit" value="비밀번호 변경">
             <c:if test="${err==1}">
                <span id="err" style="color:red;font-size:12px">이전 비밀번호가 틀립니다. </span>
             </c:if> 
          </div>
         </form>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="button" value="메인으로" id="out" onclick="location='../main/main'">
          <input type="button" value="탈퇴신청하기" onclick="out()" id="out">
        </td>
      </tr>
    </table>
  </section>
</body>
</html>