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
 
 </style>
 <script>
  function calView(d)
  {
 
 
	  var today=new Date();		  
	  var y=today.getFullYear();
	  var m=today.getMonth(); // 0~11
	  if(!d)
	     var d=today.getDate();

	  // 월이 -1이 오면
	  if(m==-1)
	  {
		  y=y-1;
		  m=11;
	  }	  
	  
	  // 월이 12가 오면
	  if(m==12)
	  {
		  y=y+1;
		  m=0;
	  }	  
	  
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
	  
 	  
	  var calData="<table width='400' height='50' border='0' id='cal'>";
 
	  calData=calData+y+"년 "+(m+1)+"월";                                               
 
	  var day=1;
	  calData=calData+"<tr align='center'>";
	  
	  var chk=7-yoil; // 1일과 일요일간의 차이값
	  if(chk==7)
		  chk=0;
	  var sun=1+chk;  // 일요일의 첫째날
	  var sat=sun-1;  // 토요일의 첫째날
 
	  var start=d-3;
	  var end=d+3;
	  if(start <= 0) // 4일 이전은 앞에서 3일이 1,2,3이라서
	  {
		  end=7;
		  start=1;
	  }	  
	  
	  
	  
	  if(start!=1)
		  calData=calData+"<td onclick='calView("+(d-1)+")'> << </td>";
	  else
		  calData=calData+"<td> << </td>"; 	 
		  
	  for(i=start;i<=end;i++)
	  {
		  if(i%7 == sun)
			  calData=calData+"<td width='40' style='color:red'>"+i+" </td>";
	      else if(i%7 == sat)
	    	      calData=calData+"<td width='40' style='color:blue'>"+i+" </td>";
	    	   else
		          calData=calData+"<td width='40' >"+i+" </td>";
          day++;
	  }
	  
	  if(end >= chong)
	     calData=calData+"<td> >> </td>";
	  else
		 calData=calData+"<td onclick='calView("+(d+1)+")'> >> </td>";	 
      calData=calData+"</tr>";
	
	  
	  document.getElementById("pkc").innerHTML=calData;
	  

  }
 
 
 </script>
</head>
<body> <!-- caljs2.jsp -->
  <input type="button" value="달력보기" onclick="calView()">
  <div id="pkc"></div>
 
</body>
</html>











