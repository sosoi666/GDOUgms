<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/17
  Time: 14:16
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
        <div class="register-title"><h4>添加管理员</h4></div>
        <form id="register-form" class="form-horizontal" method="post" action="../user/addAdmin">
            <div class="form-group">
                <label for="student_workedid" class="col-sm-5 control-label">将要升级为管理员的“学号/职工号”</label>
                <div class="col-sm-7">
                    <input type="text" class="" id="student_workedid" name="student_workedid">
                </div>
            </div>
            <div class="form-group">
                <label for="roletype" class="col-sm-5 control-label">选择管理员类型</label>
                <div class="col-sm-7">
                    <select name="roletype" id="roletype" class="">
                        <%-- <option value ="volvo">Volvo</option> --%>
                        <option value="2">场地管理员</option>
                        <option value="3">赛事管理员</option>
                        <option value="4">器材管理员</option>

                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button type="submit" class="btn btn-default ">立即添加</button>
                </div>
            </div>
        </form>
    </div>
</div>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/user/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/addAdmin.css">
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script>
    $(function () {

        //表单验证
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
