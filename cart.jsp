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
    <!-- 購物車/start --><%if( session.getAttribute("mid") != null ){%>
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 產品清單/start -->
                <div class="col-12 mb-3">
                    <h2 class="mb-3">購物車</h2>
                    <div class="table-responsive-sm table-middle">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="product-remove">&nbsp;</th>
                                    <th scope="col" class="product-thumbnail">圖片</th>
                                    <th scope="col" class="product-name">名稱/介紹/種類/尺寸</th>
                                    <th scope="col" class="product-price">價格</th>
                                    <th scope="col" class="product-quantity">數量</th>
                                </tr>
                            </thead>
                            <tbody>
                                
			
			<%String pid="";
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
			sql="select * from cart where mid='"+session.getAttribute("mid")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);
			
			 while(rs.next())
                {
				out.println("<tr>");
								out.println("<td class='product-remove'><form method='post' action='deletecart.jsp'><button type='submit' class='btn btn-outline-secondary btn-block' name='pid' value='"+rs.getString(1)+"'>X</button></form></td>");
								out.println("<td class='product-thumbnail'>");
								out.println("<a href='product.jsp'>");
						out.println("<img src="+rs.getString(4)+" alt='"+rs.getString(2)+"' class='img-fluid'></a></td>");
							out.println("<td class='product-name'>名稱:&nbsp;"+rs.getString(2));
							out.println("</td>");
								out.println("<td class='product-price'>");
                                out.println("價格NT$&nbsp;"+rs.getString(3)+"</td>");
							out.println("<td class='product-quantity'>");
                                        out.println("<form method='post' action='changeordnum.jsp'><input type='number' name='ordpnum' value='"+rs.getString(5)+"'>個");
										out.println("<button type='submit' class='btn btn-outline-secondary btn-block' name='pid' value='"+rs.getString(1)+"'>修改數量</button></form>");
                                    out.println("</td>");
                                out.println("</tr>");
								pid=rs.getString(1);
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
						<form method="post" action="checkprice.jsp"><button type="submit" class="btn btn-outline-secondary btn-block" name="pprice" value="<%=pid%>">計算總額</button></form>
                    <a href="member.jsp"><img src="back.png" ></a>
					</div>
                </div>
                <!-- 產品清單/end -->
                
            </div>
        </div>
    </section>
	<%}else{
	out.println("<a href='loginregister.jsp' class='card'><h2><p align='center' valign='center' >未登入！！！將轉入登入畫面！！！</p></h2></a>");
	out.println("<meta http-equiv='refresh' content='3; url=../Finalpre/loginregister.jsp'>");
	}%>
    <!-- 購物車/end -->
<%@include file ="ender.jsp"%>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
        })
    </script>
</body>
</html>