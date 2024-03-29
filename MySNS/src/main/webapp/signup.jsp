<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%
request.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("id");
    
    String jsonstr = request.getParameter("jsonstr");
    
    //String upass = request.getParameter("ps");
    //String uname = request.getParameter("name");
    
    UserDAO dao = new UserDAO();
	//System.out.println(dao.exists(uid));
	
    if (dao.exists(uid)) {  	
    
        //out.print("이미 가입한 회원입니다.");
        out.print("EX");
        return;
    }
    
    //if (dao.insert(uid, upass, uname)) {
        //out.print("회원 가입이 완료되었습니다.");
        //out.print("OK");
        //session.setAttribute("id", uid);
        //response.sendRedirect("main.jsp");
   // }
    if (dao.insert2(uid, jsonstr)) {
        //out.print("회원 가입이 완료되었습니다.");
        out.print("OK");
        session.setAttribute("id", uid);
        response.sendRedirect("main.jsp");
    }
    else {
        //out.print("회원 가입 중 오류가 발생하었습니다.");
        out.print("ER");
    }
%>