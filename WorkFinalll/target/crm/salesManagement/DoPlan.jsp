<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>
    <title>执行计划</title>

    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/lay/modules/layer.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="/CRM/salesManagement/css/DoPlan.css">
    <link rel="stylesheet" href="../plugins/layui/css/modules/layer/default/layer.css">

    <script type="text/javascript">
        $(function () {
            $.get("/CRM/plan/planfindBySalesId.action",function (data) {
                var table = $("#planTable");
                var tr = "<tr>";
                $(data).each(function (i,obj) {

                    var mydate = new Date(obj.planTime);
                    //获得当前时间

                     var myDate = new Date();

                    var date = mydate.getFullYear() + "-" + (mydate.getMonth() + 1) + "-" + mydate.getDate();

                    var nowtime=myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate();

                       if(date==nowtime)  {

                           var resul = obj.planResult;

                           if(!obj.planResult||obj.planResult===""){
                               resul = "暂未编辑";
                           }

                           var td = "<td style='display: none'>"+ obj.planId +"</td>"+
                                   "<td>" + date +
                                   "<td>" + obj.planPro +
                                   "<td colspan='2'>" +
                                   "<input type='text' id='"+obj.planId+"' class='layui-input' value='" + resul + "'/>"+
                                   "<shiro:hasPermission name='plan:update'><button type='button' class='layui-btn doplanwidth' onclick='modify("+obj.planId+")'>保存</button></shiro:hasPermission></td>"

                           tr = tr + td + "</tr>"
                       }

                });
                table.append(tr);
            });
        });

        //修改
        function modify(x) {
            var planResult = b(x);
            $.get("/CRM/plan/planmodify.action",{planId:x,planResult:planResult},function (data) {
                layer.msg('保存成功',{icon:6})
            });
        }

        function b(a){
            var va = document.getElementById(a).value;
            return va;
        }

        function getRootPath_web() {
            //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
            var curWwwPath = window.document.location.href;
            //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
            var pathName = window.document.location.pathname;
            var pos = curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht = curWwwPath.substring(0, pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
            return (localhostPaht + projectName);
        }

        function del(a) {

            layer.confirm('确定要终止开发！', {
                        btn: ['确定', '取消'] //按钮
                    }, function () {
                        var id =${sales.salesId};
                        $.get("/CRM/sales/salesdelete.action", {salesId: id}, function (data) {
                            window.location.href = getRootPath_web() + "/salesManagement/CustDist.jsp";
                        })
                    }
            );
        }
        ;
    </script>
</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a href="">客户开发计划 ></a>
            <a href="">执行计划</a>
            </span>
        <div class="layui-btn-group">
            <button type="button" class="layui-btn">帮助</button>
            <shiro:hasPermission name="plan:fail">
                <button type="button" class="layui-btn" onclick="del(this)">终止开发</button>
            </shiro:hasPermission>
            <a href="/CRM/salesManagement/CustDist.jsp"><button type="button" class="layui-btn">返回</button></a>
            <shiro:hasPermission name="plan:suss">
                <a href="/CRM/customer/custSave.jsp"><button type="button" class="layui-btn">开发成功</button></a>
            </shiro:hasPermission>

        </div>

        <form id="NewSale" action="" method="post">
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="200">
                    <col width="350">
                    <col width="200">
                    <col width="350">
                </colgroup>

                <tbody>
                <tr id="rowOne">
                    <td class="td1">编号</td>
                    <td class="td1" id="sale">
                        ${sales.salesId}
                    </td>
                    <td class="td1">机会来源</td>
                    <td class="td1">
                        ${sales.oppSource}
                    </td>
                </tr>
                <tr>
                    <td class="td1">客户名称</td>
                    <td class="td1">
                        ${sales.cusName}
                    </td>
                    <td class="td1">成功机率(%)</td>
                    <td class="td1">
                        ${sales.succRate}
                    </td>
                </tr>
                <tr>
                    <td class="td1">概要</td>
                    <td colspan="3" class="td1">
                        ${sales.outLine}
                    </td>
                </tr>
                <tr>
                    <td class="td1">联系人</td>
                    <td class="td1">
                        ${sales.linkName}
                    </td>
                    <td class="td1">联系人电话</td>
                    <td class="td1">
                        ${sales.linkPhone}
                    </td>
                </tr>
                <tr>
                    <td class="td1">机会描述</td>
                    <td colspan="3" class="td1">
                        ${sales.oppDesc}
                    </td>
                </tr>
                <tr>
                    <td class="td1">创建人</td>
                    <td class="td1">
                        ${sales.creatMan}
                    </td>
                    <td class="td1">创建时间</td>
                    <td class="td1">
                        ${sales.creatTime}
                    </td>
                </tr>
                <tr style="margin-top: 10px">
                    <td class="td2">指派给</td>
                    <td class="td1">
                        ${sales.giveMan}
                    </td>
                    <td class="td2">指派时间</td>
                    <td class="td1">
                        ${sales.giveTime}
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="layui-table" id="planTable">
                <colgroup>
                    <col width="200">
                    <col width="450">
                    <col width="150">
                    <col width="300">
                </colgroup>
                <tbody>
                <tr>
                    <td>日期</td>
                    <td>计划</td>
                    <td colspan="2">执行效果</td>
                </tr>
                </tbody>
            </table>
        </form>

    </div>
</div>

</body>
</html>
