<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/17
  Time: 23:10
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
        <div class="register-title"><h4>查询管理员</h4></div>
        <form id="register-form" class="form-horizontal" method="post" action="validation/validateLogin">
            <div class="form-group">
                <label for="roletype" class="col-sm-4 control-label">要查询的管理员类型</label>
                <div class="col-sm-8">
<%--                    <input type="text" class="" id="student_workedid" name="student_workedid">--%>
                    <select name="roletype" id="roletype" style="height: 34px;
                    border: 1px solid #adadad;border-radius: 4px;margin-right: 10px">
                        <option value="2">场地管理员</option>
                        <option value="3">赛事管理员</option>
                        <option value="4">器材管理员</option>

                    </select>
                    <button id="typefind-button" type="button" class="btn btn-default ">根据类型查询管理员</button>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <button id="findAll-button" type="button" class="btn btn-default ">查询所有管理员</button>
                </div>
            </div>

        </form>

        <div class="list-title"><h4>更新管理员角色</h4> </div>
        <form id="update-form" class="form-horizontal" method="post" action="validation/validateLogin">
            <div class="form-group">
                <label for="student_workedid" class="col-sm-4 control-label">将要更新角色的 学号/职工号</label>
                <div class="col-sm-8">
                    <input type="text" name="student_workedid" id="student_workedid">
                </div>
            </div>

            <div class="form-group">
                <label for="roletype2" class="col-sm-4 control-label">选择要更新的管理员类型</label>
                <div class="col-sm-8">
                    <select name="roletype2" id="roletype2" style="height: 34px;
                    border: 1px solid #adadad;border-radius: 4px;margin-right: 10px">
                        <option value="2">场地管理员</option>
                        <option value="3">赛事管理员</option>
                        <option value="4">器材管理员</option>

                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <button id="update-button" type="button" class="btn btn-default ">立即更新</button>
                </div>
            </div>

        </form>


        <div class="list-title"><h4>信息列表</h4> </div>
        <table id="table" class="table">
            <tr>
                <td>学号/职工号</td>
                <td>姓名</td>
                <td>手机号</td>
                <td>邮箱</td>
                <td>角色类型</td>
                <td>角色职责</td>
            </tr>
        </table>

    </div>
</div>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/user/JQuer_3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/user/bootstrap.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/findAdmin.css">
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

<script>
    $(function () {

        //表单验证
        $("#update-form").validate({
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


        $("#typefind-button").click(function () {
            $("#table > tbody > tr:not(:nth-child(1))").remove();
            var val = $("#roletype").val();
            //发送Ajax请求 ，请求根据管理员类型查询管理员用户
            $.ajax({
                url:"../user/findAdmin",
                contentType:"application/json;charset=UTF-8",
                data:'{"roleid":'+val+'}',
                dataType:"json",
                type:"post",
                success:function(data){
                    // console.log(data[0].student_workedid);
                    //开始解析后台传输传输来的查询数据库的记录集合
                    // for(i=0;i<data.length;i++){
                    //     var str="<li value="+data[i].id+">"+data[i].id+data[i].name+"</li>";
                    //     $("#listStudent").append(str);
                    for(var i = 0;i < data.length; i++){
                        var str = "      <tr>" +
                            "                <td>"+data[i].student_workedid +"</td>" +
                            "                <td>"+data[i].name +"</td>" +
                            "                <td>"+data[i].mobilephone +"</td>" +
                            "                <td>"+data[i].email +"</td>" +
                            "                <td>"+data[i].role.roletype +"</td>" +
                            "                <td>"+data[i].role.reposibility +"</td>" +
                            "            </tr>";
                        $("#table > tbody").append(str);
                    }

                }
            });
        });

        $("#findAll-button").click(function () {
            $("#table > tbody > tr:not(:nth-child(1))").remove();
            //发送Ajax请求 ，请求 查询所有管理员用户
            $.ajax({
                url:"../user/findAllAdmin",
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                type:"post",
                success:function(data){
                    // console.log(data[0].student_workedid);
                    //开始解析后台传输传输来的查询数据库的记录集合
                    // for(i=0;i<data.length;i++){
                    //     var str="<li value="+data[i].id+">"+data[i].id+data[i].name+"</li>";
                    //     $("#listStudent").append(str);
                    for(var i = 0;i < data.length; i++){
                        var str = "      <tr>" +
                            "                <td>"+data[i].student_workedid +"</td>" +
                            "                <td>"+data[i].name +"</td>" +
                            "                <td>"+data[i].mobilephone +"</td>" +
                            "                <td>"+data[i].email +"</td>" +
                            "                <td>"+data[i].role.roletype +"</td>" +
                            "                <td>"+data[i].role.reposibility +"</td>" +
                            "            </tr>";
                        $("#table > tbody").append(str);
                    }

                }
            });
        });

        $("#update-button").click(function () {
            var student_workedid = $("#student_workedid").val();
            var roletype2 = $("#roletype2").val();
            $.ajax({
                url:"../user/updateAdmin",
                contentType:"application/json;charset=UTF-8",
                //data:'{"roleid":'+val+'}',
                data:'{"student_workedid":' + student_workedid +',"roleid":' + roletype2 + '}',
                dataType:"json",
                type:"post",
                success:function(data){
                    alert(data.msg);
                }
            })
        });



    })
</script>
</body>
</html>
