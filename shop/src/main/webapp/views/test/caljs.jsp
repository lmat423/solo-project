<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    #cal { /* table태그 */
      border-spacing:0px;
      border:2px solid green;
    }
    #cal td {
      border:1px solid #eeeeee;
      text-align:center;
    }
    #cal tr td:first-child {
      color:red;
    }
    #cal tr td:last-child {
      color:blue;
    }
 </style>
 <script>
  function calView()
  {
	  // 달력 생성시 필요한 값 : 1일의요일, 총일수, 몇주
	  // 1일의 요일 => ?년 ?월 1일의 날짜 객체가 필요
	  
	  var today=new Date();		  
	  var y=today.getFullYear();
	  var m=today.getMonth(); // 0~11
	  
	  var xday=new Date(y,m,1);
	  var yoil=xday.getDay(); //0~6(일~토)
	  
	  var month=[31,28,31,30,31,30,31,31,30,31,30,31];
	  var chong=month[m];
	  
	  if( (y%4==0 && y%100!=0) || y%400==0 )  // 4의 배수 100의 배수는 아니다   단 400의 배수는 윤년
	  {
		  if(m==1)
		    chong=chong+1;
	  }	  
	  
	  var ju=Math.ceil( (chong+yoil)/7 );
	  
	  //alert(yoil+" "+chong+" "+ju);
	  
	  var calData="<table width='200' height='150' border='0' id='cal'>";
	  calData=calData+"<caption>";
	  calData=calData+y+"년 "+m+"월";
	  calData=calData+"</caption>";
	  calData=calData+"<tr>";
	  calData=calData+"<td> 일 </td>";
	  calData=calData+"<td> 월 </td>";
	  calData=calData+"<td> 화 </td>";
	  calData=calData+"<td> 수 </td>";
	  calData=calData+"<td> 목 </td>";
	  calData=calData+"<td> 금 </td>";
	  calData=calData+"<td> 토 </td>";
	  calData=calData+"</tr>";
	  var day=1;
	  for(i=1;i<=ju;i++)
	  {
		  calData=calData+"<tr>";
		  
		  for(j=0;j<7;j++)
		  {
			  if( (i==1 && j<yoil)  || chong<day  )  // 첫주에 1일의 요일보다 적은 j , 총일수보다 많은 day값일때
			  {	  
			      calData=calData+"<td> &nbsp; </td>";
			  }
			  else
			  {	  
			      calData=calData+"<td>"+day+"</td>";
			      day++;
			  }
   	      }	  
		  
		  calData=calData+"</tr>";
	  }
	  
	  document.getElementById("pkc").innerHTML=calData;
	  //document.getElementById("src").innerText=calData;
  }
 </script>
</head>
<body> <!-- caljs.jsp -->
  <input type="button" value="달력보기" onclick="calView()">
  <div id="pkc"></div>
  <hr>
  <div id="src"></div>
</body>
</html>











