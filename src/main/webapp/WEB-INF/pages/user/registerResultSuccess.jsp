<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/16
  Time: 11:02
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
            ${msg}
        </div>

    </div>
    <script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
    <script>
        $(function(){
            setInterval(function () {
                //window.location="http://127.0.0.1:5500/detail.html?index="+index +"&username3="+username3 ;
                window.location="<%=request.getContextPath()%>/index.jsp";
            },3000)
        })
    </script>

</body>
</html>
