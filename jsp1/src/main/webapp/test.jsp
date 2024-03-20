<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp 시작</h1>
	<p>jsp에 오신것을 환영합니다.</p>
	<h2>스크립트 태그</h2>
	
	<!-- 선언문 태그 -->
	<%-- jsp --%>
	<%!
		int count=3;
		String makeLower(String data){
			return data.toLowerCase();
		}
	%>
	
	<%
		for(int i=1;i<count; i++){
			out.println("Java Server "+i+"</br>");
		}
	%>
	
	<%= makeLower("Welcome to my world") %>
	<%= makeLower("안녕하세요") %>
	
	
	<%! int count2=0; %>
	<%
		out.println(++count2);
	%>
	
	<%
		out.print(myMethod(0));
	%>
	<%!
		public int myMethod(int count){
			return ++count;
		}
	%>
</body>
</html>