<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
    <table width="500" height="400" border="1">
      <c:set var="day" value="1"/>
      <c:forEach begin="1" end="${ju}" var="i">
        <tr>  
          <c:forEach begin="0" end="6" var="j">
          
           <c:if test="${ (i==1 && j < yoil) || (chong < day) }">  <!-- 값이 출력되지 않는 td -->
             <td> </td>
           </c:if>
           <c:if test="${  (i!=1 || j >= yoil) && (chong >= day)   }"> <!-- 값이 출력되는 td -->
             <td> ${day} </td>
             <c:set var="day" value="${day+1}"/>
           </c:if>
           
           
          </c:forEach>        
        </tr>
      </c:forEach>
    </table>
</body>
</html>










