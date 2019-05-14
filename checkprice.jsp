<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>岡南塑膠發泡有限公司</title>
    <link rel="shortcut icon" type="image/png" href="./images/logo.png"/>
    <!-- CSS文件載入 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
    <!-- js文件載入 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
	<title>計算購物車商品</title>
</head>
<%String mid;%>
<%@include file ="header.jsp"%>


<body>
<p align="center"><%if( session.getAttribute("mid") != null ){%>
<%
try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
			String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
			sql="use final";
			con.createStatement().execute(sql);
			String new_pid=request.getParameter("pprice");
			ResultSet rs=con.createStatement().executeQuery(sql);
				sql="select * from cart where mid='"+session.getAttribute("mid")+"'";
			rs=con.createStatement().executeQuery(sql);
			int total_pprice=0;
			String pprice="";
			String pnum="";
			out.println("<div class='col-12 col-md-6 mb-5'>");
                    out.println("<h2>購物車總計</h2>");
                    out.println("<div class='table-responsive-sm table-middle'>");
                        out.println("<table class='table table-bordered'>");
                            out.println("<tbody>");
			while(rs.next())
			{	
				pprice=rs.getString(3);
				pnum=rs.getString(5);
				int new_pprice=Integer.parseInt(pprice);
			int new_ordpnum=Integer.parseInt(pnum);
			
			
                                out.println("<tr>");
                                    out.println("<td>小計</td>");
                                    out.println("<td>NT$&nbsp;"+(new_pprice*new_ordpnum)+"</td>");
                                out.println("</tr>");
                                out.println("<tr class='bg-info'>");
                                    total_pprice+=(new_pprice*new_ordpnum);
				con.createStatement().execute(sql);
			}out.println("<td>總計</td>");
                                    out.println("<td>NT$&nbsp;"+total_pprice+"</td>");
                                out.println("</tr>");
                            out.println("</tbody>");
                            out.println("<tfoot>");
                                out.println("<tr>");
                                    out.println("<td colspan='2'>");
                                        out.println("<a href='checkout.jsp' class='btn btn-outline-info btn-lg float-right'>前往結帳</a>");
                                    out.println("</td>");
                                out.println("</tr>");
                            out.println("</tfoot>");
                        out.println("</table>");
                    out.println("</div>");
                out.println("</div>");
			
			con.close();
			
			}

				}
			catch (SQLException sExec)
			{
				out.println("SQL錯誤"+sExec.toString());
			}
				}
			catch (ClassNotFoundException err)
			{
			out.println("class錯誤"+err.toString());
			}
%></p><%}else{
	out.println("<a href='loginregister.jsp' class='card'><h2><p align='center' valign='center' >未登入！！！將轉入登入畫面！！！</p></h2></a>");
	out.println("<meta http-equiv='refresh' content='3; url=../Finalpre/loginregister.jsp'>");
	}%>
<%@include file ="ender.jsp"%>
</body>
</html>