<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/4/1
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cdu.wycy.model.Book" %>
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
<h2>图书管理 - 修改图书</h2>
<%
    Book book = (Book) request.getAttribute("book");
%>
<form action="book/mod" method="post" enctype="multipart/form-data">
    id:<input type="text" name="id" readonly value="<%=book.getId() %>"><br>
    书名:<input type="text" name="title" value="<%=book.getTitle() %>"><br>
    作者:<input type="text" name="author" value="<%=book.getAuthor() %>"><br>
    出版社:<input type="text" name="press" value="<%=book.getPress() %>"><br>
    价格:<input type="text" name="price" value="<%=book.getPrice() %>"><br>
    折扣:<input type="text" name="sale" value="<%=book.getSale() %>"><br>
    库存:<input type="text" name="stock" value="<%=book.getStock() %>"><br>
    出版日期:<input type="text" name="publishDate" value="<%=book.getPublishDate() %>"><br>
    上架日期:<input type="text" name="marketDate" value="<%=book.getMarketDate() %>"><br>
    封面:<input type="text" name="coverUrl" value="<%=book.getCoverUrl() %>">
    <input type="file" name="coverUrl"><br>
    简介:<textarea rows="10" name="info"><%=book.getInfo() %></textarea><br>
    <button type="submit">提交</button>
</form>
<img src="<%=book.getCoverUrl() %>" alt="图书封面" width="100px">
</body>
</html>
