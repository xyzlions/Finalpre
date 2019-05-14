<!DOCTYPE html>
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
</head><body>
<%String mid;%>
<%@include file ="header.jsp"%>
    <!-- 登入與註冊/start -->
	<% 
	
	if( session.getAttribute("mid") != null ){		
%><p align="center">已登入，將自動跳轉至會員專區</p><meta http-equiv='refresh' content='1; url=../Finalpre/member.jsp'>
<%	
	}else{
	%>
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 登入/start -->
                <div class="col-12 col-md-6 mb-5">
                    <h2>登入</h2>
                    <form action="checklogin.jsp">
                        <div class="form-group">
                            <label for="mid">帳號
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mid" type="text" class="form-control" id="Email" placeholder="必填，帳號" required>
                        </div>
                        <div class="form-group">
                            <label for="Password">密碼
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mpwd" type="password" class="form-control" id="Password" placeholder="必填，密碼" required>
                        </div>
                        <button type="submit" class="btn btn-primary send-btn">登入</button>
                    </form>
                </div>
                <!-- 登入/end -->
                <!-- 註冊/start -->
                <div class="col-12 col-md-6 mb-3">
                    <h2>註冊</h2>
                    <form action="addmember.jsp" method="Post">
                        <div class="form-group">
                            <label for="RegisteredAccount">帳號
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mid" type="text" class="form-control" id="RegisteredAccount" placeholder="必填，帳號" required>
                        </div>
                        <div class="form-group">
                            <label for="RegisteredEmail">電子信箱
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mmail" type="email" class="form-control" id="RegisteredEmail" placeholder="必填，電子信箱" required>
                        </div>
                        <div class="form-group">
                            <label for="RegisteredPassword">密碼
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mpwd" type="password" class="form-control" id="RegisteredPassword" placeholder="必填，密碼" required>
                        </div>
                        <button type="submit" class="btn btn-primary send-btn">註冊</button>
                    </form>
                </div>
                <!-- 註冊/end -->
            </div>
        </div>
    </section>
    <!-- 登入與註冊/end -->
	<%}%>
<%@include file ="ender.jsp"%>
    <!-- 頁腳/end -->
</body>
</html>