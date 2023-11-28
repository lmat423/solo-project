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
   }
   section h2 {
     
   }
   section #title {
      height:80px;
      line-height:80px;
      text-align:center;
      border-top:2px solid green;
      border-bottom:2px solid green;
      font-size:18px;
      font-weight:900;
   }
   section #firsttable {
      margin-top:40px;
   }
   section #ptitle {
      font-size:18px;
      border-top:2px solid green;
      height:60px;
   }
   section #pcontent {
      border-bottom:2px solid green;
   }
   
   section #secondtable {
      margin-top:60px;
   }
   section #secondtable tr td {
      height:36px;
   }
   section #secondtable tr:first-child td {
      font-size:18px;
      font-weight:900;
   }
   section #secondtable tr #ctd {
      border-left:2px solid green;
      padding-left:60px;
   }
   section #secondtable tr:last-child td {
      border-bottom:2px solid green;
   }
   section #chg {
      font-size:12px;
      color:blue;
      cursor:pointer;
   }
   section #bottom {
      text-align:center;
      margin-top:40px;
   }
   section #bottom input[type=button] {
      width:300px;
      height:40px;
      border:1px solid green;
      background:white;
      font-size:15px;
   }
   section #bottom input[type=button]:last-child {
      background:green;
      color:white;
      margin-left:30px;
   }
   
  </style>
</head>
<body>
  <section>
    <h2> 주문완료 </h2>
    <div id="title"> 주문이 완료되었습니다. 감사합니다. </div>
    <table width="1100" align="center" cellspacing="0" id="firsttable">
      <caption> <h3 align="left"> 상품배송정보 </h3></caption>
     <c:set var="happrice" value="0"/>
     <c:set var="baeprice" value="0"/>
     <c:forEach items="${mapall}" var="map">  
      <tr>
        <td colspan="2" id="ptitle"> ${map.baeday}(${map.yoil}) 도착예정(상품 1개) </td>
      </tr>
      <tr>
        <td width="100" id="pcontent"> <img src="/static/pro/${map.pimg}" width="80"> </td>
        <td id="pcontent">  
           <div> ${map.title} </div>
           <div> <fmt:formatNumber value="${map.price}"/>원 <span id="chg">(할인율 : ${map.halin}%) </span> </div>
           <div> 수량 ${map.su}개 </div>
        </td>
      </tr>
       <c:set var="happrice" value="${happrice+map.price}"/>
       <c:set var="baeprice" value="${baeprice+map.bprice}"/>
     </c:forEach>
    </table>
    
    <!-- 받는사람, 결제정보 -->
    <table width="1100" align="center" id="secondtable" cellspacing="0">
      <tr>
        <td colspan="3"> 받는사람 정보 </td>
        <td colspan="2" id="ctd"> 결제 정보 </td>
      </tr>
      <tr>
        <td width="120"> 받는 사람 </td>
        <td width="260"> ${mapall.get(0).name} / ${mapall.get(0).phone} </td>
        <td width="120"> </td>
        <td width="120" id="ctd"> 주문 금액 </td>
        <td> 
            <fmt:formatNumber value="${happrice}"/>원 <br>
        </td>
      </tr>
      <tr>
        <td> 받는 주소 </td>
        <td> ${mapall.get(0).zip} ${mapall.get(0).juso} ${mapall.get(0).jusoEtc} </td>
        <td align="center"> <span id="chg"> 변경하기 </span></td>
        <td id="ctd"> 배송비 </td>
        <td> <fmt:formatNumber value="${baeprice}"/>원 </td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td> ${mapall.get(0).phone} </td>
        <td align="center"> <span id="chg"> 변경하기 </span></td>
        <td id="ctd"> 결제금액 </td>
        <td style="color:red;font-size:18px;"> <fmt:formatNumber value="${happrice+baeprice}"/>원 </td>
      </tr>
    </table>
    <div id="bottom">
      <input type="button" value="주문 내역보기">
      <input type="button" value="계속 쇼핑하기" onclick="location='../main/main'">
    </div>
  </section>
</body>
</html>





