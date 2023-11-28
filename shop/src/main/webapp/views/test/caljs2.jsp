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
    #cal .inner {
      font-size:12px;
    }
 </style>
 <script>
  function calView(y,m)
  {
 
	  // 달력 생성시 필요한 값 : 1일의요일, 총일수, 몇주
	  // 1일의 요일 => ?년 ?월 1일의 날짜 객체가 필요
	  if(!y) // 값이 없다면
	  {
 
	     var today=new Date();		  
	     var y=today.getFullYear();
	     var m=today.getMonth(); // 0~11
	  }
	  
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
	  
	  //alert(yoil+" "+chong+" "+ju);
	  
	  var calData="<table width='400' height='350' border='0' id='cal'>";
	  calData=calData+"<caption>";
	  calData=calData+" <span onclick='calView("+y+","+(m-1)+")'> << </span>";  // onclick="calView(2023,8)"
	  calData=calData+y+"년 "+(m+1)+"월";                                                // 2023년 9월
	  calData=calData+" <span onclick='calView("+y+","+(m+1)+")'> >> </span>";  // onclick="calView(2023,10)"
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
				  calData=calData+"<td class='chktd' onclick='thisDay("+y+","+(m+1)+","+day+")'>"+day+" <div class='inner'></div></td>";
				                        // thisDay(2023,9,15)
			      day++;
			  }
   	      }	  
		  
		  calData=calData+"</tr>";
	  }
	  
 
	  document.getElementById("pkc").innerHTML=calData;
	  
	  // ajax를 통해 cal테이블에서 읽어오기
	  var chk=new XMLHttpRequest();
	  chk.onload=function()
	  {
		  //alert(chk.responseText);
		  var data=JSON.parse(chk.responseText);
		  //alert(data[1].chk);
		  for(i=0;i<data.length;i++)
		  {	  
			  if(data[i].chk==1)
			  {	  
		           document.getElementsByClassName("chktd")[i].style.background="#eeeeee";
			  }
			  document.getElementsByClassName("inner")[i].innerText=data[i].str;
		  }
	  }
	  chk.open("get","getCal?y="+y+"&m="+(m+1));
	  chk.send();
 
  }
  function thisDay(y,m,d)
  {
	  m=m+"";
	  d=d+"";
	  m=m.padStart(2,'0');
	  d=d.padStart(2,'0');
	  document.getElementById("chan").value=y+"-"+m+"-"+d;
	  document.getElementById("pkc").innerText="";
  }
 </script>
</head>
<body> <!-- caljs2.jsp -->
  <input type="text" onclick="calView()" id="chan">
  <div id="pkc"></div>
 
</body>
</html>











