<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>直接加入購物車</title>
</head>
<body>
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
			String new_pid=request.getParameter("addtocar");
			String new_pnum=request.getParameter("num");
			sql="select * from product where pid ='"+new_pid+"';"; 
			ResultSet rs=con.createStatement().executeQuery(sql);
			 String new_ppic="";
			 String new_pprice="";
			 String new_pname="";
			 while(rs.next())
                {
				new_pname=rs.getString(2);
				if(rs.getString(5)!=null)
				{
				new_pprice=rs.getString(5);
				}else{new_pprice=rs.getString(4);}
				new_ppic=rs.getString(6);
				}
			sql="insert  cart (pid,pname,pprice,ppic,pnum,mid)";
			sql+="value('"+new_pid+"',";
			sql+="'"+new_pname+"',";
			sql+="'"+new_pprice+"',";
			sql+="'"+new_ppic+"',";
			sql+="'"+new_pnum+"',";
			sql+="'"+session.getAttribute("mid")+"')";
			con.createStatement().execute(sql);
			con.close();
			response.sendRedirect("../Finalpre/cart.jsp");
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
</body>
</html>