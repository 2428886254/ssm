<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <%--引入BootStrap美化界面--%>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%--class="container" 引入css格式--%>
<div class="container">
    <%--清除浮动--%>
    <div class="row clearfix">
        <%--把屏幕分成12份--%>
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表------显示所有书籍</small>
                </h1>
            </div>
        </div>
        <%--跳转添加页面--%>
            <div class="row">
                <div class="col-md-4 column">
                    <%-- ${pageContext.request.contextPath:是JSP中取得绝对路径的方法 （可以不写，写了更安全）--%>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">添加书籍</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示所有书籍</a>
                </div>
                <div class="col-md-4 column"></div>
                <div class="col-md-4 column">
                    <%--查询书籍--%>
                    <form action="${pageContext.request.contextPath}/book/queryBook" method="post" class="form-inline" style="float: right">
                        <span style="color: crimson;font-weight: bold">${error}</span>
                        <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书籍名称">
                        <input type="submit" value="查询" class="bth bt-primary">
                    </form>
                </div>
            </div>

        </div>


    <%--展示所有数据 row行 clearfix清除浮动--%>
    <div class="row clearfix">
        <div col-md-12 column>
            <%--table表格  class格式 table-hover隔行变色 table-striped可以使奇数行的背景设为灰色--%>
            <table class="table table-hover table-striped">
                <%--表格头--%>
                <thead>
                    <tr>
                        <th>书籍编号</th>
                        <th>书籍名称</th>
                        <th>书籍数量</th>
                        <th>书籍详情</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <%--表格体--%>
                <tbody>
                    <%--c标签变量  var="book"每一个值--%>
                    <c:forEach var="book" items="${list}">
                        <tr>
                            <td>${book.bookID}</td>
                            <td>${book.bookName}</td>
                            <td>${book.bookCounts}</td>
                            <td>${book.detail}</td>
                            <td>
                                                    <%--传递id第一种方法--%>
                                <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.bookID}">修改</a>
                                             &nbsp;|&nbsp;           <%--第二种方法--%>
                                <a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
