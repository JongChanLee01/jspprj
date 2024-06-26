package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	    
	    response.setContentType("text/html; charset=utf-8");
	    
	    PrintWriter out = response.getWriter();
	    out.append("<h2>계산기 서블릿</h2>")
	    .append("계산결과 :" + result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
