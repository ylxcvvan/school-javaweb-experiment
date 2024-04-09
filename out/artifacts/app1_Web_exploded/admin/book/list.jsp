<%@ page import="cdu.wycy.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/admin/">
    <title>图书管理</title>
    <!-- 引入Bootstrap样式表 -->
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0-alpha1/css/bootstrap.min.css" rel="stylesheet">
    <!-- 自定义样式 -->
    <style>
        body {
            padding-top: 20px;
        }
        h1 {
            color: #007bff;
        }
        .container {
            max-width: 1400px;
        }
        form {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #f8f9fa;
        }
        img {
            max-width: 64px;
        }
    </style>
</head>
<body>
<div class="container">
    
    <h1>购书网站后台管理平台</h1>
    <a href="../customer/book/list" class="btn btn-primary">前台首页</a>
    <a href="book/list" class="btn btn-primary">图书列表</a>
    <a href="book/add.jsp" class="btn btn-primary">添加图书</a>
    <hr>

    <h2>图书管理列表</h2>
    <form action="book/query" method="post" class="mb-3">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="inputTitle" class="col-form-label">书名：</label>
            </div>
            <div class="col-auto">
                <input type="text" id="inputTitle" name="title" class="form-control">
            </div>
            <div class="col-auto">
                <label for="inputAuthor" class="col-form-label">作者：</label>
            </div>
            <div class="col-auto">
                <input type="text" id="inputAuthor" name="author" class="form-control">
            </div>
            <div class="col-auto">
                <label for="inputPress" class="col-form-label">出版社：</label>
            </div>
            <div class="col-auto">
                <input type="text" id="inputPress" name="press" class="form-control">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">查询</button>
            </div>
        </div>
    </form>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>封面</th>
            <th>id</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>价格</th>
            <th>折扣</th>
            <th>库存</th>
            <th>出版日期</th>
            <th>上架日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <% List<Book> books = (List<Book>) request.getAttribute("books");
            for (Book book : books) { %>
        <tr>
            <td><img src="<%=book.getCoverUrl() %>" alt="封面" class="img"></td>
            <td><%=book.getId() %></td>
            <td><%=book.getTitle() %></td>
            <td style="width: 300px;"><%=book.getAuthor() %></td>
            <td><%=book.getPress() %></td>
            <td><%=book.getPrice() %></td>
            <td><%=book.getSale() %></td>
            <td><%=book.getStock() %></td>
            <td style="width: 110px;"><%=book.getPublishDate() %></td>
            <td style="width: 110px;"><%=book.getMarketDate() %></td>
            <td style="width: 120px;">
                <a href="book/modPre?id=<%=book.getId() %>" class="btn btn-primary">修改</a>
                <a href="book/del?id=<%=book.getId() %>" class="btn btn-danger">删除</a>
            </td>

        </tr>
        <% } %>
        </tbody>
    </table>

    <%-- 分页导航--%>
    <% int p = (int) request.getAttribute("p");
        int pCount = (int) request.getAttribute("pCount");
        if (p > 1) { %>
    <a href='book/list?p=<%= (p - 1) %>' class="btn btn-primary">上一页</a>
    <% }
        if (p < pCount) { %>
    <a href='book/list?p=<%= (p + 1) %>' class="btn btn-primary">下一页</a>
    <% } %>
</div>
</body>
</html>
