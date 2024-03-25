<%-- <%@page import="java.util.List"%>
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
%> --%>

<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="dao.FeedDAO" %>
<%@page import="dao.FileUtil"%>
<%
    request.setCharacterEncoding("utf-8");

    String uid = null, ucon = null, ufname = null;
    byte[] ufile = null;

    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
    List items = sfu.parseRequest(request);
    
    // 요청값 추출

    Iterator iter = items.iterator();
    
    while(iter.hasNext()) {
        FileItem item = (FileItem) iter.next();
        String name = item.getFieldName();
        
        if(item.isFormField()) {
           // String value = item.getString();
              String value = item.getString("utf-8");  // 한글깨짐 방지

            if (name.equals("id")) uid = value;
            else if (name.equals("content")) ucon = value;
        }
        else {
            if (name.equals("image")) {
                ufname = item.getName();
                ufile = item.get();
                String root = application.getRealPath(java.io.File.separator);
                FileUtil.saveImage(root, ufname, ufile);
            }
        }
    }

    FeedDAO dao = new FeedDAO();
    if (dao.insert(uid, ucon, ufname)) {
        response.sendRedirect("main2.jsp");
    }
    else {
        out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
    }
%>