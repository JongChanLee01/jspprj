<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 아래는 코드를 좀 더 편하게 쓸 수있도록 해주는 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL 종합실습</title>
</head>
<body>
	<h1>JSTL 종합 예제</h1>
	<h3>set, out</h3>
	
	<!-- 아래가 jstl로 작성한 것 -->
	<c:set var="product1" value="<h2>애플아이폰</h2>" />
	<c:set var="product2" value="<h2>삼성 갤럭시 노트</h2>" />
	<c:set var="inArray" value="${[1,2,3,4,5]}" />
	<p>
		product1 :
		<c:out value="${product1}" default="Not regieted" escapeXml="true" />
	</p>
	<p>
		product1(false)
		<c:out value="${product1}" default="Not regieted" escapeXml="false" />
	</p>
	
	<p> products1(el) : ${product2} </p>
	<p> inArray[2] : ${inArray[2]} </p>
	
	<ul>
		<c:forEach var="num" varStatus="i" items="${inArray}">
			<li> ${i.index} : ${num} </li>
		</c:forEach>	
	</ul>
	<c:set var="strArray" value="${['월요일','화요일','수요일']}" />
	<ul>
		<c:forEach var="num" varStatus="i" items="${strArray}" >
			<li>${i.index} : ${num}</li>
		</c:forEach>
	</ul>
	<hr/>
	
	<h3>if문</h3>
	<c:set var="check" value="true" />
	<c:if test="${check }">
		<p>주문제품 : ${product2 }</p>
	</c:if>
	
	<c:set var="check" value="false" />
	<c:if test="${check }">
		<p>주문제품 : ${product2 }</p>
	</c:if>
	<c:if test="${!check }">
		<p>주문제품 : ${product1 }</p>
	</c:if>
	
	<c:if test="${!empty product2 }">
		<p>${product2 } 추가됨!!</p>
	</c:if>
	
	<hr/>
	<h3> choose, when, otherwise</h3>
	<c:choose>
		<c:when test="${check }">
			<p>주문제품2 : ${product2}</p>
		</c:when>
		<c:otherwise>
			<p>체크아웃 상태가 아님!!</p>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${!check }">
			<p>주문제품2 : ${product2}</p>
		</c:when>
		<c:otherwise>
			<p>체크아웃 상태가 아님!!</p>
		</c:otherwise>
	</c:choose>
	
	<hr/>
	<h3>forTokens</h3>
	<c:forTokens var="city" items="Seoul|busan|daegu|인천|수원" delims="|" varStatus="i">
		<c:if test="${i.first}">도시목록:</c:if>
			${city}
		<!-- 마지막 꺼가 아니면 콤마를 찍겠다. -->
		<c:if test="${!i.last}"> ,</c:if>
	</c:forTokens>
	<br/>
	<%@ page import="java.util.Date" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<c:set var="myDate" value="2023-01-01"/>
	<c:out value="${myDate }" />
	<br/>
	<br/>
	<fmt:parseDate value="2024-02-02" pattern="yyyy-mm-dd" var="cal" />
	<fmt:formatDate value="${cal }" pattern="yyyy-mm-dd" />
	
	<%
		Date currentDate =new Date();
	%>
	<p>
		<fmt:formatDate value="<%=currentDate %>" pattern="yyyy-mm-dd hh:mm:ss" />
	</p>
	<hr/>
	<h3>EL 문법</h3>
	${10+20 }
	
	<c:set var="today" value="<%= new Date() %>" />
	
	<p> 서버 시간: <fmt:formatDate value='${today }' pattern='yyyy-M-dd' /> </p>	
	<c:out value="${today }"/>
	
	<br/>
	EL을 사용하지 않는 문법 :
	<%= currentDate %>
	<br/>
	EL을 사용하는 문법 :
	<c:out value="${today }"/>
	<br/>
	<b>${today }</b>
</body>
</html>