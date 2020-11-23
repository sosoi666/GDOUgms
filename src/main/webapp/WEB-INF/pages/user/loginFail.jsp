<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/16
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style="margin: 0 auto;margin-top: 200px;border:1px solid rgba(0,0,0,0.1);border-radius: 10px;padding: 20px;
        width: 200px;height: 200px;">
        <div style="margin-bottom: 115px;">
            ${loginFailMsg}
        </div>
        <a href="<%=request.getContextPath()%>/index.jsp" style="display: inline-block;border:1px solid rgba(0,0,0,0.2);
            border-radius: 10px;padding: 10px;text-decoration: none">回到登录界面，重新输入</a>
    </div>
</body>
</html>
