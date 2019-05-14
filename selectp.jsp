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
                <!-- 商品區/start -->
                <div class="col-12 col-md-9">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <img src="./images/slider_2.jpg" alt="Shop Banner" class="img-fluid">
                        </div>
                        <!-- 商品/start -->
                        <%
						String new_introduce=new String(request.getParameter("introduce").getBytes("ISO-8859-1"),"UTF-8");
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
			sql="select * from product where pname like '%"+new_introduce+"%'"; 
			con.createStatement().execute(sql);
			ResultSet rs=con.createStatement().executeQuery(sql);
			 while(rs.next())
                {
				out.println("<div class='col-12 col-sm-6 col-md-3'>");
					out.println("<div href='#' class='card mb-3'>");
						out.println("<img class='card-img-top' src="+rs.getString(6)+" alt='"+rs.getString(2)+"'>");
						out.println("<div class='card-body'>");
							out.println("<h4 class='card-title'>"+rs.getString(2)+"</h4>");
							out.println("<p class='card-text'>"+rs.getString(3)+"</p>");
							out.println("<h5 class='card-text text-danger'>");
								out.println("<small class='text-secondary mr-2'>");
									out.println("<del>NT$&nbsp;"+rs.getString(4)+"</del>");
								out.println("</small>");
								out.println("NT$&nbsp;"+rs.getString(5));
							out.println("</h5>");
							out.println("<p class='card-text'>庫存數量:"+rs.getString(7)+"</p>");
							out.println("<form action='product.jsp' method='Post'><button type='submit' class='btn btn-outline-secondary btn-block' name='pid' value='"+rs.getString(1)+"'>查看商品</button></form>");
						out.println("</div>");
					out.println("</div>");
				out.println("</div>");
				con.createStatement().executeQuery(sql);
				}
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
			%>
                        <!-- 商品/end -->
                    </div>
                </div>
                <!-- 商品區/end -->
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