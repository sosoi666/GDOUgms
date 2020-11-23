<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/14
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="user/findAll">测试SpringMVC</a>

<form action="user/saveUser" method="post">
    学号/职工号：<input type="text" name="student_workedid">  <br>
    密码：<input type="password" name="password">  <br>
    名字：<input type="text" name="name">  <br>
    手机号码：<input type="text" name="mobilephone">  <br>
    邮箱：<input type="text" name="email">  <br>
    角色号：<input type="text" name="roleid">  <br>
    <input type="submit" value="提交">
</form>

</body>
</html>
