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
      border:1px solid green;
      background:green;
      color:white;
    }
    #pk , #uk ,#pk2 {
      font-size:11px;
    }
  </style>
  <script>
    // 1. 아이디 중복체크 : 6자 이상
    var uidchk=0;
    function useridCheck(userid)
    {
      if(userid.length < 6)
      {
    	  document.getElementById("uk").innerText="아이디의 길이는 6자 이상입니다.";
		  document.getElementById("uk").style.color="red";
	      uidchk=0;
      }	  
      else
      {	  
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		//alert(chk.responseText);
    		if(chk.responseText=="0")
    		{
    			document.getElementById("uk").innerText="사용 가능한 아이디";
    			document.getElementById("uk").style.color="blue";
    			uidchk=1;
    		}	
    		else
    		{
    			document.getElementById("uk").innerText="사용 불가능한 아이디";
    			document.getElementById("uk").style.color="red";
    			uidchk=0;
    		}	
    	}
    	chk.open("get","useridCheck?userid="+userid);
    	chk.send();
    	
      } // 아이디 6자 이상 if 종료
    }
    // 2. 비밀번호 동일 체크 : 8자 이상
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
    	   	   document.getElementById("pk").innerText="비밀번호가 일치합니다";
    		   document.getElementById("pk").style.color="blue";
    		   pchk=1;
    	   }	
    	   else
    	   {
    		   document.getElementById("pk").innerText="비밀번호가 불일치합니다";
    		   document.getElementById("pk").style.color="red";
    		   pchk=0;
    	   }
        }
    }
    function pwdLength(my)  
    {
    	var len=my.length; // pwd의 길이
    	
    	if(len < 8)
    	{
    		document.getElementById("pk2").innerText="비밀번호는 8자 이상 입력하세요";
    		document.getElementById("pk2").style.color="red";
    		pchk=0;
    		document.mform.pwd.focus();
    	}	
    	else
    	{
    		document.getElementById("pk2").innerText="비밀번호의 길이가 적당합니다";
    		document.getElementById("pk2").style.color="blue";
    		pchk=1;
    	}	
    }
      
    // 3. 전송전에 입력값의 유효성체크
    function check(my) // my=document.mform
    {

    	if(uidchk==0)
    	{
    		alert("아이디가 잘못 되었습니다");
    		my.userid.focus();
    		return false;
    	}	
    	else if(pchk==0)
    		 {
    		    alert("비밀번호가 잘못 되었습니다");
    		    my.pwd.value="";
    		    my.pwd2.value="";
    		    my.pwd.focus();
    		    return false;
    		 }
    	     else if(my.name.value.trim()=="") // 사용자가 빈칸만 입력했을경우 => trim()
    	    	  {
    	    	      alert("이름을 입력하세요");
    	    	      my.name.focus();
    	    	      return false;
    	    	  }
    	          else if(my.phone.value.trim().length==0)
    	        	   {
    	        	      alert("전화번호를 입력하세요");
    	        	      my.phone.focus();
    	        	      return false;
    	        	   }
    	               else if(my.email.value.trim()=="")
    	            	    {
    	            	        alert("이메일을 입력하세요");
    	            	        my.email.focus();
    	            	        return false;
    	            	    }
    	                    else
    	                    	return true;
    	     
    	
    }
  </script>
</head>
<body> <!-- member.jsp -->
  <section>
    <form name="mform" method="post" action="memberOk" onsubmit="return check(this)">
      <div> <h3> 쇼핑몰 회원 가입 </h3></div>
      <div> <input type="text" name="userid" placeholder="아이디" onblur="useridCheck(this.value)"> <br><span id="uk"></span></div>
      <div> <input type="text" name="name" placeholder="이 름"> </div> 
      <div> <input type="password" name="pwd" id="pwd" placeholder="비밀번호" onblur="pwdLength(this.value)" onkeyup="pwdCheck()">  <br><span id="pk2"></span></div>
      <div> <input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인" onkeyup="pwdCheck()">  <br><span id="pk"></span> </div> 
      <div> <input type="text" name="phone" placeholder="전화번호"> </div>  
      <div> <input type="text" name="email" placeholder="이메일"> </div> 
      <div> <input type="submit" value="회원 가입"> </div>
    </form>
  </section>
</body>
</html>





