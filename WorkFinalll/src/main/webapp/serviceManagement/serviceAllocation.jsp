<%@ page import="javax.naming.Context" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>服务分配</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <script type="text/javascript" src="../js/layer.js"></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../serviceManagement/css/serviceAllocation.css" />

    <!--加载所有得状态为未分配的服务记录-->
    <script type="text/javascript">

        //  多条件查询
        $(function () {
            $("#find").click(function () {
                $("#message tr:gt(0)").remove();
                var serviceId = $("#serviceId").val();
                var cusName = $("#cusName").val();
                var serviceType = $("#serviceType").val();
                var curr =1 ;
                $.get("${pageContext.request.contextPath}/service/servicepage.action",{currentPageNo:curr,serviceId:serviceId,cusName:cusName,serviceType:serviceType,serviceState:"新创建",managerId:null},function (data) {

                    ch(data.data) ;
                    layui.use(['laypage', 'layer'], function () {
                        var laypage = layui.laypage
                                , layer = layui.layer;
                        laypage({
                            cont: 'demo1'
                            , pages: data.pageSize
                            , skip: true,
                            curr: curr || 1,
                            //触发分页后的回调
                            jump: function (obj, first) {
                                //点击跳页触发函数自身，并传递当前页：obj.curr
                                if (!first) {
                                    $("#message tr:gt(0)").remove();
                                    getCurrentpage(obj.curr);
                                }
                            }
                        });
                    });
                })
            })
        })

        //拼接数据
        function ch(data) {
            if(data.length==0){
                layer.confirm('没有符合相关条件的服务信息', {
                    icon: 6,
                    btn: ['确定'] //按钮
                })
            }
            var tr = "<tr>" ;
            $(data).each(function(i,obj){
                var td =
                    "<td style='width: 100px'>" + obj.serviceId + "</td>" +
                    "<td style= 'width: 90px'>" + obj.cusName + "</td>" +
                    "<td  >" + obj.serviceOutline + "</td>" +
                    "<td style= 'width: 60px'>" + obj.serviceType + "</td>" +
                    "<td style= 'width: 60px'>" + obj.serviceCreateUser + "</td>" +
                    "<td style= 'width: 140px'>" +formatDateTime(obj.serviceCreateTime)+ "</td>" +
                    "<td style= 'width: 90px'>" +" <a href='<%=request.getContextPath()%>/service/servicealloService.action?serviceId="+obj.serviceId+"' class='layui-btn layui-btn-primary layui-btn-small'><i class='layui-icon'>&#xe642;</i></a>" +
                    '<a  onclick="dele(this)" class="layui-btn layui-btn-primary layui-btn-small"><i class="layui-icon">&#xe640;</i></<a>' + "</td>";
                    tr = tr + td + "</tr>"
            });
            $("#message").append(tr) ;
        }

        //    分页
        window.onload=function () {
            getCurrentpage(1);
        }

        function getCurrentpage(curr) {
            var serviceId = $("#serviceId").val() ;
            var cusName = $("#cusName").val() ;
            var serviceType = $("#serviceType").val() ;
            $.get("${pageContext.request.contextPath}/service/servicepage.action",{currentPageNo:curr,serviceId:serviceId,cusName:cusName,serviceType:serviceType,serviceState:"新创建",managerId:null},function (data) {
                ch(data.data);
                layui.use(['laypage', 'layer'],function () {
                    var laypage = layui.laypage
                        ,layer = layui.layer;
                    laypage({
                        cont: 'demo1'
                        ,pages: data.pageSize
                        ,skip: true,
                        curr: curr || 1,
                        //触发分页后的回调
                        jump: function (obj, first) {
                            //点击跳页触发函数自身，并传递当前页：obj.curr
                            if (!first) {
                                $("#message tr:gt(0)").remove();
                                getCurrentpage(obj.curr);
                            }
                        }
                    });
                })
            }) ;
        }

        //  分页显示后信息的删除
        function dele(a) {
            var id=$(a).parents("tr").find("td:eq(0)").text();
            layer.confirm('是否确定删除？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                $.ajax({
                    type:"get",
                    url:"<%=request.getContextPath()%>/service/servicedelete.action",
                    data:{serviceId:id},
                    success:function (datas) {
                        $("#message tr:gt(0)").remove();
                        getCurrentpage(1);
                    }
                })
                layer.msg('删除成功', {icon: 1});
            }, function(){

            });
        };
        //  时间戳
        function formatDateTime(inputTime) {
            var date = new Date(inputTime);
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? ('0' + m) : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            var h = date.getHours();
            h = h < 10 ? ('0' + h) : h;
            var minute = date.getMinutes();
            var second = date.getSeconds();
            minute = minute < 10 ? ('0' + minute) : minute;
            second = second < 10 ? ('0' + second) : second;
            return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
        };

        //获取服务类型
        $(function () {
            $.get("<%=request.getContextPath()%>/service/servicefindAllselect.action?message=服务类型",{},function (type) {
                //接收并显示服务类型
                $(type).each(function (i,obj) {
                    var option = "<option value="+'"'+obj.entry+'"'+">"+obj.entry+"</option>";
                    $("#serviceType").append(option);
                })
            })
        })
    </script>

</head>
<body>
<div id="main">
    <div>
        <span style="color: black;">客户服务管理 ></span>
        <span style="color: black;">服务分配</span>
    </div>
<form>
    <div class="layui-btn-group globalHight">
        <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a class="layui-btn" id="find" lay-submit  lay-filter="formDemo">查询</a>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>编号</td>
                <td>
                    <input   class="text1" name="serviceId" id="serviceId"  type="text" placeholder="请输入编号">
                </td>
                <td>客户</td>
                <td>
                    <div style="position: relative">
                        <input  id="cusName" name="service.cusName" placeholder="请输入要查询的客户名称"class="text1" type="text"/>
                        <%--自动提示--%>
                        <div id="searchList" style="position: absolute ; z-index: 2 ; background-color: white ;width: 90%">
                            <ul id="searchList_ul">
                            </ul>
                        </div>
                    </div>
                </td>

                <script type="text/javascript">
                    //  模糊查询
                    // 绑定键盘按下并松开事件
                    $('#cusName').bind('keyup', function() {
                        $("#searchList_ul").empty();
                        var text=$.trim($(this).val());
                        if(text!=""){
                            $.get("<%=request.getContextPath()%>/service/serviceselectCus.action",{cusName:text},function(data) {
                                if($.isEmptyObject(data)){
                                }else {
                                    $(data).each(function (i, obj) {
                                        var tr = "<li>";
                                        //   如果有相关的自动提示就显示
                                        var td = "<a   title='" + obj + "'href='#' value='"+obj+"'  onclick='fu(this)'>" + obj + "</a>";
                                        tr = tr + td + "</li>";
                                        $("#searchList_ul").append(tr);
                                    })
                                }
                            })
                        }
                    });

                    //    点击自动提示结果中的某一条，将其内容填充到搜索框中
                    function fu(t) {
                        var v=$(t).attr("title");
                        $("#cusName").val(v);
                        $("#cusName").val($(t).attr("value"))
                        $("#searchList_ul").empty();
                    }
                    //  帮助按钮
                    function  help() {
                        //示范一个公告层
                        layer.open({
                            type: 1,
                            title: false, //不显示标题栏
                            closeBtn: false,
                            area: ['650px', '450px'],
                            shade: 0.8,
                            resize: true,
                            id: 'LAY_layuipro', //设定一个id，防止重复弹出
                            btn: ['好啦，我知道啦'],
                            moveType: 0,//拖拽模式，0或者1
                            content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/serviceAllocation.png" style="width:620px;height:350px"></div>',
                            success: function (layero) {
                                var btn = layero.find('.layui-layer-btn');
                                btn.css('text-align', 'center');
                                btn.find('.layui-layer-btn0').attr({
                                    target: '_blank'
                                });
                            }
                        });
                    }

                </script>

                <td>服务类型</td>
                <td>
                    <select id="serviceType" name="serviceType" style="display: block">
                        <%--<option value="">咨询</option>--%>
                        <option value="" selected="">全部</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>
    </form>
        <table id="message" class="layui-table">
            <thead>
            <tr>
                <td class="thd" >编号</td>
                <td class="thd">客户</td>
                <td class="thd">概要</td>
                <td class="thd">服务类型</td>
                <td class="thd">创建人</td>
                <td class="thd">创建日期</td>
                <td class="thd">操作</td>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    <div style="padding-left: 480px;" id="demo1"></div>

</div>
</body>
</html>
