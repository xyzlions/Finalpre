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
           String new_pid=request.getParameter("pid");		   
		   String new_ppic=new String(request.getParameter("ppic").getBytes("ISO-8859-1"),"UTF-8");
		   String new_pname=new String(request.getParameter("pname").getBytes("ISO-8859-1"),"UTF-8");
		   String new_pintroduce=new String(request.getParameter("pintroduce").getBytes("ISO-8859-1"),"UTF-8");
		   String new_ptype=new String(request.getParameter("ptype").getBytes("ISO-8859-1"),"UTF-8");
		   String new_psize=new String(request.getParameter("psize").getBytes("ISO-8859-1"),"UTF-8");
		   String new_pprice=request.getParameter("pprice");
		   String new_ppricesales=request.getParameter("ppricesales");
		   String new_pstock=request.getParameter("pstock");
		   sql="select * from product";
		   ResultSet rs=con.createStatement().executeQuery(sql);
		   
			
			sql="insert product (pid,pname,pintroduce,pprice,ppricesales,ppic,pstock,ptype,psize)";
		   	sql+="values('"+new_pid+"'";
			sql+=", '"+new_pname+"'";
			sql+=", '"+new_pintroduce+"'";
			sql+=", '"+new_pprice+"'";
			sql+=", '"+new_ppricesales+"'";
			sql+=", '"+new_ppic+"'";
			sql+=", '"+new_pstock+"'";
			sql+=", '"+new_ptype+"'";
			sql+=", '"+new_psize+"')";
		   con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令	
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果
          //直接顯示最新的資料
           response.sendRedirect("../Finalpre/allproductc.jsp");
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