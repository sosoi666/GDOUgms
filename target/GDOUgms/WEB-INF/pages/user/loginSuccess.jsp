<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/16
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <%-- 导航条    开始   --%>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="container-fluid">
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><p class="navbar-text"><span style="font-weight: bold">当前学号/学工号：</span> <span>${sessionScope.user.student_workedid}</span></p></li>
                            <li id="header-li"></li>
                            <li><p class="navbar-text"><span style="font-weight: bold">当前角色：</span> <span>${sessionScope.user.role.roletype}</span></p></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="../user/toChangePassword">修改密码</a></li>
                            <li><a href="javascript:history.go(-1)">退出登录</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </div>

        </nav>
        <%-- 导航条    结束   --%>

        <%-- 主内容    开始   --%>
        <div class="lSuccess-wrap">
            <%-- 罚款条例公告    开始   --%>
            <div class="page-header login-width">
                <h3>馆内设施罚款条例公告 <small style="margin-left: 106px"> 修改人：</small><small id="change-person"></small></h3>
            </div>
            <div class="panel panel-default login-width">
                <div id="announcement" class="panel-body">
                    <pre id="announcement-pre" style="background-color: #fff;font-family: Helvetica;
                        font-size: 14px;line-height: 1.4;border: none"></pre>
                </div>
            </div>
            <%-- 罚款条例公告    结束   --%>

            <div class="page-header login-width" style="margin-top: 92px">
                <h3>业务操作</h3>
            </div>
            <div class="row">
                <div id="list1" class="col-md-4">
                    <div class="list-group">
                        <a href="../field/toUserIndex" class="list-group-item">场地申请</a>
                        <a href="#" class="list-group-item">体育赛事申请</a>
                        <a href="#" class="list-group-item">器材申请</a>
                    </div>
                </div>
                <div id="list2" class="col-md-4">
                    <div class="list-group">
                        <a href="../field/toIndex" id="isShowField" class="list-group-item">场地管理</a>
                        <a href="#" id="isShowCompetition" class="list-group-item">体育赛事管理</a>
                        <a href="#" id="isShowEquipment" class="list-group-item">器材管理</a>
                        <a href="../announcement/toChangeAnnouncement" id="isShow" class="list-group-item">修改馆内设施罚款条例公告</a>
                    </div>
                </div>
                <div id="list3" class="col-md-4">
                    <div class="list-group">
                        <a href="../user/toAddAdmin" class="list-group-item">添加管理员</a>
                        <a href="../user/toDeleteAdmin" class="list-group-item">删除管理员</a>
                        <a href="../user/toFindAdmin" class="list-group-item">查询管理员 / 更新管理员角色</a>
                        <a href="../announcement/toChangeAnnouncement" class="list-group-item">修改馆内设施罚款条例公告</a>
                    </div>
                </div>
            </div>
        </div>

        <%-- 主内容    结束   --%>

    </div>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/bootstrap.css">
    <script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/user/bootstrap.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/loginSuccess.css">
    <script>
        $(function () {
            //通过el表达式取出roleid，来判断隐藏哪列div
            let roleid = ${sessionScope.user.roleid};
            // if(roleid == 2 || roleid == roleid == 3 || roleid == 4){
            //     $("#list3")
            // }
            // if(roleid == 1){
            //     $("#isShow").hide();
            // }else if(roleid == 2 || roleid == 3 || roleid == 4){
            //     $("#list3").hide();
            // }else if(roleid == 5){
            //     $("#list2").hide();
            //     $("#list3").hide();
            // }
            switch (roleid) {
                case 1:
                    $("#isShow").hide();
                    break;
                case 2:
                    $("#list3").hide();
                    $("#isShowCompetition").hide();
                    $("#isShowEquipment").hide();
                    break;
                case 3:
                    $("#list3").hide();
                    $("#isShowField").hide();
                    $("#isShowEquipment").hide();
                    break;
                case 4:
                    $("#list3").hide();
                    $("#isShowField").hide();
                    $("#isShowCompetition").hide();
                    break;
                case 5:
                    $("#list2").hide();
                    $("#list3").hide();
                    break;
            }

            //页面启动后，自动去后台获取馆内设施罚款条例公告
            $.ajax({
                url:"../announcement/getAnnouncement",
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                type:"post",
                success:function (data) {
                    $("#announcement-pre").html(data.content);
                    $("#change-person").html(data.name);
                }
            });

        })


    </script>

</body>
</html>
