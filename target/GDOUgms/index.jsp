<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/13
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <div>
        <div class="login-wrap">
            <div class="login-des">账号登录</div>
            <form id="login-form" class="form-horizontal" method="post" action="user/login">
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" id="student_workedid" placeholder="学号 / 职工号"
                        name="student_workedid">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="password" class="form-control" id="password" placeholder="密码"
                        name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="submit" class="form-control" class="btn btn-default">登录</button>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button id="toRegister" type="button" class="form-control" class="btn btn-default">注册账号</button>
                    </div>
                </div>
            </form>
        </div>
    </div>





    <link rel="stylesheet" href="css/user/bootstrap.css">
    <script src="js/user/JQuer_3.4.1.js"></script>
    <script src="js/user/bootstrap.js"></script>
    <link rel="stylesheet" href="css/user/index.css">
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>
        $(function () {
            //点击“注册”跳转到注册界面
            $("#toRegister").click(function () {
                window.location.href="register.jsp";
            })

            //注册表单验证
            $("#login-form").validate({
                errorPlacement: function(error, element) {
                    error.appendTo(element.parent());
                },
                //debug:true,    //禁止表单提交
                rules:{        //如下是写每一个表单元素它的验证规则
                    student_workedid:{
                        required:true,
                        rangelength:[12,12],
                        digits:true
                    },
                    password:{
                        required:true,
                        rangelength:[6,20]
                    }
                },
                messages:{
                    student_workedid:{
                        rangelength:"长度必须是12个的字符串"
                    }
                }
            })
        })
    </script>


</body>
</html>
