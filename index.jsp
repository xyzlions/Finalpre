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
    <!-- 廣告/start -->
    <section class="container-fluid">
        <div class="row">
            <div id="carouselBanner" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselBanner" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselBanner" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="./images/slider_1.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block text-dark">
                            <h3>EVA發泡板</h3>
                            <p>依國際標準Pantone標準色卡之色號來製作</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="./images/slider_2.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>廠房設備</h3>
                            <p>高專業的製造能力</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselBanner" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselBanner" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>
    <!-- 廣告/end -->
	<marquee direction="up" scrollamount="2" onMouseOver="this.stop()" onMouseOut="this.start()"><!--隨機跑馬燈廣告-->
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
    try {
		String url="jdbc:mysql://localhost/";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
           { String sql="use final";
		   ResultSet rs;
           con.createStatement().execute(sql);
		   sql="select*from ad";
		   rs=con.createStatement().executeQuery(sql);
		   rs.last();
		   int n=rs.getRow();
		   Random ran=new Random();
		   int current_adid=ran.nextInt(n)+1;
		   sql="select * from ad where adid="+current_adid;
           rs=con.createStatement().executeQuery(sql);
		   while(rs.next())
                {
                 out.println("<p align='center'>"+rs.getString(2)+"</p>");
				}
		   }
		    con.close();
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
	</marquee>
	<!--隨機跑馬燈廣告/end-->
    <!-- 產品分類/start -->
    <section class="container mt-5">
        <div class="row">
            <div class="col-12">
                <h2>產品分類</h2>
                <p>登山拐杖握把與人體工學專用握把，也生產EVA發泡握把/軟木握把、尼龍帶及相關配件，特殊設計及客製尺寸歡迎來信來電詢問。</p>
            </div>
            <div class="col-12">
                <div class="card-deck mt-2 product-categories">
                    <a href="holder.jsp" class="card">
                        <img class="card-img-top" src="./images/services_1.jpg" alt="登山拐杖握把">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center">登山拐杖握把</h4>
                        </div>
                    </a>
                    
                    <a href="holderpund.jsp" class="card">
                        <img class="card-img-top" src="./images/services_3.jpg" alt="發泡套管">
                        <div class="card-body bg-dark">
                            <h4 class="card-title text-white text-center">發泡套管</h4>
                        </div>
                    </a>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- 產品分類/end -->
    <!-- 熱門產品/start -->
    <section class="container mt-5">
        <div class="row">
            <div class="col-12 mb-2">
                <h2>熱門產品</h2>
            </div>
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
            
        </div>
    </section>
    <!-- 熱門產品/end -->
    <!-- 關於岡南/start -->
    <section class="container mt-5">
        <div class="row">
            <div class="col-12">
                <h2>關於岡南</h2>
            </div>
            <div class="col-12">
                <p>本公司創立於西元1980年，前身為岡南木業有限公司，期間經營各種內外銷高品質木製家具及木製品加工製造項目。後期因台灣家具木業外移至大陸地區生產製造，本公司基於社會責任並根留台灣力拼轉型，並於西元2003年轉型開發EVA材質之登山拐杖握把產品，並提供世界各大廠代工製造服務，因業務發展需要，公司於西元2014年變更為岡南塑膠發泡有限公司。我們將竭盡心力繼續以優良的服務及專業的技術及高度的品質來提供您最滿意的產品。歡迎您來電或來信與我們聯絡</p>
            </div>
        </div>
    </section>
    <!-- 關於岡南/end -->
    <!-- google map/start -->
    <section class="container-fluid mt-5">
        <div class="row">
            <div class="embed-responsive map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.005038298767!2d121.56232116500627!3d25.03390308397241!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abb6da9c9e1f%3A0x1206bcf082fd10a6!2zMTEw5Y-w5YyX5biC5L-h576p5Y2A5L-h576p6Lev5LqU5q61N-iZn-WPsOWMlzEwMQ!5e0!3m2!1szh-TW!2stw!4v1516115087364"></iframe>
            </div>
        </div>
    </section>
    <!-- google map/end -->
<%@include file ="ender.jsp"%>
</body>
</html>