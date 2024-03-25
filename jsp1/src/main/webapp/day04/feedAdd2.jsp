<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.FeedDAO" %>
<%
request.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("id");
    String ucon = request.getParameter("content");

    
    System.out.print(uid); 
    
    FeedDAO dao = new FeedDAO();

    if (dao.insert(uid, ucon)) {
    	response.sendRedirect("main2.jsp");
        //out.print("작성하신 글이 업로드되었습니다.");
        //List list = dao.getList();
        //out.print(list);
    }
    else {
        out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
    }
%>