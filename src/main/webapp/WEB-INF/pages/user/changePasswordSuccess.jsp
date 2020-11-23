<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/17
  Time: 8:44
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
            修改密码成功！3秒后返回到主界面。
        </div>

    </div>
    <script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
    <script>
        $(function () {
            setInterval(function () {
                window.location.href="javascript:history.go(-2)"
            },3000);
        })
    </script>
</body>
</html>
