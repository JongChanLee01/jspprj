package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 아래가 있어야 태그는 출력이 안되고 태그로 적용이 됨
		response.setContentType("text/html; charset=utf-8");
		
		String uid = request.getParameter("id");
		String upw = request.getParameter("pw");
		String res = "<h3>User ID:"+uid+"</h3>";
		res += "<h3>User PW:"+upw+"</h3>";
		
		response.getWriter().print(res);
	}

}
