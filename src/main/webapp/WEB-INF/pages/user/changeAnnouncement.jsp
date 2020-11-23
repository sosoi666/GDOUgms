<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/18
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <div class="register-wrap">
        <div class="backToMain" style="float: right;margin-right: 10px"><a href="javascript:history.go(-1)">回到主界面</a></div>
        <div class="register-title"><h4>修改馆内设施罚款条例公告</h4></div>
        <form id="register-form" class="form-horizontal" method="post" action="../announcement/changeAnnouncement">
            <div class="form-group">
                <label for="announcement" class="col-sm-3 control-label">馆内设施罚款条例公告</label>
                <div class="col-sm-9">
                    <textarea name="announcement" id="announcement" autofocus cols="20" wrap="hard"></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-default ">立即修改</button>
                </div>
            </div>
        </form>
    </div>
</div>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/user/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/changeAnnouncement.css">
<script>
    $(function () {




    })
</script>
</body>
</html>
