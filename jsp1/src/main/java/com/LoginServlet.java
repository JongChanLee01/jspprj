package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description="Hello World", urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		System.out.print("서비스가 실행중입니다");
		String str="<p>서비스 실행....</p>";
		// response.getWriter().print(str);
		
		PrintWriter out = response.getWriter();
		out.append("<p>서비스 실행....</p>");
		out.append("<h2>Hello Servlet !!!</h2>");
		
		doPost(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("doGet이 실행되었습니다.");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("doPost가 실행되었습니다.");
		response.getWriter().append("<p>doPost가 실행되었습니다.</p>");
		doGet(request, response);
	}

}
