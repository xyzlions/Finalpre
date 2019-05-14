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
<body>
<a href="board.jsp"class="btn btn-outline-info btn-lg " >寫寫留言</a><p>
<%
String output="";
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use final";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="select * from guestbook"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           out.println("共"+total_content+"筆留言<p>");
           
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
		   if (page_num==0) //無留言時將頁數指標訂為1
		       page_num=1;
           out.println("請選擇頁數");
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
		  
           for(int i=1;i<=page_num;i++) //使用get傳輸方式,建立1,2,...頁超連結
              {
			   output+=("<a href='view.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
           }
		 
		   

           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "1";  //無留言時將頁數指標訂為1        
           Integer current_page=Integer.valueOf(page_string);//將page_string轉成整數
		    
			if(current_page>1)
		   {
			   out.print("<a href='view.jsp?page=1'>第一頁</a>&nbsp;");
			   out.print("<a href='view.jsp?page="+(current_page-1)+"'>上一頁</a>&nbsp;");
		   }
		   
		     if(current_page<page_num)
		   {
			   output+="<a href='view.jsp?page="+(current_page+1)+"'>下一頁</a>&nbsp;";
			   output+="<a href='view.jsp?page="+(page_num)+"'>最後一頁</a>&nbsp;";
		   }
		   output+=("<form>直達第<input type='text' name='page'>頁<input type='submit' value='前往'></form>");
           output+=("<p>");
		   //----------------------------------------------
		   if(current_page<1||current_page>total_content)
		   {
			   out.print("<script>alert('請輸入存在的頁數')</script>");
			   current_page=1;
			   out.print("<script>window.open('view.jsp','_self')</script>");
		   }
		   out.print(output);
           //Integer current_page=Integer.valueOf(request.getParameter("page"));
	       //計算開始記錄位置  
		   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM guestbook ORDER BY bno DESC LIMIT ";//LIMIT是限制傳回筆數
           sql+=start_record+",5";
           //上述語法解讀如下:
           // current_page... select * from guestbook order by bno desc limit
           //      current_page=1: select * from guestbook order by bno desc limit 0, 5 //從第0筆顯示5筆
           //      current_page=2: select * from guestbook order by bno desc limit 5, 5 //從第5筆顯示5筆
           //      current_page=3: select * from guestbook order by bno desc limit 10, 5//從第10筆顯示5筆

           rs=con.createStatement().executeQuery(sql);
		   
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {
				 //out.println("第:"+rs.getString("bno")+"則留言"+"<br>");
				 out.println("第:"+rs.getString("bno")+"則留言"+"<br>");
				 //out.println("產品名稱:"+rs.getString("pname")+"<br>");
				 out.println("產品名稱:"+rs.getString("pname")+"<br>");
                 //out.println("訪客姓名:"+rs.getString(2)+"<br>");
				 out.println("訪客姓名:"+rs.getString("mname")+"<br>");
                 //out.println("E-mail:"+rs.getString(3)+"<br>");
				 out.println("E-mail:"+rs.getString("mmail")+"<br>");
                 //out.println("留言內容:"+rs.getString(5)+"<br>");
				 out.println("留言內容:"+rs.getString("bcontent")+"<br>");
                 //out.println("留言時間:"+rs.getString(6)+"<br>");
				 out.println("留言時間:"+rs.getString("bdatetime")+"\t");
				 out.println("IP:"+rs.getString("IP")+"<br><hr>");
          }

				
			//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤");
}
%>
<%@include file ="ender.jsp"%>
</body>
</html>
