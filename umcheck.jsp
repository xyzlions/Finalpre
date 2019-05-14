<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>修改商品</title>
</head>
<body>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
		
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use final";
           con.createStatement().execute(sql);
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
           String new_mid=request.getParameter("mid");
		   String new_mname=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");
		   String new_maddress=new String(request.getParameter("maddress").getBytes("ISO-8859-1"),"UTF-8");
		   String new_mpwd=request.getParameter("mpwd");
		   String new_mmail=request.getParameter("mmail");
		   String new_mtel=request.getParameter("mtel");
		   sql="select * from member where mid='"+session.getAttribute("mid")+"'";
		   ResultSet rs=con.createStatement().executeQuery(sql);
		   
			while(rs.next())
                {
			sql="update member set mid='"+new_mid+"'";
		   	sql+=",mname='"+new_mname+"'";
			sql+=",mmail='"+new_mmail+"'";
			sql+=",mtel='"+new_mtel+"'";
			sql+=",maddress='"+new_maddress+"'";
			sql+=",mpwd='"+new_mpwd+"'";
		   sql+="where mid='"+session.getAttribute("mid")+"';";
		   con.createStatement().execute(sql);
				}
				out.println("修改成功");
//Step 4: 執行 SQL 指令	
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果
          //直接顯示最新的資料
           response.sendRedirect("../Finalpre/member.jsp");
			}
			}
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>