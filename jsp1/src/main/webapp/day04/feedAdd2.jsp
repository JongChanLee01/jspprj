<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="dao.FeedDAO" %>
<%
request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String ucon = request.getParameter("content");

    
    System.out.print(uid); 
    
    FeedDAO dao = new FeedDAO();

    if (dao.insert(uid, ucon)) {
        out.print("�ۼ��Ͻ� ���� ���ε�Ǿ����ϴ�.");
        List list = dao.getList();
        out.print(list);
    }
    else {
        out.print("�ۼ� ���� ���ε� �� ������ �߻��Ͽ����ϴ�.");
    }
%>