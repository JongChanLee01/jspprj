<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>
</head>
<body>
	<h1>구구단</h1>
	<%
		out.println("<table>");
		for(int i=1; i<=9; i++){
			out.print("<tr>");
			for(int j=2; j<=9; j++){
				out.print("<td>");
				out.println(j+"X"+i+"="+(j*i));
				out.print("</td>");
			}
			out.print("</tr>");
		}
		out.println("</table>");
	%>
	<br/>
	<%
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
	%>
	<% 
		if(hour<12){
			out.print("Good Morning!");
		}else if(hour<18){
			out.print("Good Afternoon!");
		}else{
			out.print("Good Evening!");
		}
	%>
	<!-- 아래처럼 끊어서 사용해도 적용이됨 -->
	<%--
	<% if (hour < 12) { %>
    	Good Morning!
	<% } else if (hour < 18){ %>

	    Good Afternoon!
	<% } else { %>
	    Good Evening!    
	<% } %>
	--%>
	
	<br/>
	지금은 <%= year %>년 <%= month %>월 <%= day %>일 <%= hour %>시 <%= minute %>분 <%= second %>초 입니다.
	
	
	
	<table>
	  <tr>
		<% for (int i=1; i <= 10; ++i) { %> 
		    <td style='background-color: <%= (i%2)==0 ? "#ffffcc" : "#ccffcc" %>' ><%= i %></td>
		<% } %>
	  </tr>
	</table>
	
	<br/>
	<h1>구구단2</h1>
	<%
		out.println("<table>");
		out.print("<tr>");
		for(int i=2; i<=9; i++){
			out.print("<td>");
			for(int j=1; j<=9; j++){
				out.println(i+"X"+j+"="+(i*j)+"<br/>");
			}
			out.print("</td>");
		}
		out.print("</tr>");
		out.println("</table>");
	%>
	<br/>
	<h1>구구단3</h1>
	<%
		out.println("<table>");
		out.print("<tr>");
		for(int i=2; i<=5; i++){
			out.print("<td>");
			for(int j=1; j<=9; j++){
				out.println(i+"X"+j+"="+(i*j)+"<br/>");
			}
			out.print("</td>");
		}
		out.print("</tr>");
		
		out.print("<tr>");
		for(int i=6; i<=9; i++){
			out.print("<td>");
			for(int j=1; j<=9; j++){
				out.println(i+"X"+j+"="+(i*j)+"<br/>");
			}
			out.print("</td>");
		}
		out.print("</tr>");
		out.println("</table>");
	%>
	<br/>
</body>
</html>