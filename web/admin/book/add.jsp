<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/admin/">
    <title>图书管理</title>
</head>
<body>
<div>
    <h1>购书网站后台管理平台</h1>
    <a href="../customer/book/list">前台首页</a>
    <a href="book/list">图书列表</a>
    <a href="book/add.jsp">添加图书</a>
</div>
<hr>
<h2>图书管理 - 添加图书</h2>
<form action="book/add" method="post" enctype="multipart/form-data">
    书名:<input type="text" name="title"><br>
    作者：<input type="text" name="author"><br>
    出版社:<input type="text" name="press"><br>
    价格:<input type="text" name="price" value="0.0"><br>
    折扣:<input type="text" name="sale" value="100"><br>
    库存:<input type="text" name="stock" value="0"><br>
    出版日期:<input type="text" name="publishDate" value="2023-01-01"><br>
    封面:<input type="file" name="coverUrl"><br>
    简介:<textarea rows="5" name="info"></textarea><br>
    <button type="submit">提交</button>
    <button type="reset">重置</button>
</form>
</body>
</html>
