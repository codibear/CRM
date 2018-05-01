<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/9
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报价创建</title>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../quotationManagement/css/newQuotation.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<div id="main">
    <div>
        <span>
		  <a href="">客户服务管理 ></a>
		  <a href="">报价创建 </a>
		</span>
    </div>
    <form class="layui-form" action="<%=request.getContextPath()%>/quotation/pageselect.action" method="post" >
        <div class="layui-btn-group globalHight">
            <button data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</button>
            <button class="layui-btn" lay-submit  lay-filter="formDemo">下一步</button>
        </div>

        <div id="word">
            欢迎进入报价新建页面，请输入要新建报价的订单的订单编号！！
        </div>
        <div>
            <table class="layui-table" style="width: 30%;height: 200px;margin-left: 400px;margin-top:60px;">
                <tr>
                    <td>订单编号</td>
                    <td>
                        <input type="text" id="search" name="orderId" placeholder="请输入订单编号" required lay-verify="required" autocomplete="off"/>
                        <%--自动提示--%>
                        <div id="searchList" style="overflow:auto;width:175px;height: 60px; position: absolute;z-index: 2 ;width: 175px">
                            <ul id="searchList_ul" style="background: white" >
                            </ul>
                        </div>
                    </td>
               </tr>
                <tr>
                    <td></td>
                    <td>
                        <button class="layui-btn" lay-submit >下一步</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    function  help() {
        //示范一个公告层
        layer.open({
            type: 1
            ,
            title: false //不显示标题栏
            ,
            closeBtn: false
            ,
            area: ['650px', '450px']
            ,
            shade: 0.8
            ,
            resize: true
            ,
            id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,
            btn: ['好啦，我知道啦']
            ,
            moveType: 0//拖拽模式，0或者1
//                        ,content: '<img src="../images/help_cusManage.png" >'
            ,
            content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/报价创建.png" style="width:620px;height:350px"></div>'
            ,
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                btn.find('.layui-layer-btn0').attr({
                    target: '_blank'
                });
            }
        });
    }
    // 绑定键盘按下并松开事件
    $('#search').bind('keyup', function() {
        $("#searchList_ul").empty();
        var text=$.trim($(this).val());
        if(text!=""){
            $.post("<%=request.getContextPath()%>/quotation/pagesearch.action",{orderId:text},function(data) {
                if($.isEmptyObject(data)){
//                    alert("没有此订单！！请确认您输入的订单编号是否正确！")
                    layer.confirm('没有此订单,或已存在此报单！', {
                        icon:6,
                        btn: ['确定'] //按钮
                    });
                    $("#search").val("");
                }else {
                    $(data).each(function (i, obj) {
                        var tr = "<li>";
//                    如果有相关的自动提示就显示
                        var td = "<a   title='" + obj.orderId +
                                "'href='#'   onclick='fu(this)'>" + obj.orderId + "</a>";
                        tr = tr + td + "</li>";
                        $("#searchList_ul").append(tr);
//                        document.getElementById("searchList_ul").style.background("red");
                    })
                }

             })
        }
    });
    //    点击自动提示结果中的某一条，将其内容填充到搜索框中
    function fu(t) {
        var v=$(t).attr("title");
        $("#search").val(v);
        $("#orderId").val($(t).attr("value"))
        $("#searchList_ul").empty();
//        document.getElementById("searchList_ul").style.background("red");
    }

</script>
</html>
