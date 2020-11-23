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
    <title>场地管理系统</title>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.name}<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">${user.student_workedid}</a></li>
                        <li><a id="userMoney" href="#">钱包：￥${user.money}元</a></li>
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
        <h3>场地系统</h3>
    </form>
    <ul class="nav menu">
        <li><a href="../field/toUserIndex"> 主页</a></li>
        <li><a href="../field/findAllFieldToUser"> 场地查询</a></li>
        <li><a href="../field/findAllFieldToUser"> 场地预约</a></li>
        <li class="parent">
            <a href="#sub-item-1" data-toggle="collapse">
                场地申请
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a href="../field/findAllFieldTMatch">
                        赛事场地申请
                    </a>
                </li>
                <li>
                    <a class="" href="../field/findAllFieldTCourse">
                        教师上课场地申请
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent">
            <a href="#sub-item-2" data-toggle="collapse">
                个人中心
            </a>
            <ul class="children collapse in" id="sub-item-2">
                <li>
                    <a href="../field/findMyAppointment?uid=${user.student_workedid}">
                        我的预约
                    </a>
                </li>
                <li>
                    <a class="active"  href="../field/findMyAllApp?uid=${user.student_workedid}">
                        预约记录
                    </a>
                </li>
            </ul>
        </li>
        <li role="presentation" class="divider"></li>
        <li><a href="../user/toLoginSuccessPage">退出</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">场地系统</a></li>
            <li class="active">预约记录</li>
        </ol>
    </div><!--/.row-->








    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">我的预约</h1>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    正在进行的预约
                </div>

                <div class="panel-body">

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">预约号</th>
                            <th scope="col">场地名</th>
                            <th scope="col">场地类型</th>
                            <th scope="col">地点</th>
                            <th scope="col">预约时间</th>
                            <th scope="col">预约类型</th>
                            <th scope="col">备注</th>
                            <th scope="col">状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${myApp}" var="App">
                            <tr>
                                <th scope="row">${App.id}</th>
                                <td>${App.field.fieldName}</td>
                                <td>${App.field.fieldType}</td>
                                <td>${App.field.size}</td>
                                <td><span>${App.week}周</span>&nbsp;<span class="t_day">${App.day}</span>&nbsp;<span>${App.hours}</span></td>
                                <td>${App.type}</td>
                                <td>${App.remark}</td>
                                <td><span class="t_status">${App.status}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->



</div><!--/.main-->

<script src="<%=request.getContextPath()%>/js/field/jquery-1.11.1.min.js" language="JavaScript"></script>
<script src="<%=request.getContextPath()%>/js/field/bootstrap.min.js" language="JavaScript"></script>
<script>
    let thisWeek;

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

    $(function(){
        $(".t_day").each(function(){
            let day = $(this).text();
            let charDay = "星期" + "空一二三四五六日".charAt(day);
            $(this).text(charDay);
        });
        $(".t_status").each(function(){
            let day = $(this).text();
            let charDay;
            if (day == '0'){
                charDay = "已预约"
            }
            if (day == '1'){
                charDay = "已完成"
            }
            if (day == '2'){
                charDay = "已被管理员撤销"
            }
            $(this).text(charDay);
        });
    });



</script>


</body>
</html>
