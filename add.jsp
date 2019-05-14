<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>���n�콦�o�w�������q</title>
    <link rel="shortcut icon" type="image/png" href="./images/logo.png"/>
    <!-- CSS�����J -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
    <!-- js�����J -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
</head>
<%String mid;%>
<%@include file ="header.jsp"%>
<body>
<%!
	String ln(String inp)
	{
		int br=0;
		while((br=inp.indexOf("\n"))!=-1)
		{
			inp=inp.substring(0,br)+"<br>"+inp.substring(br+1);
		}
		while((br=inp.indexOf(" "))!=-1)
		{
			inp=inp.substring(0,br)+"&nbsp;"+inp.substring(br+1);
		}
		return inp;
		
	}
%>
<%
try {
//Step 1: ���J��Ʈw�X�ʵ{�� 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: �إ߳s�u 	
        String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=big5&serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("�s�u�إߥ���");
        else {
//Step 3: ��ܸ�Ʈw   
           sql="use final";
           con.createStatement().execute(sql);
           //�q���ǻ�������Ʈw, �����ϥ�getBytes("ISO-8859-1")�s�X
           String new_mname=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");
//           String new_mname=request.getParameter("mname");
           String new_mmail=request.getParameter("mmail");
           String new_pname=new String(request.getParameter("pname").getBytes("ISO-8859-1"),"UTF-8");
           String new_bcontent=new String(request.getParameter("bcontent").getBytes("ISO-8859-1"),"UTF-8");
		   String IP =request.getRemoteAddr();
           java.sql.Date new_bdatetime=new java.sql.Date(System.currentTimeMillis());
//Step 4: ���� SQL ���O	
			sql="select bno from guestbook";
			ResultSet rs=con.createStatement().executeQuery(sql);
			rs.last();
			int new_bno=rs.getRow();
           sql="insert guestbook (bno,mname, mmail,bcontent , IP, bdatetime, pname) ";
           sql+="value ('" + (new_bno+1) + "', ";
           sql+="'"+new_mname+"', ";
		   sql+="'"+new_mmail+"', ";
           sql+="'"+new_bcontent+"', ";
           sql+="'"+IP+"', ";   
           sql+="'"+new_bdatetime+"', ";
		   sql+="'"+new_pname+"')";
out.println(sql);
           con.createStatement().execute(sql);
		 
//Step 6: �����s�u
           con.close();
		   
//Step 5: ��ܵ��G 
          //������̷ܳs�����
           response.sendRedirect("view.jsp?page=1");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL���~"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class���~"+err.toString());
}
%>
<%@include file ="ender.jsp"%>
</body>
</html>
