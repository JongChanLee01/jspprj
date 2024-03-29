<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ page import="dao.FeedDAO" %>
<%@page import="util.FileUtil"%>

<%
    request.setCharacterEncoding("utf-8");

    //String uid = null, ucon = null, ufname = null;
    String jsonstr = null, ufname = null;
    byte[] ufile = null;

    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
    List items = sfu.parseRequest(request); //FileItem객체로 반환

    Iterator iter = items.iterator();
    
    while(iter.hasNext()) {
        FileItem item = (FileItem) iter.next();
        String name = item.getFieldName();
        
        System.out.println(name);
        if(item.isFormField()) {
            String value = item.getString("UTF-8");
            //if (name.equals("id")) uid = value;
            //else if (name.equals("content")) ucon = value;
            if(name.equals("jsonstr")) jsonstr = value;
            System.out.println("test1");
        }
        else {
            if (name.equals("image")) {
                ufname = item.getName();
                ufile = item.get();
                String root = application.getRealPath(java.io.File.separator);
                    System.out.println("test1");
                
                
                System.out.println("test");
                
                //String root= "D://upload" ;
                System.out.println(root);
                FileUtil.saveImage(root, ufname, ufile);
                //out.print("이미지 업로드가 완료되었습니다.");
            }
        }
    }

     FeedDAO dao = new FeedDAO();
     /*
     if (dao.insert(uid, ucon, ufname)) {
         response.sendRedirect("main.jsp");
     }
     */
     if (dao.insert(jsonstr)){
    	 out.print("OK");
     }
     else {
         //out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
         out.print("ER");
     }
%>