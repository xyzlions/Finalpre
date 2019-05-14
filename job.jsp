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
    <!-- 人力資源/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <div class="col-12">
                    <h2>人力資源</h2>
                    <div class="table-responsive-sm table-middle">
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">職務名稱</th>
                                    <th scope="col">工作地區</th>
                                    <th scope="col">工作內容</th>
                                    <th scope="col">應徵</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">PCB產品售後服務 工程師</th>
                                    <td>新北市林口區</td>
                                    <td>
                                        <ul>
                                            <li>1年以上工作經歷，專科、大學學歷</li>
                                            <li>客戶端機台安裝及維修</li>
                                            <li>機構組裝及電控程式修改/配線</li>
                                            <li>可接受出差</li>
                                        </ul>
                                    </td>
                                    <td>
                                        <a href="https://www.104.com.tw" class="btn btn-secondary text-white">我要應徵</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">自動控制 工程師</th>
                                    <td>台中市豐原區</td>
                                    <td>
                                        <ul>
                                            <li>2年以上工作經歷，專科、大學、碩士學歷</li>
                                            <li>機構開發設計</li>
                                        </ul>
                                    </td>
                                    <td>
                                        <a href="https://www.104.com.tw" class="btn btn-secondary text-white">我要應徵</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">PLC 工程師</th>
                                    <td>台中市豐原區</td>
                                    <td>
                                        <ul>
                                            <li>2年以上工作經歷，專科、大學、碩士學歷</li>
                                            <li>PLC 程式撰寫</li>
                                        </ul>
                                    </td>
                                    <td>
                                        <a href="https://www.104.com.tw" class="btn btn-secondary text-white">我要應徵</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 人力資源/end -->
    <%@include file="ender.jsp"%>
</body>
</html>