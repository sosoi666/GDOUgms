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
            <ul class="children collapse" id="sub-item-1">
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
                    <a href="../field/toAddFieldPage">
                        添加场地
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent">
            <a href="#sub-item-2" data-toggle="collapse">
                预约管理
            </a>
            <ul class="children collapse in" id="sub-item-2">
                <li>
                    <a  href="javascript:void(0);" onclick="queryappoint()">
                        查询预约
                    </a>
                </li>
                <li>
                    <a class="active" href="javascript:void(0);" onclick="queryappoint()">
                        编辑预约
                    </a>
                </li>
                <li>
                    <a href="../field/toAddAppPage">
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
            <li class="active">预约管理</li>
        </ol>
    </div><!--/.row-->








    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">编辑预约</h1>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <form id="appEditForm" action="../field/editAppointment" style="margin: 30px; padding: 20px;">
                    <div class="form-group">
                        <label for="inputFieldName">场地编号</label>
                        <input type="text" class="form-control" id="inputFieldId" placeholder="" name="fid" readonly>
                    </div>
                    <div class="form-group">
                        <label for="inputFieldName">场地名</label>
<%--                        <input type="text" class="form-control" id="inputFieldName" placeholder="" readonly>--%>
                        <select id="inputFieldName" class="form-control" >

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputFieldName">场地类型</label>
                        <input type="text" class="form-control" id="inputFieldType" placeholder="" readonly>
                    </div>
                    <div class="form-group">
                        <label >使用类型</label>
                        <input type="text" class="form-control" id="inputFieldUseType" placeholder="" readonly>
                    </div>

                    <div class="form-group">
                        <label >地址</label>
                        <input type="text" class="form-control" id="inputFieldSize" placeholder=""readonly>
                    </div>

                    <div class="form-group">
                        <label >预约号</label>
                        <input type="text" class="form-control" id="appId" placeholder="" name="id" readonly >
                    </div>

                    <div class="form-group">
                        <label >预约人学(工)号</label>
                        <input type="text" class="form-control" id="appUid" placeholder="" name="uWid" >
                    </div>
                    <div class="form-group">
                        <label >预约类型</label>
                        <select id="appType" class="form-control" name="type">
                            <option>普通预约</option>
                            <option>赛事预约</option>
                        </select>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading panel-inner">预约时间</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label >周数</label>
                                <select id="appWeek" class="form-control" name="week">
<%--                                    <option value="1">1</option>--%>
<%--                                    <option value="2">2</option>--%>
<%--                                    <option value="3">3</option>--%>
<%--                                    <option value="4">4</option>--%>
<%--                                    <option value="5">5</option>--%>
<%--                                    <option value="6">6</option>--%>
<%--                                    <option value="7">7</option>--%>
<%--                                    <option value="8">8</option>--%>
<%--                                    <option value="9">9</option>--%>
<%--                                    <option value="10">10</option>--%>
<%--                                    <option value="11">11</option>--%>
<%--                                    <option value="12">12</option>--%>
<%--                                    <option value="13">13</option>--%>
<%--                                    <option value="14">14</option>--%>
<%--                                    <option value="15">15</option>--%>
<%--                                    <option value="16">16</option>--%>
<%--                                    <option value="17">17</option>--%>
<%--                                    <option value="18">18</option>--%>
<%--                                    <option value="19">19</option>--%>
<%--                                    <option value="20">20</option>--%>
                                </select>
                            </div>
                            <div class="form-group">
                                <select id="appDay" class="form-control" name="day">
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
                                <select id="appHours" class="form-control" name="hours">
                                    <option class="t_hours">8:00-10:00</option>
                                    <option class="t_hours">10:00-12:00</option>
                                    <option class="t_hours">14:00-16:00</option>
                                    <option class="t_hours">16:00-18:00</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label >备注(赛事信息)</label>
                        <textarea class="form-control" id="appsRemark" rows="3" name="remark"></textarea>
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


    $(function(){
        let thisWeekText = thisWeek+"周"
        let nextWeek = thisWeek+1;
        let nextWeekText = nextWeek+"周"

        for (let i =thisWeek;i<=20;i++){
            $("#appWeek").append('<option value="' + i + '" >' + i + '</option>');
        }


        <%--$.ajax({--%>
        <%--    url:"../field/findAllFieldName",--%>
        <%--    contentType:"application/json;charset=UTF-8",--%>
        <%--    data:'{"fieldType":"羽毛球场"}',--%>
        <%--    dataType:"json",--%>
        <%--    type:"post",--%>
        <%--    success:function(data){--%>
        <%--        alert(data.week)--%>
        <%--        let allField = '${aField}'--%>
        <%--        $(allField).each(function() {--%>
        <%--            $("#inputFieldNam").append('<option value="' + this.fieldName + '" >' + this.fieldName + '</option>');--%>
        <%--        });--%>
        <%--    }--%>
        <%--});--%>


        let allField = ${aField};
        $(allField).each(function() {
            $("#inputFieldName").append('<option value="' + this.fieldName + '" >' + this.fieldName + '</option>');
        });
        $("#inputFieldId").val('${tApp.field.id}');
        $("#inputFieldName").val('${tApp.field.fieldName}');
        $("#inputFieldType").val('${tApp.field.fieldType}');
        $("#inputFieldUseType").val('${tApp.field.useType}');
        $("#inputFieldSize").val('${tApp.field.size}');
        $("#appId").val('${tApp.id}')
        $("#appUid").val('${tApp.uWid}')
        $("#appType").val('${tApp.type}')
        $("#appWeek").val('${tApp.week}');
        $("#appDay").val('${tApp.day}')
        $("#appHours").val('${tApp.hours}')
        $("#appsRemark").val('${tApp.remark}')


        <%--let apps = ${thisField.appointments};--%>
        <%--for(let i=0;i<("${thisField.appointments}".length);i++){--%>
        <%--    alert("${thisField.appointments}"[i].type);--%>
        <%--}--%>
        <%--$.each('${thisField.appointments}',function (i,item) {--%>
        <%--    alert(item.fid);--%>
        <%--});--%>
        // --筛选星期时间
        let cutFirst;
        let cutEnd;
        let thisFieldApps;
        function fieldChange(){
            $("#appDay").empty();
            $("#appDay").append("<option value='1' >周一</option>");
            $("#appDay").append("<option value='2' >周二</option>");
            $("#appDay").append("<option value='3' >周三</option>");
            $("#appDay").append("<option value='4' >周四</option>");
            $("#appDay").append("<option value='5' >周五</option>");
            $("#appDay").append("<option value='6' >周六</option>");
            $("#appDay").append("<option value='7' >周日</option>");

            $(allField).each(function() {
                if(this.fieldName ==$("#inputFieldName").val() ){
                    thisFieldApps = this.appointments;
                    $("#inputFieldId").val(this.id);
                    $("#inputFieldName").val(this.fieldName);
                    $("#inputFieldType").val(this.fieldType);
                    $("#inputFieldUseType").val(this.useType);
                    $("#inputFieldSize").val(this.size);
                    cutFirst = this.beginDay-1+1;
                    cutEnd = 7-this.endDay;
                    if(cutFirst>1){
                        $("#appDay option[value='1']").remove();
                        if (cutFirst>2){
                            $("#appDay option[value='2']").remove();
                            if(cutFirst>3){
                                $("#appDay option[value='3']").remove();
                                if (cutFirst>4){
                                    $("#appDay option[value='4']").remove();
                                    if (cutFirst>5){
                                        $("#appDay option[value='5']").remove();
                                        if (cutFirst>6){
                                            $("#appDay option[value='6']").remove();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            });
            for (let i=1;i<=cutEnd;i++){

                $("#appDay option:last").remove();
            }
        }
        fieldChange();

        $("#inputFieldName").change(function(){
            fieldChange();
        })

        // for(let i=1;i<cutFirst;i++){
        //     $("#appDay option[value=i]").remove();
        // }
        let checkVal;
        let appWeek;

        function changeHours(theHour){
            $(".t_hours").each(function(){
                if($(this).text()==theHour){
                    $(this).remove();
                }
            })
        }

        $("#appDay").change(function(){
            appWeek = $("#appWeek").val()
            $("#appHours").empty();
            $("#appHours").append("<option class='t_hours'>8:00-10:00</option>");
            $("#appHours").append("<option class='t_hours'>10:00-12:00</option>");
            $("#appHours").append("<option class='t_hours'>14:00-16:00</option>");
            $("#appHours").append("<option class='t_hours'>16:00-18:00</option>");
            $(thisFieldApps).each(function() {
                checkVal = $("#appDay").val();
                if(checkVal ==this.day && appWeek ==this.week){
                    changeHours(this.hours)
                }
            });


        });

    });



    $("#appEditForm").submit(function () {
        if ($("#appUid").val() == ""){
            alert("你必须填写预约人学(工)号。");
            return false;
        }else {
            if(window.confirm('你确定要修改该预约吗？')){
                //点击确定的操作
                alert("添加预约成功")
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
