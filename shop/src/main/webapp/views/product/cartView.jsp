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
    	
    	
    	total();
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
    	
    	total();
    }
     
    function changeSu(my,n,s,no) // select의 onchage시 실행되는 메소드
    {
    	// alert(my.value);
    	if(my.value==10)  // 10+가 왔을때는 변경 X
    	{
    		// select태그를 text로 변경
    		my.style.display="none";
    		document.getElementsByClassName("su2")[n].style.display="inline";
    		document.getElementsByClassName("su2")[n].value=document.getElementsByClassName("beforesu")[n].value;
    		//document.getElementsByClassName("subtn")[n].style.display="inline";
    		document.getElementsByClassName("su2")[n].focus();
    	}
    	else
    	{
   		
    		 var su=my.value;
    		 // 변경된 수량을 DB에 update
             junsong(su,no,n);
    		 document.getElementsByClassName("beforesu")[n].value=my.value;// 10미만일때 값을  저장
    		 
    		
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
    		
    		 junsong(su,no,n);
    		 
    		 
    	}	
    	
    }
    
    function changeSu2(n,no) // text값을 저장하는 수량변경버튼이 클릭되었을때
    {
     
    	var su=document.getElementsByClassName("su2")[n].value;
    	
    	junsong(su,no,n);
    	
    	 
    }
    
    function junsong(su,no,n)
    {
    	var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			 if(chk.responseText=="1")
				 alert("오류발생");
			 
			 document.getElementsByClassName("subtn")[n].style.display="none";
			 var danga=document.getElementsByClassName("danga")[n].innerText.replace(/,/g,"");
			 document.getElementsByClassName("sangprice")[n].innerText=comma(danga*su);
			 console.log(document.getElementsByClassName("sangprice")[n].innerText);
			 
			 total();  // ajax로 전송된 후 그 값을 이용하려면 chk.onload()내에서 처리하기
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
    
    function cartDel(no,my,index) //  my는 <img태그 src="del.png" 
    {
    	 var pcode=document.getElementsByClassName("pcode")[index].value;
    	 var su=document.getElementsByClassName("su1")[index].value;
    	 alert(pcode+" "+su);
    	 var chk=new XMLHttpRequest();
    	 chk.onload=function()
    	 {
    		 if(chk.responseText=="0")
    		 {
    			 my.parentNode.parentNode.remove();
    			 
    			 total();
    		 }	 
    		 else
    		 {
    			 alert("오류발생");
    		 }	 
    	 }
    	 chk.open("get","cartDel?no="+no+"&pcode="+pcode+"&su="+su);
    	 chk.send();
    	 
    	 
    }
    
    function selectDel()
    {
    	// 선택된 체크박스에 해당되는 상품의 no를 가져오기 => db에서 삭제
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	var delsub="";
    	var delpro="";
    	var pcode="";
    	var su="";
    	for(i=0;i<len;i++)
    	{
    		// 체크가 된 체크박스의 value를 특정 변수에 저장
    		if(sub[i].checked)
    		{
    			delsub=delsub+sub[i].value+",";
    			delpro=delpro+i+","; // remove()를 시킬 상품의 tr의 index
    			pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
    			su=su+document.getElementsByClassName("su1")[i].value+",";
    			//document.getElementsByClassName("prod")[i].remove(); 오동작
    		}	
    	}	
    	//alert(delsub+" "+delpro);
     
    	//alert(delpro);  //  0,1,2,   => 4  =>  0 1 2
    	
    	 // 삭제하는 상품의 tr을 제거
    	var aaa=delpro.split(",");
    	for(i=aaa.length-2;i>=0;i--) 
    	{
    		//alert(aaa[i]);
    		document.getElementsByClassName("prod")[aaa[i]].remove();
    	}	
    	
    	// 쿠키에서 삭제할 상품의 pcode, su을 변수에 누적
    	/*
    	var pcode="";
    	var su="";
 
    	for(i=0;i<len;i++)
    	{
    		if(sub[i].checked) // 체크된 상품만 pcode,su를 누적
    		{
    			pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
    			su=su+document.getElementsByClassName("su1")[i].value+",";
    		}	
    	}	
    	*/
    	//alert(pcode+" "+su);
        <c:if test="${userid!=null}">
          <c:set var="cc" value="false"/>
        </c:if>
        <c:if test="${userid==null}">
          <c:set var="cc" value="true"/>
        </c:if>
  
    	if(${cc}) // 로그인 X , 선택삭제
        {
    		alert(pcode+" "+su);
    		
    		var chk=new XMLHttpRequest();
        	chk.onload=function()
        	{
        		//alert(chk.responseText);
        		if(chk.responseText=="1")
        			alert("오류");
        		else
        			total();
        	}
        	chk.open("get","selectDel2?pcode="+pcode+"&su="+su);
        	chk.send();
        }
    	else
    	{
    		var chk=new XMLHttpRequest();
        	chk.onload=function()
        	{
        		//alert(chk.responseText);
        		if(chk.responseText=="1")
        			alert("오류");
        		else
        			total();
        	}
        	chk.open("get","selectDel?nos="+delsub);
        	chk.send();
    	}	
    	
  
    	
    }
    
    function total() // 선택된 상품의 가격, 수량, 배송비를 이용하여 결제금액에 대한 처리
    {
     
    	// class="sub"인 체크박스의 체크여부를 판단
    	// checked가 true인 경우 sangprice, bprice를 가져온다..
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length; // 상품별 체크박스의 갯수
    	var totalprice=0;
    	var totalbprice=0;
    	for(i=0;i<len;i++)
    	{
    		if(sub[i].checked)
    		{
    			totalprice=totalprice+parseInt(document.getElementsByClassName("sangprice")[i].innerText.replace(/,/g,""));
    			if(document.getElementsByClassName("bprice")[i].innerText!="무료배송")
    			    totalbprice=totalbprice+parseInt(document.getElementsByClassName("bprice")[i].innerText.replace(/,/g,""));
    		}	
    	}	
    	// chongprice + chongbae = chongjumun
    	document.getElementById("chongprice").innerText=comma(totalprice);
    	document.getElementById("chongbae").innerText=comma(totalbprice);
    	document.getElementById("chongjumun").innerText=comma(totalprice+totalbprice);
    }
    
    
    function moveGumae()  // 구입하는 상품들의  pcode와 수량을 ,로 구분하여 progumae에 전달하기
    {
    	// 몇번째 체크박스가 체크되었나를 확인하여 해당하는 인덱스의 pcode,su을  변수에 누적
    	var sub=document.getElementsByClassName("sub");
    	var len=sub.length;
    	
    	var pcode="";
    	var su="";
    	for(i=0;i<len;i++)
    	{
    		if(sub[i].checked) // 체크박스가 체크되었다면 구매하는 상품이므로 pcode랑 su를 저장
    		{
    			pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
    			su=su+document.getElementsByClassName("su1")[i].value+",";
    		}	
     	}
    	
    	//alert(pcode+" "+su);
    	
    	location="progumae?pcode="+pcode+"&su="+su;
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
      <input type="hidden" class="pcode" value="${map.pcode}">
      <c:set var="aa" value=""/>
      <tr class="prod"> <!-- 상품당 tr이 출력 -->
        <td width="40"> <input type="checkbox" class="sub" value="${map.no}" onclick="subClick()"> </td> <!-- 상품별 체크박스 -->
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
           <input type="hidden" class="beforesu" value="${map.su}">
           <input type="text" name="su" class="su2" onblur="txtChange(this,${sts.index},${map.no})"> <!-- 수량을 직접입력하는 텍스트박스 -->
           <br> <input type="button" value="변경" class="subtn" onclick="changeSu2(${sts.index},${map.no})" > <!-- 10개 이상 수량의 변경시 -->
        </td>
        <td width="130" align="right"> 
           <span class="sangprice"> <fmt:formatNumber value="${map.price*map.su}" type="number"/></span>원
           <img src="/static/product/del.png" valign="middle" onclick="cartDel(${map.no}, this, ${sts.index})"> 
        </td>
        <td width="80" align="right"> 
         <c:if test="${map.bprice == 0}">
             <span class="bprice">무료배송</span>
         </c:if>
         <c:if test="${map.bprice != 0}">
             <span class="bprice"><fmt:formatNumber value="${map.bprice}" type="number"/></span>원
         </c:if>
          
        </td>
      </tr>
    </c:forEach>  
      <tr id="mainrow">
        <td colspan="6">
         <input type="checkbox" class="main" onclick="mainClick(this,0)">
          전체선택 (<span id="aa">0</span>/<span id="bb">${mapall.size()}</span>) 
           <input type="button" value="선택삭제" id="alldel" onclick="selectDel()">
        </td>
      </tr>
      <tr>
        <td colspan="6" align="center"> 
             총 상품가격 <span id="chongprice">0</span>원 + 총 배송비 <span id="chongbae">0</span>원 = 
             총 주문금액 <span id="chongjumun">0</span>원
        </td> <!-- 총 상품가격,배송비, 주문금액 -->
      </tr>
      <tr>
        <td colspan="6" align="center">
          <input type="button" value="계속 쇼핑하기" id="goshop">
          <input type="button" value="구매하기" id="gumae" onclick="moveGumae()">
        </td>
      </tr>
   </table>
 </section> 
</body>
</html>







