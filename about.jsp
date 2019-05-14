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
    <!-- 關於岡南/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <div class="col-12 col-md-6 d-flex align-items-center mb-3">
                    <img src="./images/factory.png" alt="kohnan factory" class="img-fluid w-100">
                </div>
                <div class="col-12 col-md-6">
                    <h2>企業簡介</h2>
                    <p>岡南塑膠發泡有限公司創立於西元1980年，前身為岡南木業有限公司，期間經營各種內外銷高品質木製家具及木製品加工製造項目。</p>
                    <p>後期因台灣家具木業外移至大陸地區生產製造，本公司基於社會責任並根留台灣力拼轉型，並於西元2003年轉型開發EVA材質之登山拐杖握把產品，並提供世界各大廠代工製造服務，因業務發展需要，公司於西元2014年變更為岡南塑膠發泡有限公司。</p>
                    <p>我們將竭盡心力繼續以優良的服務及專業的技術及高度的品質來提供您最滿意的產品。歡迎您來電或來信與我們聯絡!</p>
                </div>
                <div class="col-12">
                    <h2>專業能力</h2>
                    <p>岡南塑膠發泡有限公司，專門生產製作登山拐杖握把與人體工學專用握把，也生產EVA發泡握把/軟木握把、尼龍帶及相關配件，特殊設計及客製尺寸歡迎來信來電詢問。</p>
                </div>
            </div>
        </div>
    </section>
    <!-- 關於岡南/end -->
<%@include file="ender.jsp"%>
</body>
</html>