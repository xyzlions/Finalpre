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
    <!-- 產品商城/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 產品說明/start -->
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
			String new_pid=request.getParameter("pid");
			sql="select * from product where pid='"+new_pid+"';"; 
			ResultSet rs=con.createStatement().executeQuery(sql);
			 while(rs.next())
			 {
				out.println("<div class='col-12 col-md-9'>");
                    out.println("<div class='row'>");
                       
                        out.println("<div class='col-12 col-md-6'>");
                            out.println("<img src='"+rs.getString(6)+"' alt='"+rs.getString(2)+"' class='img-fluid w-100'></div>");

                        
                        out.println("<div class='col-12 col-md-6'>");
                            out.println("<h4 class='mb-3 title-color'>"+rs.getString(2)+"</h4>");
                            out.println("<h5 class='text-danger'>");
                                out.println("<small class='text-secondary mr-2'>");
                                    out.println("<del>NT$&nbsp;"+rs.getString(4)+"</del>");
                                out.println("</small>");
                                out.println("NT$&nbsp;"+rs.getString(5));
                            out.println("</h5>");
                            out.println("<p class='mt-4'>"+rs.getString(3));
                            out.println("<div class='d-block mb-3'>");
                                out.println("<p class='mb-0 d-inline-block'>數量</p>");
                                out.println("<form action='addtocart.jsp' class='d-inline-block'>");
                                    out.println("<input type='number' class='form-control w-25' name='num' id='quantity' value='1'>");
                                out.println("</div>");
                            out.println("<p class='card-text'>庫存數量:"+rs.getString(7)+"</p>");
                            out.println("<div class='mb-3'>");
                                out.println("<button type='submit' class='btn btn-primary text-white mr-1' name='addtocar' value='"+rs.getString(1)+"'>加入購物車</button></form>");
                            out.println("</div>");
                            out.println("<p class='d-block text-secondary'>產品分類：<span>"+rs.getString(8)+"</span></p>");
                        out.println("</div>");
                        
                        out.println("<div class='col-12 mt-5 mb-5'>");
                            out.println("<ul class='nav nav-tabs' id='ProductTab' role='tablist'>");
                                out.println("<li class='nav-item'>");
                                    out.println("<a class='nav-link active' id='description-tab' data-toggle='tab' href='#description' role='tab' aria-controls='description' aria-selected='true'>描述</a>");
                                out.println("</li>");
                                out.println("<li class='nav-item'>");
                                    out.println("<a class='nav-link' id='specification-tab' data-toggle='tab' href='#specification' role='tab' aria-controls='specification' aria-selected='false'>產品規格</a>");
                                out.println("</li>");
                            out.println("</ul>");
                            out.println("<div class='tab-content' id='ProductTabContent'>");
                                out.println("<div class='tab-pane fade show active' id='description' role='tabpanel' aria-labelledby='description-tab'>");
                                    out.println("<p class='p-2'>"+rs.getString(3)+"</p>");
                                out.println("</div>");
                                out.println("<div class='tab-pane fade' id='specification' role='tabpanel' aria-labelledby='specification-tab'>");
                                    out.println("<p class='p-2'>"+rs.getString(9)+"</p>");
                                out.println("</div>");
                            out.println("</div>");
                        out.println("</div>");
                        
                    out.println("</div>");
                out.println("</div>");
			 }con.close();
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
				%>
                <!-- 產品說明/end -->
               <!-- 側邊欄/start -->
                <div class="col-12 col-md-3">
                    <div class="row">
                        <!-- 搜尋/start -->
                        <div class="col-12 mb-5">
                            <form action="selectp.jsp">
                                <input type="text" name="introduce" class="form-control" id="PorductSearch" placeholder="搜尋名稱">
                            </form>
                        </div>
                        <!-- 搜尋/end -->
                        
                        <!-- 產品分類/start -->
                        <div class="col-12 mb-5">
                            <h4 class="title-color">產品分類</h4>
                            <ul class="sidebar-product-category">
                                <li>
                                    <a href="holder.jsp">登山拐杖握把</a>
                                </li>
                                <li>
                                    <a href="holderpund.jsp">發泡/套管</a>
                                </li>

                            </ul>
                        </div>
                        <!-- 產品分類/end -->
                    </div>
                </div>
                <!-- 側邊欄/end -->
            </div>
        </div>
    </section>
    <!-- 產品商城/end -->
<%@include file ="ender.jsp"%>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
        })
    </script>
</body>
</html>