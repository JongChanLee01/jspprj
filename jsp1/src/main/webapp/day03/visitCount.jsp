<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    String cnt=(String) application.getAttribute("counter");
    
    int count=(cnt == null) ? 0 : Integer.valueOf(cnt);
    out.print("<br/>방문자수 :" +count);
    
    // 실행되는 동안 방문자 수를 계속 누적하여 저장함
    application.setAttribute("counter", String.valueOf(++count));
    
    %>
