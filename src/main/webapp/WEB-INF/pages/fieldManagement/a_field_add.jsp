<%--
  Created by IntelliJ IDEA.
  User: 13684
  Date: 2020/6/13
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>场地管理系统-管理员</title>
    <link href="<%=request.getContextPath()%>/css/field/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/field/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>广东海洋大学</span>体育管理系统</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 管理员 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="../index.jsp">退出登录</a></li>
                    </ul>
                </li>
                <li class="pull-right date">
                    <span class="thisdate" id="week"></span>
                    <span class="thisdate" id="day"></span>
                    <span class="thisdate" id="time"></span>
                </li>
            </ul>
        </div>

    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form>
        <h3>场地管理</h3>
    </form>
    <ul class="nav menu">
        <li><a href="../field/toIndex"> 主页</a></li>
        <li class="parent">
            <a href="#sub-item-1" data-toggle="collapse">
                场地管理
            </a>
            <ul class="children collapse in" id="sub-item-1">
                <li>
                    <a  href="../field/fieldQuery">
                        查询场地
                    </a>
                </li>
                <li>
                    <a href="../field/fieldQuery">
                        编辑场地
                    </a>
                </li>
                <li>
                    <a class="active" href="../field/toAddFieldPage">
                        添加场地
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent">
            <a href="#sub-item-2" data-toggle="collapse">
                预约管理
            </a>
            <ul class="children collapse" id="sub-item-2">
                <li>
                    <a  href="javascript:void(0);" onclick="queryappoint()">
                        查询预约
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0);" onclick="queryappoint()">
                        编辑预约
                    </a>
                </li>
                <li>
                    <a class="" href="../field/toAddAppPage">
                        添加预约
                    </a>
                </li>
            </ul>
        </li>
        <li><a href="javascript:void(0);" onclick="toFieldUse()">场地使用</a></li>
        <li><a href="../field/toEditNotice"> 编辑场馆公告</a></li>
        <li><a href="../field/feesQuery"> 管理收费标准</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="../user/toLoginSuccessPage">退出</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">场地管理</a></li>
            <li class="active">场地管理</li>
        </ol>
    </div><!--/.row-->








    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">添加场地</h1>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <form id="addFieldForm" action="../field/addField" style="margin: 30px; padding: 20px;">
                    <div class="form-group">
                        <label for="inputFieldName">场地名</label>
                        <input type="text" class="form-control" id="inputFieldName" placeholder="" name="fieldName">
                    </div>
                    <div class="form-group">
                        <label >场地类型</label>
                        <select class="form-control" name="fieldType">
                            <option>羽毛球场</option>
                            <option>乒乓球场</option>
                            <option>篮球场</option>
                            <option>足球场</option>
                            <option>网球场</option>
                            <option>排球场</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label >使用类型</label>
                        <select class="form-control" name="useType">
                            <option>普通</option>
                            <option>校队使用</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label >地址</label>
                        <select class="form-control" name="size">
                            <option>体育馆一楼</option>
                            <option>体育馆二楼</option>
                            <option>体育馆副馆</option>
                            <option>东区运动场</option>
                            <option>西区运动场</option>
                        </select>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading panel-inner">每周开放时间</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label >从</label>
                                <select id="start_day" class="form-control" name="beginDay">
                                    <option value="1">周一</option>
                                    <option value="2">周二</option>
                                    <option value="3">周三</option>
                                    <option value="4">周四</option>
                                    <option value="5">周五</option>
                                    <option value="6">周六</option>
                                    <option value="7">周日</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label >到</label>
                                <select id="end_day" class="form-control" name="endDay">
                                    <option value="1">周一</option>
                                    <option value="2">周二</option>
                                    <option value="3">周三</option>
                                    <option value="4">周四</option>
                                    <option value="5">周五</option>
                                    <option value="6">周六</option>
                                    <option value="7">周日</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label >备注</label>
                        <textarea class="form-control" rows="3" name="remark"></textarea>
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

            </div>
        </div>
    </div><!--/.row-->



</div><!--/.main-->

<script src="<%=request.getContextPath()%>/js/field/jquery-1.11.1.min.js" language="JavaScript"></script>
<script src="<%=request.getContextPath()%>/js/field/bootstrap.min.js" language="JavaScript"></script>
<script>
    let thisWeek;

    function queryappoint(){
        let thisSrc = '../field/appointmentQuery?week='
        let href = thisSrc+thisWeek;
        window.location.href=href;
    }

    function toFieldUse(){
        let thisHours = new Date().getHours();
        let thisDays = "7123456".charAt(new Date().getDay());
        let thisSrc1 = '../field/toFieldUse?week=';
        let thisSrc2 = '&day=';
        let thisSrc3 = '&hours='
        let href = thisSrc1+thisWeek+thisSrc2+thisDays+thisSrc3+thisHours;
        window.location.href =href;
    }

    setInterval(function(){
        var time=new Date();
        var hour=checkTime(time.getHours());   //获取时
        var minite=checkTime(time.getMinutes());  //获取分
        var second=checkTime(time.getSeconds());  //获取秒
        /****当时、分、秒、小于10时，则添加0****/
        function checkTime(i){
            if(i<10) return "0"+i;
            return i;
        }
        $("#time").text(hour+":"+minite+":"+second)
    },1000);     //setInterval(fn,i) 定时器，每隔i秒执行fn		 
    function getWeek() {
        var time,week,checkDate = new Date();
        checkDate.setDate(checkDate.getDate() + 4 - (checkDate.getDay() || 7));
        time = checkDate.getTime();
        checkDate.setMonth(0);
        checkDate.setDate(1);
        week=(Math.floor(Math.round((time - checkDate) / 86400000) / 7) + 1)-10;//-10为了校对学校开学周数
        thisWeek = week
        var str = "星期" + "日一二三四五六".charAt(new Date().getDay());
        //alert('yy'+checkDate+'w'+(week<10?'0':'')+week);
        //alert('第'+(week<10?'0':'')+week+'周'+str)

        $("#week").text('第'+(week<10?'0':'')+week+'周');
        $("#day").text(str);
    }
    window.onload = getWeek();




    $("#start_day").change(function(){
        $("#end_day").empty();
        var checkValue=$("#start_day").val();
        if(checkValue == "1"){
            $("#end_day").prepend("<option value='7'>周日</option>");
            $("#end_day").prepend("<option value='6'>周六</option>");
            $("#end_day").prepend("<option value='5'>周五</option>");
            $("#end_day").prepend("<option value='4'>周四</option>");
            $("#end_day").prepend("<option value='3'>周三</option>");
            $("#end_day").prepend("<option value='2'>周二</option>");
            $("#end_day").prepend("<option value='1'>周一</option>");
        }
        if(checkValue == "2"){
            $("#end_day").prepend("<option value='7'>周日</option>");
            $("#end_day").prepend("<option value='6'>周六</option>");
            $("#end_day").prepend("<option value='5'>周五</option>");
            $("#end_day").prepend("<option value='4'>周四</option>");
            $("#end_day").prepend("<option value='3'>周三</option>");
            $("#end_day").prepend("<option value='2'>周二</option>");
        }
        if(checkValue == "3"){
            $("#end_day").prepend("<option value='7'>周日</option>");
            $("#end_day").prepend("<option value='6'>周六</option>");
            $("#end_day").prepend("<option value='5'>周五</option>");
            $("#end_day").prepend("<option value='4'>周四</option>");
            $("#end_day").prepend("<option value='3'>周三</option>");
        }
        if(checkValue == "4"){
            $("#end_day").prepend("<option value='7'>周日</option>");
            $("#end_day").prepend("<option value='6'>周六</option>");
            $("#end_day").prepend("<option value='5'>周五</option>");
            $("#end_day").prepend("<option value='4'>周四</option>");
        }
        if(checkValue == "5"){
            $("#end_day").prepend("<option value='7'>周日</option>");
            $("#end_day").prepend("<option value='6'>周六</option>");
            $("#end_day").prepend("<option value='5'>周五</option>");
        }
        if(checkValue == "6"){
            $("#end_day").prepend("<option value='7'>周日</option>");
            $("#end_day").prepend("<option value='6'>周六</option>");
        }
        if(checkValue == "7"){
            $("#end_day").prepend("<option value='7'>周日</option>");
        }
    })
    $("#addFieldForm").submit(function () {
        if ($("#inputFieldName").val() == ""){
            alert("你必须填写场地名。");
            return false;
        }else {
            if(window.confirm('你确定要添加该场地吗？')){
                //点击确定的操作
                alert("添加场地成功")
            }else{
                //点击取消的操作
                //return false 阻止表单提交
                return false;
            }
        }
    })
</script>


</body>
</html>
