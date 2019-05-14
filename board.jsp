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
<%String mid;%>
<%@include file ="header.jsp"%>
    <!-- 人力資源/start -->
    <%  
	if( session.getAttribute("mid") != null ){
		%><section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <div class="col-12">
                    <h2>留言板</h2>
                    <div class="table-responsive-sm table-middle">
                        <table class="table table-hover">
                            <tbody>
							<h4><font color="#FF00FF"><a href="view.jsp"class="btn btn-outline-info btn-lg ">觀看留言</a></font></h4><p>
							
                             <form name="form1" method="post" action="add.jsp">
						姓名：<input type="text" name="mname"><br>
						郵件：<input type="text" name="mmail"><br>
						產品名稱：<input type="text" name="pname"><br>
						內容：<textarea rows=5 name="bcontent"></textarea><br>
						<input type="submit" name="Submit" value="送出">
						<input type="Reset" name="Reset" value="重新填寫">
							</form>
                            </tbody>
                        </table>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%}else{
	out.println("<a href='loginregister.jsp' class='card'><h2><p align='center' valign='center' >未登入！！！將轉入登入畫面！！！</p></h2></a>");
	out.println("<meta http-equiv='refresh' content='3; url=../Finalpre/loginregister.jsp'>");
	}%>
    <!-- 人力資源/end -->
<%@include file ="ender.jsp"%>
</body>
</html>