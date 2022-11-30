<%--
  Created by IntelliJ IDEA.
  User: ChenJinLei
  Date: 2022/11/29
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>修改页面</title>
<%--引入BootStrap美化界面--%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%--清除浮动--%>
    <div class="row clearfix">
        <%--把屏幕分成12份--%>
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>

    </div>
    <%--点击修改会提交到form表单--%>
    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <%--使用隐藏域传递bookID--%>
        <input type="hidden" name="bookID" value="${books.bookID}">
        <div class="form-group">
            <label>书籍名称</label>
            <%--required:表单为空时不能提交--%>
            <input type="text" name="bookName" class="form-control" value="${books.bookName}" required>
        </div>
        <div class="form-group">
            <label>书籍数量</label>
            <input type="text" name="bookCounts" class="form-control" value="${books.bookCounts}" required>
        </div>
        <div class="form-group">
            <label>书籍详情</label>
            <input type="text" name="detail" class="form-control" value="${books.detail}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="修改">
        </div>
    </form>

</div>
</body>
</html>
