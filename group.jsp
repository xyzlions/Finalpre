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
<%String mid;%>
<%@include file ="header.jsp"%>
<html>
<head>
<title>團隊介紹</title>
</head>
<body>
<center>
<p align="center">
<a href="group.jsp" class="btn btn-outline-success text-success my-2 my-sm-0">組員介紹</a>
<%
				out.println("<div class='col-12 col-sm-6 col-md-3'>");
					out.println("<div href='#' class='card mb-3'>");
						out.println("<div class='card-body'>");
							out.println("<h4 class='card-title'>資管二乙</h4>");
							out.println("<p class='card-text'>學號:10644248</p>");
							out.println("<h5 class='card-text'>呂佩諭</h5>");
							out.println("<h5 class='card-text'>後端:基礎、延伸、後台</h5>");
							out.println("</div>");
					out.println("</div>");
				out.println("</div>");
				out.println("<div class='col-12 col-sm-6 col-md-3'>");
					out.println("<div href='#' class='card mb-3'>");
						out.println("<div class='card-body'>");
							out.println("<h4 class='card-title'>資管二乙</h4>");
							out.println("<p class='card-text'>學號:10644275</p>");
							out.println("<h5 class='card-text'>梁秋蓮</h5>");
							out.println("<h5 class='card-text'>後端:延伸</h5>");
						out.println("</div>");
					out.println("</div>");
				out.println("</div>");
%>
<a href="index.jsp"><img src="back.png" ></a></p>
<%@include file ="ender.jsp"%>
</body>
</html>