<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    var num=-1; // 현재 수정예정인 행의 숫자를 가리키는 변수
    function chgStar(n,x)
    {
        if(num==x)
        {
	    	var myjob=eval("document.querySelectorAll('#test"+x+" img')");
	    	            //myjob=document.querySelectorAll("#test0 img");
	    	            //myjob=document.querySelectorAll("#test1 img");
	    	            //myjob=document.querySelectorAll("#test2 img");
	    	
	      	for(i=0;i<=n;i++)  // n=3
	      	{
	      		myjob[i].src="/static/product/star1.png";
	      	}	
	      	
	      	// 클릭된 위치 오른쪽 별은 회색으로 (star2.png)
	      	for(i=n+1;i<5;i++)
	        {
	      		myjob[i].src="/static/product/star2.png";
	      		console.log(i);
	        }    
	      	
	      	document.getElementsByClassName("star")[x].value=n+1;
      	
        }
       
    }
    function setNum(n)
    {
    	num=n;
    }
  </script>
</head>
<body>
     <table>
      <tr>
         <td><input type="text" name="star" class="star" size="1"></td>
         <td onclick="setNum(0)"> 제목 </td>
         <td align="center" id="test0">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(0,0)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(1,0)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(2,0)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(3,0)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(4,0)">
         </td>
      </tr>
       <tr>
         <td><input type="text" name="star" class="star" size="1"></td>
         <td onclick="setNum(1)"> 제목 </td>
         <td  align="center" id="test1">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(0,1)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(1,1)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(2,1)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(3,1)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(4,1)">
         </td>
      </tr>
       <tr>
         <td><input type="text" name="star" class="star" size="1"></td>
         <td onclick="setNum(2)"> 제목 </td>
         <td  align="center" id="test2">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(0,2)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(1,2)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(2,2)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(3,2)">
              <img src="/static/product/star1.png" width="10" onclick="chgStar(4,2)">
         </td>
      </tr>
     </table>
</body>
</html>