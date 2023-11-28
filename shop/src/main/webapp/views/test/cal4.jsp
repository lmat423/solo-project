<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function test()
    {
    	var today=new Date();		  
  	    var y=today.getFullYear();
  	    var m=today.getMonth();
    	var xday=new Date(y,11,1);
    	
    	var yoil=xday.getDay();
    	
    	var month=[31,28,31,30,31,30,31,31,30,31,30,31];
  	    var chong=month[m];
  	  
  	    if( (y%4==0 && y%100!=0) || y%400==0 )  // 4의 배수 100의 배수는 아니다   단 400의 배수는 윤년
  	    {
  	 	  if(m==1)
  		    chong=chong+1;
  	    }	  
  	  
    	
    	var n=yoil-5;
    	
    	if(n==1)
    	   n=6;
    	
    	var chk=Math.abs(n)+1;
        var str=chk+",";
    	 while(chk+7<=chong)
    	 {	 
    		var chk=chk+7;
    	    var str=str+chk+",";
    	      
    	 }
    	 alert(str);
    }
  </script>
</head>
<body onload="test()">
 
</body>
</html>








