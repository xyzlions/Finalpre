<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../Finalpre/config.jsp" %>

<%

  
if(request.getParameter("mid") !=null && request.getParameter("mpwd") != null){
      
    
   sql = "SELECT * FROM member WHERE mid='" +request.getParameter("mid") + "'  AND mpwd='" + request.getParameter("mpwd") + "'"  ; 
    ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next()){            
        session.setAttribute("mid",request.getParameter("mid"));
        response.sendRedirect("member.jsp") ;
    }
    else{
        out.println("<font  size=10><center><br><br><br>賬號與密碼不符！<br>") ;
%>
<%}}%>