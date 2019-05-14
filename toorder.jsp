<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>加入會員</title>
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
           

		   String new_mmail=request.getParameter("mmail");
		   String new_mname=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");
		   String new_mtel=request.getParameter("mtel");
		   String new_topay=request.getParameter("topay");
		   String new_trans=request.getParameter("trans");
		   ResultSet rs=con.createStatement().executeQuery(sql);
		 sql="select * from cart where mid='"+session.getAttribute("mid")+"'";
		rs=con.createStatement().executeQuery(sql);
		 String new_pname="";
		 String pprice="";
			String pnum="";
			String pname="";
			String pstock="";
			int total_pprice=0;
		 while(rs.next())
		 {
			 pprice=rs.getString(3);
				pnum=rs.getString(5);
				pname=rs.getString(2);
				int new_pprice=Integer.parseInt(pprice);
			int new_ordpnum=Integer.parseInt(pnum);
			 new_pname+=rs.getString(2)+",";
			 total_pprice+=(new_pprice*new_ordpnum);
			 
			 sql="select * from product where pname='"+pname+"'";
				
				ResultSet rs1=con.createStatement().executeQuery(sql);
				while(rs1.next())
				{
					 new_ordpnum=Integer.parseInt(pnum);
					int new_pstock=Integer.parseInt(rs1.getString(7));
				sql="update product set pstock='"+(new_pstock-new_ordpnum)+"' where pname='"+pname+"';";
				con.createStatement().execute(sql);
				}
			
		 }
		 sql="select ono from orderlist ";
		   rs=con.createStatement().executeQuery(sql);
		   rs.last();
		   int mno_num=rs.getRow();
		   
		   
//Step 4: 執行 SQL 指令	
           sql="insert orderlist (ono, mid, pname,mname,mmail,mtel,topay,trans,totalprice) ";
           sql+="value ('" + (mno_num+1) + "', ";
           sql+="'"+session.getAttribute("mid")+"', ";
			sql+="'"+new_pname+"', "; 
			sql+="'"+new_mname+"', "; 
			sql+="'"+new_mmail+"', "; 
			sql+="'"+new_mtel+"', ";    
			sql+="'"+new_topay+"', ";  
			sql+="'"+new_trans+"', ";  
           sql+="'"+total_pprice+"')";      
           con.createStatement().execute(sql);
		   
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果
          //直接顯示最新的資料
           
	out.println("<p align='center'><font color='black' size='10'><br><br><b>訂單成功，將為您跳轉至會員專區<br><meta http-equiv='refresh' content='3; url=../Finalpre/deleteallcart.jsp'></font></p>");

		
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