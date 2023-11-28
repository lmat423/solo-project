<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function mainClick(mchk,n)
    {
    	// class="sub"인 체크박스는 전부 main과 동일한 속성을 checked에게 전달
    	//alert(mchk.checked);
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	for(i=0;i<len;i++)
    	{
    		sub[i].checked=mchk.checked;
    	}	
    	
    	// 클릭된 class="main" 말고 다른 main의 인덱스 : n
    	document.getElementsByClassName("main")[n].checked=mchk.checked;
    	
    	// 아래 전체선택에 있는 (선택건수/총건수)에 값을 전달한다..
    	document.getElementById("bb").innerText=len;
    	if(mchk.checked)
    	   document.getElementById("aa").innerText=len;
    	else
    	   document.getElementById("aa").innerText=0;
    }
    function subClick()
    {
    	// 체크된 sub의 갯수를 파악한다.
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	var sel=0;
    	for(i=0;i<len;i++)
    	{
    		if(sub[i].checked)
    			sel++; // class="sub"의 체크된 갯수를 가진다..
    	}
    	// 1. 모든 sub가 체크되었다면 class="main"을 체크한다.
    	if(len==sel)
    	{
    		document.getElementsByClassName("main")[0].checked=true;
    		document.getElementsByClassName("main")[1].checked=true;
    	}
    	else // 2. 아니라면 class="main"은 해제한다.
    	{
    		document.getElementsByClassName("main")[0].checked=false;
    		document.getElementsByClassName("main")[1].checked=false;
    	}	
    	
    	// 3. 아래 전체선택에 있는 (선택건수/총건수)에 값을 전달한다..
    	document.getElementById("bb").innerText=len;
    	document.getElementById("aa").innerText=sel;
    }
    
    function changeSu(my,n,s,no) // select의 onchage시 실행되는 메소드
    {
    	//alert(my.value);
    	if(my.value==10)  // 10+가 왔을때는 변경 X
    	{
    		// select태그를 text로 변경
    		my.style.display="none";
    		document.getElementsByClassName("su2")[n].style.display="inline";
    		document.getElementsByClassName("su2")[n].value=s;
    		//document.getElementsByClassName("subtn")[n].style.display="inline";
    		document.getElementsByClassName("su2")[n].focus();
    	}
    	else
    	{
   		
    		 var su=my.value;
    		 // 변경된 수량을 DB에 update
             var chk=new XMLHttpRequest();
    		 chk.onload=function()
    		 {
    			 //alert(chk.responseText);
    			 if(chk.responseText=="1")
    				 alert("오류발생");
    			 
    			 // 변경된 수량만큼 단가에서 곱한후 class="sangprice"에 innerText
    			 var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
    			 //alert(danga);
    			 document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
    			 
    			 // string 연산을 *,-,/는 동작한다..  =>  안될경우 이부분을 체크 => parseInt(), Number()를 통해서 숫자형으로 변경
    		 }
    		 chk.open("get","changeSu?su="+su+"&no="+no);
    		 chk.send();
    	}	
    }
    
    function txtChange(my,n,no) // 10미만인지 10이상인지 여부를 체크해서 type="text" , select
    {
    	var su=my.value; // type="text"에 입력된 값

    	if(su > 9)
    	{
    		// 수량변경 버튼 보이게 하기
    		document.getElementsByClassName("subtn")[n].style.display="inline";
    		// 변경된 수량만큼 단가에서 곱한후 class="sangprice"에 innerText
 
    	}
    	else 
    	{
    		 document.getElementsByClassName("su2")[n].style.display="none"; // type="text"
    		 document.getElementsByClassName("su2")[n].innerText=su;
    		 document.getElementsByClassName("su1")[n].style.display="inline"; // select태그
    		 document.getElementsByClassName("subtn")[n].style.display="none"; // 수량변경버튼
    		 // su의 값을 select태그에 전달
    		 document.getElementsByClassName("su1")[n].value=su;
    		
    		 var chk=new XMLHttpRequest();
    		 chk.onload=function()
    		 {
    			 //alert(chk.responseText);
    			 if(chk.responseText=="1")
    				 alert("오류발생");
    			 
    			 // 변경된 수량만큼 단가에서 곱한후 class="sangprice"에 innerText
    			 var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
    			 //alert(danga);
    			 document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
    		 
    		 }
    		 chk.open("get","changeSu?su="+su+"&no="+no);
    		 chk.send();
    	}	
    	
    }
    
    function changeSu2(n,no)
    {
     
    	var su=document.getElementsByClassName("su2")[n].value;
    	var chk=new XMLHttpRequest();
    	//alert(su+" "+no);
		chk.onload=function()
		{
			 //alert(chk.responseText);
			 if(chk.responseText=="1")
				 alert("오류발생");
			 
			 document.getElementsByClassName("subtn")[n].style.display="none";
			 // 변경된 수량만큼 단가에서 곱한후 class="sangprice"에 innerText
			 var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
			 //alert(danga);
			 document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
		}
		chk.open("get","changeSu?su="+su+"&no="+no);
		chk.send();
    }
    
    window.onload=function()
    {
    	 // su1(select) , su2(text) , subtn(수량변경버튼)
    	 // 상품의 갯수를 알아야 된다.
    	 var plen=${mapall.size()};
    	  	     	 
    	 var msu=[${str}];  // [5,3,22,4,6]
    	 
    	 for(i=0;i<plen;i++)
    	 {
    		 if(msu[i]< 10)
    		 {
    			 //document.getElementsByClassName("su1")[i].style.display="inline";
    			 document.getElementsByClassName("su1")[i].value=msu[i];
    		 }	 
    		 else
    		 {
    			 document.getElementsByClassName("su1")[i].style.display="none";
    			 document.getElementsByClassName("su2")[i].style.display="inline";
    			 document.getElementsByClassName("su2")[i].value=msu[i];
    			 //document.getElementsByClassName("subtn")[i].style.display="inline";
    		 }	 
    	 }	 
    }
    
    function comma(num)
    {
   	 return new Intl.NumberFormat().format(num);
    }
  </script>
  <style>
    section #psu {
      font-size:12px;
      color:red;
    }
    
    section table {
      margin-bottom:30px;
    }
    section table tr td {
      height:80px;
      border-bottom:1px solid green;
    }
     section table tr:first-child td{
      border-top:2px solid green;
    }
    section table tr:last-child td {
      border-bottom:2px solid green;
    }
    section #mainrow  td{
      height:50px;
    }
    section #alldel {
      width:100px;
      height:30px;
      background:white;
      border:1px solid green;
    }
    section #goshop {
      width:150px;
      height:40px;
      background:white;
      border:1px solid green;
    }
    section #gumae {
      width:150px;
      height:40px;
      background:green;
      border:1px solid green;
      color:white;
    }
    section select {
      width:40px;
    }
    section .su1 {
      height:20px;
    }
    section .su2 {
      width:32px;
      height:14px;
      display:none;
    }
    section .subtn {
      width:40px;
      height:20px;
      font-size:9px;
      background:white;
      border:1px solid black;
      border-radius:3px;
      display:none;
    }
  </style>
</head>
<body> <!-- cartView -->
  <!-- 사용자에게 cart테이블에 있는 내용을 보여준다..  
      상품명, 상품이미지, 구입수량 , 금액 , 등록일
   -->
 <section>
   <table width="900" align="center" cellspacing="0">   
    <caption> <h3> 장바구니 목록 </h3> </caption>
      <tr id="mainrow">
        <td colspan="2"> <input type="checkbox" class="main" onclick="mainClick(this,1)"> 전체선택 </td>
        <td colspan="2" align="center"> 상품정보 </td>
        <td align="center"> 상품가격 </td>
        <td align="center"> 배송비 </td>
      </tr>
    <c:forEach items="${mapall}" var="map" varStatus="sts"> <!-- 상품별 출력되는 forEach -->
      <c:set var="aa" value=""/>
      <tr>
        <td width="40"> <input type="checkbox" class="sub" onclick="subClick()"> </td> <!-- 상품별 체크박스 -->
        <td> <img src="/static/pro/${map.pimg}" width="50"> </td>
        <td>
           ${map.title} <br>
          <c:if test="${map.psu < 10}"> 
            <span id="psu"> 품절임박 잔여 ${map.psu}개 </span>
          </c:if>
        </td>
        <td width="150" align="right"> 
           <span class="danga"> <fmt:formatNumber value="${map.price}" type="number"/></span>원 
           
           <select name="su" onchange="changeSu(this,${sts.index},${map.su},${map.no})" class="su1">
             <c:set var="last" value="10"/>
             
             <!-- 10개 미만인 경우 last변수의 값을 변경 -->
             <c:if test="${map.psu < 10}">
               <c:set var="last" value="${map.psu}"/>
             </c:if>
             
             <c:forEach begin="1" end="${last}" var="i" varStatus="no">
           
              <c:if test="${map.su != i}">
                <c:if test="${no.count==10}">
                  <c:set var="aa" value="+"/> 
                </c:if> 
                <option value="${i}"> ${i}${aa} </option>
              </c:if>
              <c:if test="${map.su == i}">
                 <c:if test="${no.count==10}">
                  <c:set var="aa" value="+"/> 
                 </c:if> 
                <option value="${i}" selected> ${i}${aa} </option>
              </c:if>
              
              
              
             </c:forEach>                 
           </select>
           <input type="text" name="su" class="su2" onchange="txtChange(this,${sts.index},${map.no})"> <!-- 수량을 직접입력하는 텍스트박스 -->
           <br> <input type="button" value="변경" class="subtn" onclick="changeSu2(${sts.index},${map.no})" > <!-- 10개 이상 수량의 변경시 -->
        </td>
        <td width="100" align="right"> <span class="sangprice"> <fmt:formatNumber value="${map.price*map.su}" type="number"/></span>원 </td>
        <td width="80" align="right"> <fmt:formatNumber value="${map.bprice}" type="number"/>원 </td>
      </tr>
    </c:forEach>  
      <tr>
        <td colspan="6" align="right">
           
        </td> <!-- 상품가격,배송비,주문금액 -->
      </tr>
      <tr id="mainrow">
        <td colspan="6">
         <input type="checkbox" class="main" onclick="mainClick(this,0)">
          전체선택 (<span id="aa">0</span>/<span id="bb">${mapall.size()}</span>) 
           <input type="button" value="전체삭제" id="alldel">
        </td>
      </tr>
      <tr>
        <td colspan="6"> </td> <!-- 총 상품가격,배송비, 주문금액 -->
      </tr>
      <tr>
        <td colspan="6" align="center">
          <input type="button" value="계속 쇼핑하기" id="goshop">
          <input type="submit" value="구매하기" id="gumae">
        </td>
      </tr>
   </table>
 </section> 
</body>
</html>







