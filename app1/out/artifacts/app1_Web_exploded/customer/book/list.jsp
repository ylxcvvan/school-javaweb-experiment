<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/4/1
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cdu.wycy.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/customer/">
    <title>购书网站</title>
    <!-- 引入Bootstrap CSS文件 -->
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card-text{
            margin-bottom: 5px;
            text-overflow: ellipsis;
            width: 150px;
            overflow: hidden;
            white-space: nowrap;
            -webkit-line-clamp: 2;
        }
        .container {
            margin-top: 20px;
        }

        .book-item {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .card{
            height: 480px;
        }
        .book-item img {
            width: 120px;
            margin-bottom: 10px;
        }

        .book-item p {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .book-item a {
            color: #007bff;
            text-decoration: none;
        }

        .book-item a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <h1><a href="book/list" class="text-decoration-none text-dark">购书网站</a></h1>
        </div>
        <div class="col-auto">
            <a href="../admin/book/list" class="btn btn-primary me-2">后台管理</a>
            <a href="book/list" class="btn btn-primary me-2">首页</a>
            <a href="#" class="btn btn-primary me-2">登录</a>
            <a href="#" class="btn btn-primary">注册</a>
        </div>
    </div>
    <hr>
    <div class="row">
        <% List<Book> books = (List<Book>) request.getAttribute("books");
            for (Book book : books) {
        %>
        <div class="col-md-2">
            <div class="card ">
                <a href="book/info?id=<%=book.getId() %>" class="text-decoration-none text-dark">
                    <img src="<%=book.getCoverUrl() %>" alt="<%=book.getTitle() %>" class="card-img-top" >
                </a>

                <div class="card-body">
                    <h5 class="card-title"><a href="book/info?id=<%=book.getId() %>" class="text-decoration-none text-dark"><%=book.getTitle() %></a></h5>
                    <p class="card-text">作者：<%=book.getAuthor() %></p>
                    <p class="card-text">出版社：<%=book.getPress() %></p>
                    <p class="card-text">价格：￥<%=book.getPrice() %></p>
                    <p class="card-text">库存：<%=book.getStock() %>本</p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
