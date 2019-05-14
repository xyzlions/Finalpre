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
<body>
    <%String mid;%>
<%@include file ="header.jsp"%>
	<%

		try{
			Class.forName("com.mysql.jdbc.Driver");
			try{
				String url="jdbc:mysql://localhost/";
				
				Connection con=DriverManager.getConnection(url,"root","1234");
				
				if(session.getAttribute("mid") != null ){
				con.createStatement().execute("use final");
    				String sql = "SELECT * FROM member WHERE mid='" +session.getAttribute("mid")+"';"; 
				Statement stmt=con.createStatement();
				ResultSet rs =con.createStatement().executeQuery(sql);
				String id=" ";
				String pwd=" ";
				String name=" ";
				String tel=" ";
				String address=" ";
				String email=" ";
				if(rs.next()){
				id=rs.getString(2);
				pwd=rs.getString(4);
				name=rs.getString(5);
				tel=rs.getString(6);
				address=rs.getString(7);
				email=rs.getString(3);
				
				}
%>
<p align="center">
<div class="container pt-5 pb-5">
            
<div class="col-12 col-md-6 mb-3">
<form name="update" action="umcheck.jsp" method="POST" onSubmit="return Check(this)"><br><br>
<font color="black" size="6"><b>
						<div class="row">
						<div class="form-group">
                            <label for="mid">帳號
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mid" type="text" class="form-control" id="Email" value="<%=id%>"required>
                        </div>
						<div class="form-group">
                            <label for="Password">密碼
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mpwd" type="password" class="form-control" id="Password"value="<%=pwd%>" required>
                        </div>
						<div class="form-group">
                            <label for="Email">電子信箱
                                <span class="text-danger">*</span>
                            </label>
                            <input name="mmail" type="email" class="form-control" id="RegisteredEmail" placeholder="必填，電子信箱" value="<%=email%>" required>
                        </div>
						</div>
						<div class="row">
						<div class="form-group">
                            <label for="mname">姓名</label>
                            <input name="mname" type="text" class="form-control" id="mname" placeholder="非必填，姓名" value="<%=name%>" >
                        </div>
						<div class="form-group">
                            <label for="tel">電話</label>
                            <input name="mtel" type="text" class="form-control" id="tel" placeholder="非必填，電話" value="<%=tel%>" >
                        </div>
						<div class="form-group">
                            <label for="">住址</label>
                            <input name="maddress" type="text" class="form-control" id="address" placeholder="非必填，住址" value="<%=address%>" >
                        </div>
						</div>

					<button type="submit" class="btn btn-primary send-btn">確定送出</button>
					<a href="member.jsp"><img src="back.png" ></a>
</form>
</font>
</div>
</div>
</p>
<%
}else{
%>
<font color="black" size="10">
<br><br><b>您還未登入會員 三秒後為您轉至會員登入<br>
<meta http-equiv="refresh" content="3; url=../Finalpre/loginregister.jsp">
</font>


<%
}
			con.close();
	}
	catch(SQLException sExec){
		out.println("SQL錯誤"+sExec.toString());
	}
	}
	catch(ClassNotFoundException err){
		out.println("class錯誤"+err.toString());
	}	

%>
<%@include file ="ender.jsp"%>
</body>