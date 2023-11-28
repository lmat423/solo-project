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
     margin-bottom:50px;
     position:relative;
   }
   section #content {
     width:1100px;
     height:550px;
   }
   section #content #left {
     width:540px;
     float:left;
   }
   section #content #right {
     width:540px;
     float:right;
   }
   section #content #prodetail {
     clear:both;
   }
   section  #prodetail h2{
     text-align:left;
     border-bottom:3px solid green;
     padding-bottom:10px;
     margin-bottom:40px;
   }
   section #content #right > div {
      margin-top:20px;
      border-bottom:1px solid #cccccc;
      padding-bottom:20px;
   }
   section #jukline {
      display:inline;
      padding:2px;
      padding-left:8px;
      padding-right:8px;
      border:1px solid #cccccc;
      border-radius:10px;
    }
    section #su {
      outline:none;
    }
    
    section #submenu {  /* div */
       clear:both;
       width:1100px;
       height:50px;
       margin:auto;
       margin-bottom:40px;
       position:relative;
       background:white;
    }
    section #submenu #inmenu{  /* ul */
       padding-left:0px;
       background:white;
    }
    section #submenu #inmenu li {
       list-style-type:none;
       display:inline-block;
       width:267px;
       height:50px;
       line-height:50px;
       text-align:center;
       border:1px solid #cccccc;
       background:white;
    }
    section #submenu #inmenu li a{
       text-decoration:none;
       color:black;
       font-size:18px;
       font-weight:900;
       display:inline-block;
       width:100%;
       height:100%;
    }
    section #prodetail {
       width:1100px;
       margin:auto;
       text-align:center;
    }
  
    
 </style>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <script>
   $(function()
   {
  	 // type="text"를 버튼을 통해 숫자를 증감 시키는 기능
  	 
  	 $("#su").spinner(
   	 {
   		 min:1,
   		 max:${pvo.su},
   		 spin:function(e,ui) // 버튼이 클릭되었을때 동작하는 메소드
   		 {
  			 //alert(ui.value);
   			 //document.getElementById("cntprice").innerText=comma(${pvo.price}*ui.value)+"원";
   			 $("#cntprice").text(comma(${pvo.price}*ui.value)+"원");
           	 //document.getElementById("halprice").innerText=comma(${pvo.price-(pvo.price*(pvo.halin)/100)}*ui.value)+"원";
           	 $("#halprice").text(comma(${pvo.price-(pvo.price*(pvo.halin)/100)}*ui.value)+"원");
           	 //document.getElementById("juk").innerText=comma(${pvo.price*(pvo.juk/100)+100}*ui.value)+"원";
           	 $("#juk").text(comma(${pvo.price*(pvo.juk/100)+100}*ui.value)+"원");
   		 }
   	 });
  	 
  	 if("${ct}"=="1")
  	 {	 
  	    document.getElementById("cartmove").style.visibility="visible";
        setTimeout(function()
        {
       	 document.getElementById("cartmove").style.visibility="hidden";
        },3000);   
  	 }
 	 
  	 
  	 
  });  
        
      
   
    function comma(num)
    {
     	 return new Intl.NumberFormat().format(num);
    }
     
    function addjjim(src)
    {
    	//alert(src.indexOf("jjim2.png"));
    	if(src.indexOf("jjim1.png") == -1)  //참이면 빨간하트 jjim1.png그림이 아니다
    	{
    		var url="deljjim?pcode=${pcode}";
    		var img="/static/product/jjim1.png";
    	}
    	else                               // 거짓이면 흰하트가 
    	{
    		var url="addjjim?pcode=${pcode}";
    		var img="/static/product/jjim2.png"
    	}	
        //alert(url);
    	 
    	var chk=new XMLHttpRequest();
        chk.onload=function()
        {
        	//alert(chk.responseText);
        	if(chk.responseText=="1")
        		alert("잘못된 동작이 발생했습니다");
        	else if(chk.responseText=="0")
        		   document.getElementById("jjim").src=img;
        	else if(chk.responseText=="2")
        		   location="../member/login?pcode=${pcode}";
        }
        chk.open("get",url);
        chk.send();
         
    }
    
    function cartadd()
    {
    	// 클릭된 마우스의 좌표를 읽기
    	//var x=event.clientX;
    	//var y=event.clientY;
    	//alert(x+" "+y);
    	
    	// ajax를 통해 cart테이블에 상품코드,수량,아이디를 저장하는 것
    	var pcode=document.pform.pcode.value;
    	var su=document.pform.su.value;
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		if(chk.responseText=="1")
    		{
    			alert("오류 발생");
    		}	
    		else 
    		{
    		    	 // 장바구니 이동 레이어를 보이게 하기
    		    	 document.getElementById("cartmove").style.visibility="visible";
    		    	 //document.getElementById("cartmove").style.top=(y-120)+"px";
    		         //document.getElementById("cartmove").style.left=(x-100)+"px";	 
    		    		 
    		         setTimeout(function()
    		         {
    		        	 document.getElementById("cartmove").style.visibility="hidden";
    		         },3000);    		         
    		}	 
    	}
    	chk.open("get","cartAdd?pcode="+pcode+"&su="+su);
    	chk.send();
    }
    
    // 상품상세관련 메뉴 고정시키기
    function moveMenu()
    {
    	var top=document.documentElement.scrollTop;
    	//document.getElementById("aa").innerText=top;
    	
    	if(top >= 722)
        {
    	   	document.getElementById("submenu").style.position="fixed";
    	   	document.getElementById("submenu").style.top="-10px";
    	   	document.getElementById("hidemenu").style.width="1100px";
    	   	document.getElementById("hidemenu").style.height="90px";
    	}
    	else
    	{
    		document.getElementById("submenu").style.position="relative"; 
    		document.getElementById("hidemenu").style.height="0px";
    	}
    }
    document.onscroll=moveMenu;
    
    function menuclick(my)
    {
    	// 모두 하얗게
    	var limenu=document.getElementsByClassName("limenu");
    	for(i=0;i<limenu.length;i++)
    	{
    		limenu[i].style.background="white";
    	}
    	
    	// 선택된 메뉴의 배경색을 변경
    	my.style.background="#eeeeee";
    }
  </script>
  <style>
    section #cartmove {
      width:140px;
      height:60px;
      border:1px solid black;
      font-size:12px;
      text-align:center;
      padding-top:5px;
      position:absolute;
      left:490px;
      top:350px;
      visibility:hidden;
      z-index:100;
      background:white;
    }
    section #cartbtn {
      width:120px;
      height:34px;
      background:white;
      border:1px solid green;
    }
    section #gumaebtn {
      width:120px;
      height:34px;
      background:green;
      border:1px solid green;
      color:white;
    }
    section #review {

    }
    section #review h2 {
      border-bottom:3px solid green;
      padding-bottom:8px;
    }
    section #review ul {
      border-bottom:1px solid green;
      padding-top:10px;
      padding-bottom:10px;
      padding-left:0px;
    }
    section #review ul li {
      list-style-type:none;
      margin-top:8px;
    }
    section #review ul .us {  /* 아이디 출력 */
      font-size:14px;
    }
    section #review ul .tit {  /* title 출력 */
      font-size:15px;
      font-weight:900;
    }
    section #review ul .con { /* 상세 출력 */
      font-size:15px;
      width:100%;
      height:80px;
      overflow:auto;
    }
    
   section #mun {
      margin-top:60px;
   } 
   section  #mun h2{
     text-align:left;
     border-bottom:3px solid green;
     padding-bottom:10px;
     margin-bottom:40px;
   }
   section #mun h2 div {
     display:inline-block;
   }
   section #mun h2 div:last-child {
     margin-left:890px;
   }
   section #mun h2 input {
     width:100px;
     height:40px;
     border:1px solid green;
     background:white;
     vertical-align:middle;
   }
   
   section .quest {
     text-decoration:none;
     color:black;
     border:1px solid green;
     font-size:18px;
     padding:5px;
   }
 
   .modal select {
     width:408px;
     height:28px;
     border:1px solid green;
   }
   .modal input[type=submit] {
     width:408px;
     height:28px;
     border:1px solid green;
     background:white;
   }
   .modal textarea {
     width:400px;
     height:70px;
     border:1px solid green;
   }
   
   section #qtable {
     margin-bottom:50px;
   }
   section #qtable tr td {
     height:34px;
   }
   section #qtable tr #qcont {
     height:80px;
     border-bottom:1px solid green;
   }
   section #qtable #abc { /* 질문 */
     border:1px solid green;
     padding:3px;
     background:#eeeeee;
     font-size:12px;
   }
   section #qtable #bbb { /* 답변 */
     border:1px solid green;
     padding:3px;
     background:green;
     color:white;
     font-size:12px;
   }
  </style>
 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
   
</head>
<body>
  <section>
 
    <div id="cartmove">
      장바구니에 담겼습니다 <p>
      <input type="button" value="장바구니 이동" onclick="location='cartView'">
    </div>
    <form method="post" action="progumae" name="pform">
     <input type="hidden" name="pcode" value="${pvo.pcode}">
    <div id="content">
      <div id="left"> <img src="/static/pro/${pvo.pimg}" width="440"> </div>
      <div id="right">
        
        <div id="title">
           <span style="font-size:18px;font-weight:900"> ${pvo.title} </span>   <img src="/static/product/${img}" id="jjim"  onclick="addjjim(this.src)" valign="middle" style="margin-left:70px;">
         <div style="letter-spacing:-3px;font-size:13px"> <!-- 별점 : double형 -->
          <!-- 노란별 -->
          <c:forEach begin="1" end="${pvo.ystar}">
            <img src="/static/product/star1.png" width="15">
          </c:forEach>
          <!-- 반별 -->
          <c:if test="${pvo.banstar==1}">
            <img src="/static/product/star3.png" width="15">
          </c:if>
          <!-- 회색별 -->
          <c:forEach begin="1" end="${pvo.gstar}">
            <img src="/static/product/star2.png" width="15">
          </c:forEach>
          ${pvo.review}개 상품평   
         </div> <!-- 별점 div 끝 -->
       </div> <!-- 상품제목 -->
        
        
        
        <div id="price"> <!-- 상품 할인율가격, 판매가격과 적립금 -->
           ${pvo.halin}%  <s id="cntprice"><fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원</s> <br>
           <span id="halprice"> <fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" type="number" pattern="#,###"/>원 </span><br>
           <div id="jukline" style="font-size:13px;">
            <img src="/static/product/juk.png" valign="bottom"> 최대 <span id="juk"><fmt:formatNumber value="${pvo.price*(pvo.juk/100)+100}" type="number" pattern="#,###"/>원</span> 적립
           </div>
        </div>  
        
        <div id="baesong"> <!-- 배송비, 도착예정 -->
          <c:if test="${pvo.bprice == 0}">
            무료배송
          </c:if>
          <c:if test="${pvo.bprice != 0}">
            <fmt:formatNumber value="${pvo.bprice}" type="number" pattern="#,###"/>원
          </c:if> 
          <br>
          ${pvo.writeday}(${pvo.yoil}) 도착예정
        </div>
        
        <div id="made">  <!-- 제조사 -->
          제조사 : ${made}
        </div>
        
        <div> <!--  구입 수량 -->
          <div id="suouter">
            <input type="text" name="su" id="su" readonly size="1" value="1">
            
           <c:if test="${pvo.su <10}"> 
            <span id="msg" style="font-size:12px;color:red"> 품절임박 잔여 : ${pvo.su}개</span>
           </c:if>
          </div>
        </div>
        
        <div id="btn">
           <input type="button" value="장바구니" onclick="cartadd()" id="cartbtn">
           <input type="submit" value="바로구매" id="gumaebtn">
        </div>
      </div> <!--  id="right"의 끝 -->
      
    </div> <!-- id="content"의 끝 -->
    <div id="hidemenu"></div>
    <div id="submenu">
        <ul id="inmenu">
          <li onclick="menuclick(this)" class="limenu"> <a href="#menu1"> 상품상세 </a> </li>
          <li onclick="menuclick(this)" class="limenu"> <a href="#menu2"> 상품평 </a></li>
          <li onclick="menuclick(this)" class="limenu"> <a href="#menu3"> 상품문의 </a></li>
          <li onclick="menuclick(this)" class="limenu"> <a href="#menu4"> 교환/반품안내 </a></li>
        </ul>
    </div>
    <div id="menu1" style="height:60px">&nbsp;</div>
    <div id="prodetail">
      <h2 class="mtitle"> 상 품 상 세 </h2>
      <img src="/static/pro/${pvo.dimg}" width="800">
    </div> <!-- 제품상세 -->
    
    <div id="menu2" style="height:60px">&nbsp;</div>
    <div id="review">
      <h2 class="mtitle"> 상 품 후 기 </h2>
      <c:forEach items="${rlist}" var="rvo">
        <div class="rv">
          <ul>
            <li> 
              <c:forEach begin="1" end="${rvo.star}">
                <img src="/static/product/star1.png" width="16">
              </c:forEach>
              <c:forEach begin="1" end="${5-rvo.star}">
                <img src="/static/product/star2.png" width="16">
              </c:forEach>
              <input type="button" value="신고" onclick="location='singo?no=${rvo.no}&pcode=${rvo.pcode}'">
            </li>
            <li class="us"> ${rvo.userid} (${rvo.writeday}) </li>
            <li class="tit"> ${rvo.title} </li>
            <li class="con"> ${rvo.content} </li>
          </ul>
        </div>
      </c:forEach>
    </div>    <!-- 상품평 -->
    <div id="menu3" style="height:18px">&nbsp;</div>
    <div id="mun">
      <h2> 
        <div> 상품문의 </div>
        <div> <a href="#ex1" rel="modal:open" class="quest"> 문의하기 </a></div> 
      </h2>
      
      <table width="1000" align="center" id="qtable" cellspacing="0">
       <c:forEach items="${qlist}" var="qvo">
        <c:if test="${qvo.title==0}"> 
          <c:set var="title" value="상품관련"/>
        </c:if>
        <c:if test="${qvo.title==1}"> 
          <c:set var="title" value="결제관련"/>
        </c:if>
        <c:if test="${qvo.title==2}"> 
          <c:set var="title" value="배송관련"/>
        </c:if>
        <c:if test="${qvo.title==3}"> 
          <c:set var="title" value="그 외"/>
        </c:if>
        <tr>
          <td> 
            <c:if test="${qvo.seq==0}">
              <span id="abc">질문</span>
            </c:if>
            <c:if test="${qvo.seq==1}">
             &nbsp;&nbsp; <span id="bbb">답변</span>
            </c:if>
            ${title} 
          </td>
          <td width="100" align="right"> ${qvo.writeday} </td> 
        </tr>
        <tr>
          <td  id="qcont">
             ${qvo.content}
          </td>
          <td  id="qcont" align="right">
           <c:if test="${qvo.userid==userid && qvo.userid!='admin'}">
            <img src="/static/product/del.png" onclick="location='questDel?no=${qvo.no}&pcode=${pcode}'">
           </c:if>
          </td>
        </tr>
       </c:forEach> 
      </table>
      
      
    </div>       <!-- 상품문의 -->
    
    <div id="menu4" style="height:60px">&nbsp;</div>
    <div id="info">
      <img src="/static/product/exch.png"/>
    </div>      <!-- 교환/반품안내 -->
    </form>
    
   
  </section>
   <!-- 문의하기 폼-->
    <div id="ex1" class="modal">
      <form method="post" action="munOk">
        <input type="hidden" name="pcode" value="${pcode}">
        <select name="title">
          <option value="0"> 상품 관련 </option>
          <option value="1"> 결제 관련 </option>
          <option value="2"> 배송 관련 </option>
          <option value="3"> 그 외 </option>
        </select> <p>
        <textarea name="content"></textarea> <p>
        <input type="submit" value="문의 등록">
      </form>
    </div>
   
</body>
</html>






