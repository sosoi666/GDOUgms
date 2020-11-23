<%--
  Created by IntelliJ IDEA.
  User: q1289
  Date: 2020/6/17
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="showMsg"></div>
    <button id="toShow">点击我，使用Ajax</button>
    <script src="js/user/JQuer_3.4.1.js"></script>
    <script>
        $(function () {
            $("#toShow").click(function () {
                $.ajax({
                    url:"test/ajax2",
                    contentType:"application/json;charset=UTF-8",
                    // data:'{"roleid":5}',
                    dataType:"JSON",
                    type:"post",
                    success:function (data) {
                        // alert(data);
                        // alert(data[0].student_workedid);
                        // alert(data.student_workedid);
                        alert(data.msg);
                    }
                })

            });
        })
    </script>
</body>
</html>
