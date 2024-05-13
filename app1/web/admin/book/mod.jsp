<%@ page import="cdu.wycy.model.Book" %>
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
            padding-bottom: 20px;
        }
        h1 {
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
    <div class="row mb-3">
        <div class="col">
            <a href="../customer/book/list" class="btn btn-primary">前台首页</a>
        </div>
        <div class="col">
            <a href="book/list" class="btn btn-primary">图书列表</a>
        </div>
        <div class="col">
            <a href="book/add.jsp" class="btn btn-primary">添加图书</a>
        </div>
        <div class="col">
            <a href="book/add.jsp" class="btn btn-primary">添加图书</a>
        </div>
        <div class="col">
            <a href="customer/list" class="btn btn-primary">顾客列表</a>
        </div>
        <div class="col">
            <a href="adminUser/list" class="btn btn-primary">管理员列表</a>
        </div>
        <div class="col">
            <a href="adminUser/add.jsp" class="btn btn-primary">添加管理员</a>
        </div>
        <div class="col">
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
        </div>

    </div>

    <hr>
    <h2>图书管理 - 修改图书</h2>
    <%
        Book book = (Book) request.getAttribute("book");
    %>
    <form action="book/mod" method="post" enctype="multipart/form-data">
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="inputId" class="form-label">ID：</label>
                <input type="text" class="form-control" id="inputId" name="id" readonly value="<%=book.getId() %>">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="inputTitle" class="form-label">书名：</label>
                <input type="text" class="form-control" id="inputTitle" name="title" value="<%=book.getTitle() %>">
            </div>
            <div class="col-md-6">
                <label for="inputAuthor" class="form-label">作者：</label>
                <input type="text" class="form-control" id="inputAuthor" name="author" value="<%=book.getAuthor() %>">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="inputPress" class="form-label">出版社：</label>
                <input type="text" class="form-control" id="inputPress" name="press" value="<%=book.getPress() %>">
            </div>
            <div class="col-md-6">
                <label for="inputPrice" class="form-label">价格：</label>
                <input type="text" class="form-control" id="inputPrice" name="price" value="<%=book.getPrice() %>">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="inputSale" class="form-label">折扣：</label>
                <input type="text" class="form-control" id="inputSale" name="sale" value="<%=book.getSale() %>">
            </div>
            <div class="col-md-6">
                <label for="inputStock" class="form-label">库存：</label>
                <input type="text" class="form-control" id="inputStock" name="stock" value="<%=book.getStock() %>">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="inputPublishDate" class="form-label">出版日期：</label>
                <input type="text" class="form-control" id="inputPublishDate" name="publishDate" value="<%=book.getPublishDate() %>">
            </div>
            <div class="col-md-6">
                <label for="inputMarketDate" class="form-label">上架日期：</label>
                <input type="text" class="form-control" id="inputMarketDate" name="marketDate" value="<%=book.getMarketDate() %>">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="inputCoverUrl" class="form-label">封面URL：</label>
                <input type="text" class="form-control" id="inputCoverUrl" name="coverUrl" value="<%=book.getCoverUrl() %>">
            </div>
            <div class="col-md-6">
                <label for="inputNewCover" class="form-label">新封面：</label>
                <input type="file" class="form-control" id="inputNewCover" name="newCover">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="inputInfo" class="form-label">简介：</label>
                <textarea class="form-control" id="inputInfo" rows="10" name="info"><%=book.getInfo() %></textarea>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <button type="submit" class="btn btn-primary">提交</button>
            </div>
        </div>
    </form>
    <div class="row mb-3">
        <div class="col">
            <img src="<%=book.getCoverUrl() %>" alt="图书封面" class="img-fluid" width="200px">
        </div>
    </div>
</div>
</body>
</html>
