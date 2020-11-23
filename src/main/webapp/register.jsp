<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/14
  Time: 22:05
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
            <div class="backToMain" style="float: right;margin-right: 10px"><a href="javascript:history.go(-1)">回到登录界面</a></div>
            <div class="register-title"><h4>普通用户注册</h4></div>
            <form id="register-form" class="form-horizontal" method="post" action="validation/validateLogin">
                <div class="form-group">
                    <label for="student_workedid" class="col-sm-2 control-label">学号/职工号</label>
                    <div class="col-sm-10">
                        <input type="text" class="" id="student_workedid" name="student_workedid">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="" id="password" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="" id="name" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="mobilephone" class="col-sm-2 control-label">手机号</label>
                    <div class="col-sm-10">
                        <input type="text" class="" id="mobilephone" name="mobilephone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="email" class="" id="email" name="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="validateCode" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <%-- 1、图片src利用相对路径去请求Controller的方法，类似于表单的action值       --%>
                                <img src="validation/loadValidateCode" id="validateCodeImage" name="validateCodeImage"
                                     style="width: 100px;height: 35px;"   >
                            </div>
                            <input type="text" class="" id="validateCode" name="validateCode">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default ">立即注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <link rel="stylesheet" href="css/user/bootstrap.css">
    <script src="js/user/JQuer_3.4.1.js"></script>
    <script src="js/user/bootstrap.js"></script>
    <link rel="stylesheet" href="css/user/register.css">
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>
        $(function () {
            //  2、点击图片能切换验证码，也是再次利用src发送请求
            $("img").click(function () {
                // var time = new Date().getTime();
                $("#validateCodeImage").attr('src', 'validation/loadValidateCode');
            })

            //注册表单验证
            $("#register-form").validate({
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
                    },
                    name:{
                        required:true,
                        rangelength:[2,20]
                    },
                    mobilephone:{
                        required:true,
                        rangelength:[4,11],
                        digits:true
                    },
                    email:{
                        required:true,
                        rangelength:[8,30],
                        email:true
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
