package com;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/studentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	StudentDAO dao;
	
    public StudentController() {
        super();
        
    }

	public void init(ServletConfig config) throws ServletException {
		dao = new StudentDAO();
	}
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		String view = "";
		
		if(action == null) {
			//getServletContext().getRequestDispatcher("/studentController?action=list").forward(request, response);
			
			RequestDispatcher dis = request.getRequestDispatcher("/studentController?action=list");
			dis.forward(request , response);
		}else {
			switch(action) {
				case "list" : view = list(request, response); break;
				case "insert": view = insert(request, response);break;
			}
			//getServletContext().getRequestDispatcher(view).forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher(view);
			dis.forward(request , response);
		}
			
	}
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		Student s = new Student();
		
		try {
			BeanUtils.populate(s, request.getParameterMap());
		}  catch (Exception e) {
		       e.printStackTrace();
		}
		dao.insert(s);
		return list(request, response); // studentInfo.jsp 리턴
	}
	
	public String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("students", dao.getAll());
		return "studentInfo.jsp";
		
		// "studentInfo.jsp" 여기로 넘기고
		//RequestDispatcher dis = request.getRequestDispatcher("studentInfo.jsp");
		
		// 전달
		//dis.forward(request, response);
	}

}
