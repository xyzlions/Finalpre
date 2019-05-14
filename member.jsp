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
</head><%String mid;%>

<body><%@include file ="header.jsp"%>
    <%  
	if( session.getAttribute("mid") != null ){
		mid = session.getAttribute("mid").toString();
		if( mid.equals ("cyim4875"))
{%>
	<section class="container mt-5">
	<div class="container pt-5 pb-5">
        <div class="row">
            <div class="col-12">
                <h2>管理專區</h2>
            </div>
            <div class="col-12">
                <div class="card-deck mt-2 product-categories">
                    <a href="addproduct.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">新增商品</p></h4>
                        </div>
                    </a>
                    <a href="allproductc.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">修改商品</p></h4>
                        </div>
                    </a>
                    <a href="allproductd.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">刪除商品</p></h4>
                        </div>
                    </a>
					<a href="allorder.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">訂單列表</p></h4>
                        </div>
                    </a>
                </div>
            </div>
        </div>
		</div>
    </section>
<%}
else{
%>

	<section class="container mt-5">
	<div class="container pt-5 pb-5">
        <div class="row">
            <div class="col-12">
                <h2>會員專區</h2>
            </div>
            <div class="col-12">
                <div class="card-deck mt-2 product-categories">
                    <a href="changemember.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">修改資料</p></h4>
                        </div>
                    </a>
                    <a href="cart.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">購物車</p></h4>
                        </div>
                    </a>
					<a href="morder.jsp" class="card">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center"><p align="center" valign="center">訂單列表</p></h4>
                        </div>
                    </a>
                </div>
            </div>
        </div>
		</div>
    </section>
	
<%}
	}
	else{
	out.println("<a href='loginregister.jsp' class='card'><h2><p align='center' valign='center' >未登入！！！將轉入登入畫面！！！</p></h2></a>");
	out.println("<meta http-equiv='refresh' content='3; url=../Finalpre/loginregister.jsp'>");
	}
%><%@include file ="ender.jsp"%>