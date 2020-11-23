<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/16
  Time: 19:50
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
        <div class="register-title"><h4>修改密码</h4></div>
        <form id="register-form" class="form-horizontal" method="post" action="../user/changePassword">
            <div class="form-group">
                <label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
                <div class="col-sm-10">
                    <input type="password" class="" id="oldPassword" name="oldPassword">
                    <a id="oldPassword-a1" href="javascript:;">显示/隐藏</a>
                </div>
            </div>
            <div class="form-group">
                <label for="newPassword" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-10">
                    <input type="password" class="" id="newPassword" name="newPassword">
                    <a id="newPassword-a2" href="javascript:;">显示/隐藏</a>
                </div>
            </div>
            <div class="form-group">
                <label for="newPassword2" class="col-sm-2 control-label">再次输入新密码</label>
                <div class="col-sm-10">
                    <input type="password" class="" id="newPassword2" name="newPassword2">
                    <a id="newPassword-a3" href="javascript:;">显示/隐藏</a>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default ">立即修改</button>
                </div>
            </div>
        </form>
    </div>
</div>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/user/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/changePassword.css">
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script>
    $(function () {
        var isShow1 = true;
        var isShow2 = true;
        var isShow3 = true;

        //点击“显示或隐藏”可以是密码明文或暗文
        $("#oldPassword-a1").click(function () {
            if(isShow1 == true){
                $("#oldPassword").prop("type","text");
                isShow1 = false;
            }else if(isShow1 == false){
                $("#oldPassword").prop("type","password");
                isShow1 = true;
            }
        });
        $("#newPassword-a2").click(function () {
            if(isShow2 == true){
                $("#newPassword").prop("type","text");
                isShow2 = false;
            }else if(isShow2 == false){
                $("#newPassword").prop("type","password");
                isShow2 = true;
            }
        });
        $("#newPassword-a3").click(function () {
            if(isShow3 == true){
                $("#newPassword2").prop("type","text");
                isShow3 = false;
            }else if(isShow3 == false){
                $("#newPassword2").prop("type","password");
                isShow3 = true;
            }
        });


        //注册表单验证
        $("#register-form").validate({
            errorPlacement: function(error, element) {
                error.appendTo(element.parent());
            },
            //debug:true,    //禁止表单提交
            rules:{        //如下是写每一个表单元素它的验证规则
                oldPassword:{
                    required:true,
                    rangelength:[6,20]
                },
                newPassword:{
                    required:true,
                    rangelength:[6,20]
                },
                newPassword2:{
                    required:true,
                    rangelength:[6,20]
                }

            },
            messages:{

            }
        })




    })
</script>
</body>
</html>