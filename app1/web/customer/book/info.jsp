<%@ page import="cdu.wycy.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/customer/">
    <title>购书网站</title>
    <!-- 引入Bootstrap CSS文件 -->
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
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
    <h2 class="text-primary">图书详情</h2>
    <div class="row">
        <%
            Book book = (Book) request.getAttribute("book");
        %>
        <div class="col-md-4">
            <img src="<%=book.getCoverUrl() %>" alt="图书封面" class="img-fluid mb-3" style="max-height: 200px;">
        </div>
        <div class="col-md-8">
            <h3>书名：<%=book.getTitle() %></h3>
            <p class="text-muted">作者：<%=book.getAuthor() %><br>
                出版社：<%=book.getPress() %><br>
                出版日期：<%=book.getPublishDate() %><br>
                上架日期：<%=book.getMarketDate() %><br>
                折扣：<%=book.getSale() %><br>
                价格：<%=book.getPrice() %><br>
                <% if (book.getStock() > 0) { %>
                <a href="cart/in?id=<%=book.getId()%>" class="btn btn-primary">加入购物车</a>
                <% } %>
            </p>
            <!-- TODO-->
            <p><%=book.getInfo().trim().replaceAll("\r\n", "<br></br>") %></p>
        </div>
    </div>
</div>

<!-- 引入Bootstrap JS文件 -->
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
