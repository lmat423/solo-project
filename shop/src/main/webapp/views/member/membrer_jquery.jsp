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
    }
    section input[type=password] {
      width:400px;
      height:40px;
    }
    section input[type=submit] {
      width:407px;
      height:43px;
    }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
   $(function(){
	  var uidchk=0;
	  // 1. 아이디 중복체크 : 6자 이상
	  $("#userid").blur(function()
	  {
		  var userid=$("#userid").val();
		  
		  if(userid.length < 6)
		  {
			  $("#uk").text("아이디 길이는 6자 이상입니다");
			  $("#uk").css("color","red");
			  uidchk=0;
		  }	  
		  else
		  {
		 	  $.ajax({
			  url:"useridCheck",
			  data: {userid:userid} ,
			  success:function(result)
			  {
				 
				  if(result=="0")
		    	  {
		    		  $("#uk").text("사용 가능한 아이디");
		    		  $("#uk").css("color","blue");
		    		  uidchk=1;
		    	  }	
		    	  else
		    	  {
		    		  $("#uk").text("사용 불가능한 아이디");
		    		  $("#uk").css("color","red");
		    		  uidchk=0;
		    	  }	
			  }
		    });
		  } // 아이디 길이 if문의 종료
	  }); // blur이벤트 끝
	 
   });
   
    // 2. 비밀번호 동일 체크 : 8자 이상
    
 
    
    // 3. 전송전에 입력값의 유효성체크
    
    
  </script>
</head>
<body> <!-- member.jsp -->
  <section>
    <form method="post" action="memberOk" onsubmit="return check(this)">
      <div> <h3> 쇼핑몰 회원 가입 </h3></div>
      <div> <input type="text" name="userid" id="userid" placeholder="아이디"> <br><span id="uk"></span></div>
      <div> <input type="text" name="name" placeholder="이 름"> </div> 
      <div> <input type="password" name="pwd" placeholder="비밀번호"> </div>
      <div> <input type="password" name="pwd2" placeholder="비밀번호 확인"> </div> 
      <div> <input type="text" name="phone" placeholder="전화번호"> </div>  
      <div> <input type="text" name="email" placeholder="이메일"> </div> 
      <div> <input type="submit" value="회원 가입"> </div>
    </form>
  </section>
</body>
</html>





