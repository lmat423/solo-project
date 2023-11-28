<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   section {
     width:1100px;
     margin:auto;
     margin-top:40px;
     position:relative;
   }
   section #baeReq {
     position:absolute;
     left:230px;
     top:503px;
     width:190px;
     height:120px;
     border:1px solid green;
     background:white;
     font-size:14px;
     visibility:hidden;
   }
   section #baeReq div {
     margin-top:3px;
   }
   section h2 {
     border-bottom:3px solid green;
     padding-bottom:14px;
   }
   section #gibon {
      border:1px solid green;
      padding:2px;
      border-radius:10px;
      font-size:12px;
    }
   section table {
      border-spacing:0px;
      margin-top:30px;
   }
 
   section table tr:first-child td {
      border-top:2px solid green;
   }
   section table tr:last-child td {
      border-bottom:1px solid green;
   }
   section table td {
      font-size:14px;
      height:40px;
      padding-left:10px;
      border-bottom:1px solid #B3D26C;
   }
   section table tr td:first-child {
      background:#efefef;
      
   }
   section #pro td {
      font-size:18px;
      height:50px;
   }
   section input[type=text] {
      width:100px;
      height:20px;
      border:1px solid green;
      border-radius:2px;
      outline:none;
   }
   section input[type=button] {
     height:24px;
     border:1px solid green;
     background:white;
     color:green;
     cursor:pointer;
     vertical-align:top;
     border-radius:2px;
  }
  section .payment {
     display:none;
     padding-top:10px;
  }
  section .payment #sel {
     margin-left:5px;
  }
  section .payment select {
     width:100px;
     border:1px solid green;
     margin-left:20px;
  }
  section .payment:first-child {
     display:block;
  }
  
  section #submit {
     width:500px;
     height:40px;
     border:1px solid green;
     background:white;
     color:green;
     cursor:pointer;
     border-radius:2px;
     font-size:18px;
     font-weight:900;
     margin-top:40px;
  }
 </style>
 <script>
   function chgPhone()
   {
	   var phone=document.getElementById("myphone").value;
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   //alert(chk.responseText);
		   if(chk.responseText=="1")
			   alert("오류발생");
	   }
	   chk.open("get","chgPhone?phone="+phone);
	   chk.send();
   }
   function baeOpen()
   {
	   open("baelist","","width=500,height=600"); // 나타낼뷰(문서) , 타겟명 , 브라우저 설정
   }
   
   function chgPayment(n)
   {
	   var payment=document.getElementsByClassName("payment");
	   
	   // 전부다 숨기기
	   for(i=0;i<payment.length;i++)
	   {
		   payment[i].style.display="none";
	   }	    
	   
	   // n에 해당하는 인덱스를 보이게 하기
	   payment[n].style.display="block";
   }
   
   function chgReq()
   {
	   document.getElementById("baeReq").style.visibility="visible";
   }
   function setReq() // baesong테이블에서 req를 변경
   {
	   // 변경될 req,  변경할 레코드의 no
	   var req=document.gform.req.value;
	   var no=document.gform.baeno.value;
	   
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   //alert(chk.responseText);
		   if(chk.responseText=="0")
		   {
			   document.getElementById("req").innerText=document.getElementsByClassName("abc")[req].innerText;
			   document.getElementById("baeReq").style.visibility="hidden";
		   }	
		   else
		   {
			   alert("오류발생");
		   }	   
	   }
	   chk.open("get","setReq?req="+req+"&no="+no);
	   chk.send();
   }
   
   function check()
   {
	   // 체크하기
	   return true;
   }
 </script>
</head>
<body>
  <section>
   <form name="gform" method="post" action="progumaeOk" onsubmit="return check()">
     <input type="hidden" name="pcode" value="${pcode}">
     <input type="hidden" name="sus" value="${su}">
     <!-- 배송요청사항 변경 레이어 -->
    <div id="baeReq">
      <div class="abc"> <input type="radio" name="req" value="0">문 앞 </div> 
      <div class="abc"> <input type="radio" name="req" value="1">직접 받고 부재시 문 앞 </div> 
      <div class="abc"> <input type="radio" name="req" value="2">경비실 </div> 
      <div class="abc"> <input type="radio" name="req" value="3">택배함 </div> 
      <div align="center"> <input type="button" value="요청변경" onclick="setReq()"> </div>
    </div>
    
    <h2 align="left"> 주문/결제 </h2>
    
    <!-- 구매자 정보 -->
    <table width="1100" align="center">
      <caption> <h3 align="left"> 구매자 정보 </h3> </caption>
      <tr>
        <td width="120"> 이 름 </td>
        <td> ${mvo.name} </td>
      </tr>
      <tr>
        <td> 이메일 </td>
        <td> ${mvo.email} </td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td>
           <input type="text" value="${mvo.phone}" id="myphone">
           <input type="button" value="변경" onclick="chgPhone()"> 
        </td>
      </tr>
    </table>
    
    <!-- 배송지 정보 -->
    <table width="1100" align="center">
      <caption> <h3 align="left"> 
          배송지 정보 
          <input type="button" value="배송지변경" onclick="baeOpen()">
         <c:if test="${bvo==null}">
          <span style="color:red;font-size:12px"> 등록된 기본배송지가 없거나 등록된 주소가 없습니다. </span>
         </c:if>
      </h3>  <caption>
      <tr>
        <td width="120"> 이 름 </td>
        <td id="name"> 
          ${bvo.name}
          <c:if test="${bvo.gibon==1}">
           <span id="gibon">기본배송지</span>
          </c:if>
        </td>
      </tr>
      <tr>
        <td> 주 소 </td>
        <td id="juso"> ${bvo.juso} </td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td id="phone"> ${bvo.phone} </td>
      </tr>
      <tr>
        <td> 배송요청사항 </td>
        <td>
          <span id="req"> 
          <c:if test="${bvo.req==0}">
            문 앞
          </c:if>
          <c:if test="${bvo.req==1}">
           직접 받고 부재시 문 앞
          </c:if>
          <c:if test="${bvo.req==2}">
           경비실
          </c:if>
          <c:if test="${bvo.req==3}">
           택배함
          </c:if>
          </span>
          <input type="button" value="변경" onclick="chgReq()"> 
          <input type="hidden" name="baeno" id="baeno" value="${bvo.no}"> <!-- 배송지테이블의 no -->
        </td>
      </tr>
    </table>
    
    <!-- 구매 상품 -->
    <table width="1100" align="center">
      <caption> <h3 align="left"> 배송 정보</h3> </caption>
    <c:set var="sp" value="0"/> <!-- (product.price필드 * 수량) 상품별로 합을 -->
    <c:set var="bsb" value="0"/> <!-- product.bprice , 상품별 합 -->
    <c:set var="juk" value="0"/> <!-- (product.juk을 이용하여 상품적립금  , 상품별 합 -->
    <c:set var="cp" value="0"/>  <!-- sp-할인금액   ,  상품별 합 -->
    <c:set var="jukh" value=""/> <!-- 상품별 적립금을 ,로 구분할 변수 -->
    <c:set var="chongprice" value=""/> <!-- 상푸별 결제금액을 ,로 구분하여 저장할 변수 -->
    <c:forEach items="${plist}" var="pvo"> 
      <tr id="pro">
        <td colspan="2"> 
          ${pvo.yoil}요일 ${pvo.writeday} 도착 예정
        </td> <!-- 도착정보 -->
      </tr>
      <tr id="pro">  <!--  상품관련 -->
        <td width="600" style="background:white;"> ${pvo.title}</td>
        <td> 
           수량 ${pvo.su}개 /
           <c:if test="${pvo.bprice == 0}">
             무료배송
           </c:if>
           <c:if test="${pvo.bprice != 0}">
             <fmt:formatNumber value="${pvo.bprice}" type="number"/>원
           </c:if>
        </td>
      </tr>
      
    <c:set var="sp" value="${sp+(pvo.price-(pvo.price*(pvo.halin/100)))*pvo.su}"/>  
    <c:set var="bsb" value="${bsb+pvo.bprice}"/>  
    <c:set var="juk" value="${juk+pvo.price*(pvo.juk/100)}"/>  
    <c:set var="cp" value="${cp+((pvo.price-(pvo.price*(pvo.halin/100)))*pvo.su)+pvo.bprice}"/>  
      
    <c:set var="jukh" value="${jukh}${pvo.price*(pvo.juk/100)},"/>
    <c:set var="chongprice" value="${chongprice}${((pvo.price-(pvo.price*(pvo.halin/100)))*pvo.su)+pvo.bprice},"/>
    </c:forEach>
    </table>
    
    <input type="hidden" name="juks" value="${jukh}"> <!-- 구매시 사용한 적립금 -->
    <input type="hidden" name="chongprices" value="${chongprice}>">
    
    
    <!-- 결제 정보 -->
    <table width="1100" align="center">
      <caption> <h3 align="left"> 결제정보 </h3> </caption>
      <tr>
        <td> 총상품가격 </td> <!-- 할인율을 포함 -->
        <td> 
          <fmt:formatNumber value="${sp}" type="number" pattern="#,###"/>원</td>
      </tr>
      <tr>
        <td> 배송비 </td>
        <td> <fmt:formatNumber value="${bsb}" type="number"/>원 </td>
      </tr>
      <tr>
        <td> 적립금 </td>
        <td> <fmt:formatNumber value="${juk}" type="number" pattern="#,###"/>원 적립예정</td>
      </tr>
      <tr>
        <td> 총결제가격 </td>
        <td> <fmt:formatNumber value="${cp}" type="number" pattern="#,###"/>원 </td>
      </tr>
      <tr>
        <td rowspan="2" width="120"> 결제방법 </td>
        <td> 
          <input type="radio" name="pay" value="0" checked onclick="chgPayment(0)">계좌이체
          <input type="radio" name="pay" value="1"onclick="chgPayment(1)">신용/체크카드
          <input type="radio" name="pay" value="2" onclick="chgPayment(2)">법인카드
          <input type="radio" name="pay" value="3" onclick="chgPayment(3)">휴대폰
        </td>
      </tr>
      <tr>
         <td style="background:white;"> 
           <div class="payment">
              <span id="sel"> * 은행선택 </span>  
              <select name="bank">
                <option value="0"> 신한은행 </option>
                <option value="1"> 농협은행 </option>
                <option value="2"> 우리은행 </option>
                <option value="3"> 하나은행 </option>
                <option value="4"> KB은행 </option>
                <option value="5"> 한국은행 </option>
              </select> <p>
              <input type="checkbox" checked value="0" name="sudan">기본 결제 수단으로 사용
           </div>   <!-- document.getElementsByClassName("payment")[0] -->
           <div class="payment">
             <span id="sel"> * 카드선택 </span> 
             <select name="card">
                <option value="0"> 신한카드 </option>
                <option value="1"> 농협카드 </option>
                <option value="2"> 우리카드 </option>
                <option value="3"> 하나카드 </option>
                <option value="4"> KB카드 </option>
                <option value="5"> 한국카드 </option>
             </select> <p>
             <span id="sel"> * 할부기간  </span> 
             <select name="halbu">
                <option value="0"> 일시불 </option>
                <option value="3"> 3개월 </option>
                <option value="6"> 6개월 </option>
                <option value="9"> 9개월 </option>
                <option value="12"> 12개월 </option>
             </select> <p>
             <input type="checkbox" checked value="1" name="sudan">기본 결제 수단으로 사용
           </div>
           <div class="payment">
             <span id="sel">  * 카드선택 </span>  
             <select name="card">
                <option value="0"> 신한카드 </option>
                <option value="1"> 농협카드 </option>
                <option value="2"> 우리카드 </option>
                <option value="3"> 하나카드 </option>
                <option value="4"> KB카드 </option>
                <option value="5"> 한국카드 </option>
             </select> <p>
             <span id="sel"> * 할부기간 </span>  
             <select name="halbu">
                <option value=""> 일시불 </option>
             </select> 법인카드는 일시불 결제만 가능합니다.
             <p>
             <input type="checkbox" checked value="2" name="sudan">기본 결제 수단으로 사용
           </div>
           <div class="payment">
             <span id="sel"> * 통신사 종류 </span> 
             <select name="tongsin">
               <option value="0"> SKT </option>
               <option value="1"> KT </option>
               <option value="2"> LG </option>
               <option value="3"> 그 외 </option>
             </select> <p>
             <input type="checkbox" checked value="3" name="sudan">기본 결제 수단으로 사용
           </div> 
         </td>
      </tr>
    </table>
    
    <div align="center"> <input type="submit" value="구매하기" id="submit"> </div>
    
    </form>
  </section>
</body>
</html>













