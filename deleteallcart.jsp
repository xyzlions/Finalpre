<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../Finalpre/config.jsp" %>

<%
  
sql="delete from cart where mid='"+session.getAttribute("mid")+"'";
		 con.createStatement().execute(sql);
		
		response.sendRedirect("member.jsp") ;
%>
