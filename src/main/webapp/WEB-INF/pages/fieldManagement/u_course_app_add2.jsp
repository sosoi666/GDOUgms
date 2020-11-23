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
                        <li><a id="userId" href="#">${user.student_workedid}</a></li>
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
            <ul class="children collapse in" id="sub-item-1">
                <li>
                    <a href="../field/findAllFieldTMatch">
                        赛事场地申请
                    </a>
                </li>
                <li>
                    <a class="active" class="" href="../field/findAllFieldTCourse">
                        教师上课场地申请
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent">
            <a href="#sub-item-2" data-toggle="collapse">
                个人中心
            </a>
            <ul class="children collapse" id="sub-item-2">
                <li>
                    <a href="../field/findMyAppointment?uid=${user.student_workedid}">
                        我的预约
                    </a>
                </li>
                <li>
                    <a class="" href="../field/findMyAllApp?uid=${user.student_workedid}">
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
            <li class="active">上课场地申请</li>
        </ol>
    </div><!--/.row-->








    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">场地申请</h1>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <form id="addCourseAppForm" action="../field/addCourseApp" style="margin: 30px; padding: 20px;">
                    <div class="form-group">
                        <label for="inputFieldName">场地编号</label>
                        <input type="text" class="form-control" id="inputFieldId" placeholder="" name="fid" readonly>
                    </div>
                    <div class="form-group">
                        <label for="inputFieldName">场地名</label>
                        <input type="text" class="form-control" id="inputFieldName" placeholder="" readonly>
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
                        <label >预约人学(工)号</label>
                        <input type="text" class="form-control" id="inputuid" placeholder="" name="uWid" readonly >
                    </div>
                    <div class="form-group">
                        <label >预约类型</label>
                        <input type="text" class="form-control" id="inputType" value="上课预约" placeholder="" name="type" readonly >
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading panel-inner">预约时间</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label >周数(从当前时间后二周开始申请至期末)：</label>
                                <input type="text" class="form-control" id="nextWeek" placeholder="" name="week" readonly>
                                <label >~</label>
                                <input type="text" class="form-control" placeholder="" value="20" readonly>
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
                        <label >备注(课程号信息)</label>
                        <textarea class="form-control" id="appRemark" rows="3" name="remark"></textarea>
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
        $("#inputFieldId").val('${thisField.id}');
        $("#inputFieldName").val('${thisField.fieldName}');
        $("#inputFieldType").val('${thisField.fieldType}');
        $("#inputFieldUseType").val('${thisField.useType}');
        $("#inputFieldSize").val('${thisField.size}');
        $("#nextWeek").val(nextWeek+1);
        $("#inputuid").val($("#userId").text());

        <%--let apps = ${thisField.appointments};--%>
        <%--for(let i=0;i<("${thisField.appointments}".length);i++){--%>
        <%--    alert("${thisField.appointments}"[i].type);--%>
        <%--}--%>
        <%--$.each('${thisField.appointments}',function (i,item) {--%>
        <%--    alert(item.fid);--%>
        <%--});--%>

        let cutFirst ='${thisField.beginDay}'-1+1;
        let cutEnd = 7-'${thisField.endDay}';
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
        // for(let i=1;i<cutFirst;i++){
        //     $("#appDay option[value=i]").remove();
        // }
        for (let i=1;i<=cutEnd;i++){

            $("#appDay option:last").remove();
        }




    });

    let checkVal

    $("#addCourseAppForm").submit(function () {
        if ($("#inputuid").val() == "" ||$("#appRemark").val() == ""){
            alert("你必须填写预约人学(工)号和备注信息。");
            return false;
        }else {
            if(window.confirm('你确定要申请该场地吗？')){
                //点击确定的操作
                alert("申请成功")
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
