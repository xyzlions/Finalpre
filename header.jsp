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
</head>

<body>
    <!-- header/start -->
    <header class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <a class="navbar-brand" href="index.jsp">
                <img src="./images/logo.png" alt="logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">首頁</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">關於岡南</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="shop.jsp">產品商城</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="job.jsp">人力資源</a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="view.jsp">留言板</a>
                    </li>
                </ul>
                <div class="ml-auto">
                 <%
				try {
				Class.forName("com.mysql.jdbc.Driver");
			try {
				String url="jdbc:mysql://localhost/";
				String sql="";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				out.println("連線建立失敗");
				else {  			
				sql="use final";
				con.createStatement().execute(sql);
				sql="select * from counter";
				ResultSet rs=con.createStatement().executeQuery(sql);
				while(rs.next())
				{
				int countint=Integer.parseInt(rs.getString(1));
				if(session.isNew())
				{
				countint++;
				}
				String countstr=String.valueOf(countint);
				sql="update counter set count="+countint;
				con.createStatement().executeUpdate(sql);
				out.print("<p align='right'>網頁瀏覽人次:"+countstr+"</p>");
				}
				con.close();
				}
				}
				catch (SQLException sExec) {
				out.println("SQL錯誤"+sExec.toString());
				}
				}
			catch (ClassNotFoundException err) {
				out.println("class錯誤"+err.toString());
				}			

				%>
					<% 

	if( session.getAttribute("mid") != null ){		
			 mid = session.getAttribute("mid").toString();	
			if( mid.equals ("cyim4875")){
%>					<a href="logout.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">登出</a>
                    <a href="cart.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">購物車</a>
					<a href="member.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">管理專區</a>
					<a href="group.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">組員介紹</a>
					
			<%}else{%>
					<a href="logout.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">登出</a>
                    <a href="cart.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">購物車</a>
					<a href="member.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">會員專區</a>
					<a href="group.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">組員介紹</a>
			<%}
			}else {%>
					<a href="loginregister.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">登入</a>
                    <a href="cart.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">購物車</a>
					<a href="member.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">會員專區</a>
					<a href="group.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">組員介紹</a>
<%}%>
                </div>
            </div>
        </nav>
    </header>
    <!-- header/end -->