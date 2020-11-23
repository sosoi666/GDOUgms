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
            <a href="#sub-item-1" data-toggle="collapse" >
                场地管理
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a href="../field/fieldQuery">
                        查询场地
                    </a>
                </li>
                <li>
                    <a href="../field/fieldQuery">
                        编辑场地
                    </a>
                </li>
                <li>
                    <a class="" href="../field/toAddFieldPage">
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
        <li class="active"><a href="javascript:void(0);" onclick="toFieldUse()">场地使用</a></li>
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
            <li class="active">场地使用管理</li>
        </ol>
    </div><!--/.row-->








    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">场地使用列表</h1>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default row">
                <div class="panel-body col-md-8">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">预约编号</th>
                            <th scope="col">预约学工号</th>
                            <th scope="col">预约人姓名</th>
                            <th scope="col">场地名</th>
                            <th scope="col">预约类型</th>
                            <th scope="col">收费/小时</th>
                            <th scope="col">预约时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="thisApp">
                            <tr class="useTable" onclick="toTimer(${thisApp.id})">
                                <th scope="row">${thisApp.id}</th>
                                <td>${thisApp.uWid}</td>
                                <td>${thisApp.user.name}</td>
                                <td>${thisApp.field.fieldName}</td>
                                <td>${thisApp.type}</td>
                                <td>${thisApp.field.fees.cost}</td>
                                <td><span>${thisApp.week}周</span>&nbsp;<span class="t_day">${thisApp.day}</span>&nbsp;<span>${thisApp.hours}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail" style="height: 450px; margin-top: 20px;">
                        <div class="caption">
                            <h1 class="text-center">计时器</h1>
                            <p><span>当前预约号：</span><span id="appTitle"></span></p>
                            <div class=" text-center time-card">
                                <p class="timer" id="timer">00:00:00</p>
                            </div>
                            <div class="button-card">
                                <p class="text-center"><a href="javascript:void(0);" onclick="startTimer()" class="btn btn-primary  btn-block" id="btnStart" role="button">开始计时</a></p>
                                <p class="text-center"><a href="javascript:void(0);" onclick="stopTimer()" class="btn btn-primary  btn-block" id="btnStop" role="button">结束计时</a></p>
                                <p class="text-center"><a href="javascript:void(0);" onclick="toFinal()" class="btn btn-primary  btn-block" id="btnFinal" role="button">结算</a></p>
                            </div>

                        </div>
                    </div>
                </div>
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

    let thisAid;
    let sTime;
    let isTime = 0;
    let isEnd;
    let endTime;
    var date1;
    var eTime;
    let finalHours;
    let finalMinutes;
    setInterval(function(){
        var time=new Date();
        var hour=checkTime(time.getHours());   //获取时
        var minute=checkTime(time.getMinutes());  //获取分
        var second=checkTime(time.getSeconds());  //获取秒

        if(isTime ==1){
            if(isEnd == 1){
                eTime = new Date(endTime);
            }else {
                eTime = new Date();
            }
            var date2 = eTime.getTime();
            var date3 = date2 - date1;
            // console.log(date3)
            var days=Math.floor(date3 / (24*3600*1000)) // 计算出相差天数
            // console.log(days)
            //计算出小时数
            var leave1 = date3 % (24*3600*1000) //计算天数后剩余的毫秒数
            var hours = Math.floor(leave1 / (3600*1000))
            // console.log(hours)

            //计算出相差分钟数
            var leave2 = leave1 % (3600*1000) //计算小时数后剩余的毫秒数
            var minutes = Math.floor(leave2 / (60*1000))
            //console.log(minutes)

            //计算出相差秒数
            var leave3 = leave2 % (60*1000) //计算分钟数后剩余的毫秒数
            var seconds = Math.round(leave3 / 1000)
            //console.log(seconds);
            //console.log("相差"+days+"天"+hours+"小时"+minutes+"分钟"+seconds+"秒");
            finalHours = hours;
            finalMinutes = minutes;
            var resultHour = checkTime(hours);
            var resultMinute = checkTime(minutes);
            var resultSecond = checkTime(seconds);
            $("#timer").text(resultHour+":"+resultMinute+":"+resultSecond);
        }else{
            $("#timer").text("00:00:00");
        }

        /****当时、分、秒、小于10时，则添加0****/
        function checkTime(i){
            if(i<10) return "0"+i;
            return i;
        }
        $("#time").text(hour+":"+minute+":"+second)
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

    function toTimer(aid) {
        // var aIem = document.getElementsByClassName("useTable");
        // for(let i = 0; i < aIem.length; i++){
        //     aIem[i].onclick = function(){
        //         for(let i = 0; i < aIem.length; i++){
        //             aIem[i].className = "useTable";
        //         }
        //         this.className = "useTable info";
        //     }
        // }
        $("#appTitle").text(aid);
        $.ajax({
            url:"../field/findTimer",
            contentType:"application/json;charset=UTF-8",
            data:'{"aid":'+aid+'}',
            dataType:"json",
            type:"post",
            success:function(data){
                // alert("123")
                // alert(data);
                // alert(data.aid);
                // alert(data.startTime);
                // alert(data.endTime);
                thisAid = data.aid;
                if(data.startTime != null){
                    $("#btnStart").attr({"disabled":"disabled"});
                    isTime = 1;
                    sTime = new Date(data.startTime);
                    date1 = sTime.getTime();
                }else {
                    $("#btnStart").removeAttr("disabled");
                    isTime = 0;
                }

                if(data.endTime != null){
                    $("#btnStop").attr({"disabled":"disabled"});
                    $("#btnFinal").removeAttr("disabled");
                    isEnd=1;
                    endTime = data.endTime;
                }else {
                    $("#btnStop").removeAttr("disabled");
                    $("#btnFinal").attr({"disabled":"disabled"});
                    isEnd =0;
                }
            }
        });
    }

    function startTimer() {
        let t = new Date();
        $.ajax({
            url:"../field/startTimer",
            contentType:"application/json;charset=UTF-8",
            data:'{"aid":'+thisAid+',"startTime":"'+t+'"}',
            dataType:"json",
            type:"post",
            success:function(data){
                // alert("123")
                // alert(data);
                // alert(data.aid);
                // alert(data.startTime);
                // alert(data.endTime);
                toTimer(data.aid);
            }
        });
    }

    function stopTimer(){
        let t = new Date();
        $.ajax({
            url:"../field/stopTimer",
            contentType:"application/json;charset=UTF-8",
            data:'{"aid":'+thisAid+',"endTime":"'+t+'"}',
            dataType:"json",
            type:"post",
            success:function(data){
                toTimer(data.aid);
            }
        });
    }

    function toFinal(){
        if(window.confirm('你确定结算该场地吗？')){

            // let thisSrc = '../field/toFinal?aid='+thisAid+'&useHours='+finalHours+'&useMinutes'+finalMinutes;
            // window.location.href=href;
            $.ajax({
                url:"../field/toFinal?useHours="+finalHours+"&useMinutes="+finalMinutes,
                contentType:"application/json;charset=UTF-8",
                data:'{"aid":'+thisAid+'}',
                dataType:"json",
                type:"post",
                success:function(data){
                    alert('结算成功,本次预约订单消费总额为'+data+'元')
                    toFieldUse();
                }
            });
        }
    }




    $(".t_day").each(function(){
        let day = $(this).text();
        let charDay = "星期" + "空一二三四五六日".charAt(day);
        $(this).text(charDay);
    });



</script>


</body>
</html>
