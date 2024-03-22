<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // request.getParameter("n1") 은 String 형식을 받아오는 것이라 인트형으로 변환
    int n1 = Integer.parseInt(request.getParameter("n1"));
    int n2 = Integer.parseInt(request.getParameter("n2"));
    
    long result = 0;
    
    String op = request.getParameter("op");
    
    switch(op){
	    case "+": result= n1+n2; break;
	    case "-": result= n1-n2; break;
	    case "*": result= n1*n2; break;
	    case "/": result= n1/n2; break;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>계산 결과 JSP</h2>
결과 : <%= result %>

</body>
</html>