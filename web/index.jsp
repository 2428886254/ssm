<%--
  Created by IntelliJ IDEA.
  User: ChenJinLei
  Date: 2022/11/28
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>

    <style>
        a{
            text-decoration: none;
            color: black;
            font-size: 18px;
        }
        h2{
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: coral;
            border-radius: 5px;
        }
    </style>

</head>
<body>
<h2>
    <%-- ${pageContext.request.contextPath:是JSP中取得绝对路径的方法--%>
    <a href="${pageContext.request.contextPath}/book/allBook">进入书籍列表</a>
</h2>

</body>
</html>
