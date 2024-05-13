<%@ page import="cdu.wycy.model.User" %>
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
        h1, h2 {
            color: #007bff;
        }
        .container {
            max-width: 800px;
        }
        form {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>购书网站后台管理平台</h1>
    <a href="../customer/book/list" class="btn btn-primary">前台首页</a>
    <a href="book/list" class="btn btn-primary">图书列表</a>
    <a href="book/add.jsp" class="btn btn-primary">添加图书</a>
    <a href="customer/list" class="btn btn-primary">顾客列表</a>
    <a href="adminUser/list" class="btn btn-primary">管理员列表</a>
    <a href="adminUser/add.jsp" class="btn btn-primary">添加管理员</a>
    <%
        User admin = (User) session.getAttribute("admin");
        if (admin == null) {
            //管理员未登录
            response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        } else {
    %>
    <%-- 管理员已登录 --%>
    <a href="reset?id=<%=admin.getId() %>">重置密码</a>
    <a href="logout">退出</a>
    <%
        }
    %>
    <hr>
    <h2>图书管理 - 添加图书</h2>
    <form action="book/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="inputTitle" class="form-label">书名：</label>
            <input type="text" id="inputTitle" name="title" class="form-control">
        </div>
        <div class="mb-3">
            <label for="inputAuthor" class="form-label">作者：</label>
            <input type="text" id="inputAuthor" name="author" class="form-control">
        </div>
        <div class="mb-3">
            <label for="inputPress" class="form-label">出版社：</label>
            <input type="text" id="inputPress" name="press" class="form-control">
        </div>
        <div class="mb-3">
            <label for="inputPrice" class="form-label">价格：</label>
            <input type="text" id="inputPrice" name="price" class="form-control" value="0.0">
        </div>
        <div class="mb-3">
            <label for="inputSale" class="form-label">折扣：</label>
            <input type="text" id="inputSale" name="sale" class="form-control" value="100">
        </div>
        <div class="mb-3">
            <label for="inputStock" class="form-label">库存：</label>
            <input type="text" id="inputStock" name="stock" class="form-control" value="0">
        </div>
        <div class="mb-3">
            <label for="inputPublishDate" class="form-label">出版日期：</label>
            <input type="text" id="inputPublishDate" name="publishDate" class="form-control" value="2023-01-01">
        </div>
        <div class="mb-3">
            <label for="inputCoverUrl" class="form-label">封面：</label>
            <input type="file" id="inputCoverUrl" name="coverUrl" class="form-control">
        </div>
        <div class="mb-3">
            <label for="inputInfo" class="form-label">简介：</label>
            <textarea id="inputInfo" name="info" rows="5" class="form-control"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
        <button type="reset" class="btn btn-secondary">重置</button>
    </form>
</div>
</body>
</html>
