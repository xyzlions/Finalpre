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
    <!-- 結帳/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 結帳訊息/start -->
                <div class="col-12 mb-3">
                    <h2>結帳</h2>
                    <p>Thank you! 感謝你的訂購！</p>
                </div>
                <!-- 結帳訊息/end -->
                <!-- 帳單資訊/start -->
                <div class="col-12 col-md-6 mb-3">
                    <h2>帳單資訊</h2>
                    <form action="toorder.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="LastName">姓名
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="mname" class="form-control" id="LastName" required placeholder="必填，例如：葉大雄">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="tel">連絡電話
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="mtel" class="form-control" id="tel" required placeholder="必填，例如：0912-345-678">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="EMail">電子信箱
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="email" name="mmail" class="form-control" id="EMail" required placeholder="必填，電子信箱">
                            </div>
                        </div>  
                </div>
                <!-- 帳單資訊/end -->
                <!-- 您的訂單/start -->
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
			ResultSet rs=con.createStatement().executeQuery(sql);
				sql="select * from cart where mid='"+session.getAttribute("mid")+"'";
			rs=con.createStatement().executeQuery(sql);
			int total_pprice=0;
			String pprice="";
			String pnum="";
			String pname="";
			String pstock="";
			out.println("<div class='col-12 col-md-6'>");
                    out.println("<h2>您的訂單</h2>");
                    out.println("<div class='table-responsive-sm table-middle'>");
                        out.println("<table class='table table-bordered table-striped'>");
                            out.println("<tbody>");
							out.println("<tr>");
                                    out.println("<td>商品</td>");
                                    out.println("<td>總計</td>");
                                out.println("</tr>");
			while(rs.next())
			{	
				pprice=rs.getString(3);
				pnum=rs.getString(5);
				pname=rs.getString(2);
				int new_pprice=Integer.parseInt(pprice);
			int new_ordpnum=Integer.parseInt(pnum);
			
									
                                out.println("<tr>");
                                    out.println("<td>"+pname+"</td>");
                                    out.println("<td>NT$&nbsp;"+(new_pprice*new_ordpnum)+"</td>");
                                out.println("</tr>");
                                out.println("<tr class='bg-info'>");
                                    total_pprice+=(new_pprice*new_ordpnum);
				con.createStatement().execute(sql);
				
				
			}
			
			
			out.println("<tr>");
            out.println("<td>交貨方式</td>");
            out.println("<td>");
            out.println("<div class='form-check'>");
            out.println("<input id='Expenses' name='trans' type='radio' class='form-check-input' value='outdoor'>");
            out.println("<label class='form-check-label'>外地面交</label>");
            out.println("</div>");
            out.println("<div class='form-check checkbox'>");
            out.println("<input id='PostOffice' name='trans' type='radio' class='form-check-input'value='store' checked>");
            out.println("<label class='form-check-label'>來店取貨</label>");
            out.println("</div>");
            out.println("</td>");
            out.println("</tr>");
			out.println("<tr>");
            out.println("<td>付款</td>");
            out.println("<td>");
            out.println("<div class='form-check'>");
            out.println("<input id='Expenses' name='topay' type='radio' class='form-check-input' value='card'>");
            out.println("<label class='form-check-label'>信用卡</label>");
            out.println("</div>");
            out.println("<div class='form-check checkbox'>");
            out.println("<input id='PostOffice' name='topay' type='radio' class='form-check-input' value='cash' checked>");
             out.println("<label class='form-check-label'>現金</label>");
            out.println("</div>");
            out.println("</td>");
            out.println("</tr>");
			out.println("<td>總計</td>");
                                    out.println("<td>NT$&nbsp;"+total_pprice+"</td>");
                                out.println("</tr>");
                            out.println("</tbody>");
                            out.println("<tfoot>");
                                out.println("<tr>");
                                    out.println("<td colspan='2'>");
                                        out.println("<button type='submit' class='btn btn-outline-info btn-lg float-right'>下單購買</button>");
                                    out.println("</td>");
                                out.println("</tr>");
                            out.println("</tfoot>");
                        out.println("</table>");
                    out.println("</div>");
                out.println("</div>");
			
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
%>			</form>

            </div> 
        </div>
    </section>
    <!-- 結帳/end -->
<%@include file="ender.jsp"%>
</body>
</html>