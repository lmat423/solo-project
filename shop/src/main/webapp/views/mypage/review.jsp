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
     margin-top:50px;
     text-align:center;
   }
   section div {
     margin-top:20px;
   }
   section input[type=text] {
      width:400px;
      height:40px;
      border:1px solid green;
      outline:none;
    }
   section textarea {
      width:400px;
      height:150px;
      border:1px solid green;
      outline:none;
    }
    section input[type=text]:focus {
      border-width:2px;
    }
    section textarea:focus {
      border-width:2px;
    }
   section input[type=submit] {
      width:406px;
      height:43px;
      border:1px solid green;
      background:green;
      color:white;
      font-weight:900;
    }
  
  </style>
  <script>
  function chgstar(n)
  {
  	// 매개변수 n까지 별을 노란색(stat1.png)으로 변경
  	for(i=0;i<=n;i++)
  	{
  		document.getElementsByClassName("star")[i].src="/static/product/star1.png";
  	}	
  	
  	// 클릭된 위치 오른쪽 별은 회색으로 (star2.png)
  	for(i=n+1;i<5;i++)
      {
  		document.getElementsByClassName("star")[i].src="/static/product/star2.png";
      }    
  	
  	document.pkc.star.value=n+1; // 별점을 계산하여 reviewOk로 보내는 input태그에 값을 전달
   } 
   
  function check()
  {
	  if(document.pkc.star.value=="0")
	  {
		  alert("별점을 선택하세요");
		  return false;
	  }
	  else
		  return true;
		  
  }
  
 
  </script>
</head>
<body> <!-- review.jsp -->
  <!-- 별점, 상품평제목, 내용 -->
  <section>
    <form name="pkc" method="post" action="reviewOk" onsubmit="return check()">
      <input type="hidden" name="star" value="0">
      <input type="hidden" name="pcode" value="${pcode}">
      <input type="hidden" name="gumaeno" value="${gumaeno}">
      <h3> 상품평 등록하기 </h3>      
      <div> 
        <img src="/static/product/star2.png" onclick="chgstar(0)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(1)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(2)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(3)" class="star">
        <img src="/static/product/star2.png" onclick="chgstar(4)" class="star">
      </div> <!-- 별점 -->
      <div> <input type="text" name="title" placeholder="한줄 요약"> </div>
      <div> <textarea name="content" placeholder="상품평"></textarea> </div>
      <div> <input type="submit" value="상품평 등록"> </div>
    </form>
  </section>
</body>
</html>