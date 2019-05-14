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
</head><%String mid;%>
<body>
    <%@include file ="header.jsp"%>
    <!-- 購物車/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 產品清單/start -->
                <div class="col-12 mb-3">
                    <h2 class="mb-3">產品列表</h2>
                    <div class="table-responsive-sm table-middle">
                        <form action="updatepc.jsp" method="Post">
						<table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
									<th scope="col" class="product-thumbnail">編號</th>
                                    <th scope="col" class="product-thumbnail">圖片</th>
                                    <th scope="col" class="product-name">名稱/介紹/種類/尺寸</th>
                                    <th scope="col" class="product-price">特價/原價</th>
                                    <th scope="col" class="product-quantity">數量</th>
                                </tr>
                            </thead>
                            <tbody>
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
			sql="select * from product"; 
			ResultSet rs=con.createStatement().executeQuery(sql);
			 while(rs.next())
                {
				out.println("<tr>");
								out.println("<td class='product-thumbnail'><input type='radio'name='pid' value='"+rs.getString(1)+"'>"+rs.getString(1)+"</td>");
								out.println("<td class='product-thumbnail'>");
								out.println("<a href='product.html'>");
						out.println("<img src="+rs.getString(6)+" alt='"+rs.getString(2)+"' class='img-fluid'></a></td>");
							out.println("<td class='product-name'>名稱:&nbsp;"+rs.getString(2));
							out.println("<br>介紹:&nbsp;"+rs.getString(3));
							out.println("<br>種類:&nbsp;"+rs.getString(8));
							out.println("<br>尺寸:&nbsp;"+rs.getString(9)+"</td>");
								out.println("<td class='product-price'>特價NT$&nbsp;"+rs.getString(5)+"<br>");
							
                                out.println("原價NT$&nbsp;"+rs.getString(4)+"</td>");
							out.println("<td class='product-quantity'>");
                                        out.println(rs.getString(7)+"個");
                                    out.println("</td>");
                                out.println("</tr>");
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
                                
                            </tbody>
                        </table>
						<%out.println("<button type='submit' class='btn btn-primary send-btn'>修改</button>");%>
						<a href="member.jsp"><img src="back.png" ></a>
						</form>
                    </div>
                </div>
        
            </div>
        </div>
    </section>
    <!-- 購物車/end -->
<%@include file="ender.jsp"%>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
        })
    </script>
</body>
</html>