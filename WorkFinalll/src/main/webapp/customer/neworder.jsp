<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户信息</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/editRecordCommuniction.css" />
    <script type="text/javascript">
        layui.use('layer', function(){
            var layer = layui.layer;

        });
        var i=1;
         function fun() {

             var  bbb="goodsNo"+i;
            var price=$("#pro_prices"+i+"").val();
            if(price!=""){
          i++;
                $("#goodsnum").val(i);
          var tr=$("pro_con");

            $("#tbody2").append(" <tr><td><select name="+bbb +"  id="+"pro_name"+i+" style='display: block'></select></td><td><input type='text' id="+"pro_num"+i+" /></td><td><select style='display: block'><option>台</option><option>辆</option></select></td><td><input type='text'  id="+"pro_price"+i+" /></td><td><input type='text'  onmouseup='count_pri()' id="+"pro_prices"+i+" /></td> <td><a onclick='fun()'><i class='layui-icon' style='color: #01AAED;font-size: 30px'>"+"&#xe61f;"+"</i></a></td></tr>");;
                before();
                s();

                dianji();
            }else{
                alert("此种商品还未结算");
            }

        }

        function count_pri() {
//            alert(i);
//            alert(11);

            var num=$("#pro_num"+i+"").val();
//            alert(num);
            var price=$("#pro_price"+i+"").val();
//            alert(price);
            if(num==""||price==""){
                alert("请输入单价和数量");
            }else{
                var csum=parseInt(price)*parseInt(num);
                $("#pro_prices"+i+"").val(csum);
                var sum_price=0;
                for(var j=1;j<=i;j++){
                    var csum1= $("#pro_prices"+j+"").val();
                    sum_price=parseInt(sum_price)+ parseInt(csum1);

                }

                $("#sum_price").html("￥"+parseInt(sum_price));
            }

        }

        //xianshisuoyousahngpinde
        function s() {
            $.get("goodslist.action",function (data) {
                $(data).each(function(j,obj) {
                    $("#pro_name" + i + "").append("<option value="+obj.goodsNo+">"+obj.goodsName+"</option>");
                })
            })
        }
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });
            $.get("goodslist.action",function (data) {
//                alert(data);
//                $("#pro_price1").val(data.goodsPrice);
                $(data).each(function(j,obj) {
//                    alert(obj.goodsName);
                    $("#pro_name" + i + "").append("<option  value="+obj.goodsNo+">"+obj.goodsName+"</option>");
                })
            })

        })


        //        //帮助按钮弹出框方法
        function  help() {
            //示范一个公告层
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: ['1400px', '600px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_neworder.png" ></div>'
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


//        $(function () {
//            $("#save1").click(function () {
//                var form=$("#form1").serialize()
////                alert(form);
//            })
//
//        });

        //表单验证方法
        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form()
                    ,layer = layui.layer
                    ,layedit = layui.layedit
                    ,laydate = layui.laydate;

            form.verify({
                addr: [
                    /^[\S]{0,25}$/
                    ,'最多输入25个字'
                ]

                , ttt: [
                /^100$|^(\d|[1-9]\d)$/
                ,'数量不可以超过100……'
            ]

        });

        });

    </script>

</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">客户信息管理 ></a>
		  <a href="">客户信息 ></a>
            <a href="">历史订单 ></a>
            <a href="">新建历史订单 ></a>
		</span>
    </div>
    <form  class="layui-form" action="ordersbaocun.action" method="get" id="form1">
        <%--//选择按钮--%>
        <div class="layui-btn-group globalHight">
            <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
            <a class="layui-btn"href="orderslist.action?id=${id}">返回</a>
            <button class="layui-btn" lay-submit  id="save1">保存</button>
        </div>
        <%--表格--%>

        <div>
            <%--表一+++++++++++++--%>
            <table class="layui-table">
                <colgroup>
                    <col class="tit">
                    <col class="content">
                    <col class="tit">
                    <col class="content">
                </colgroup>
                <tr>
                    <td>订单编号</td>
                    <td>
                        <label>自动生成</label>
                    </td>
                    <td>日期</td>
                    <td>
                        <input type="hidden" name="goodsnum" id="goodsnum" lay-verify="required">
                        <input type="date" name="order.orderTime" >
                        <span>*</span>
                    </td>
                </tr>
                <tr>
                    <td>客户编号</td>
                    <td>
                        <input name="order.orderCusNo" value="${customer.cusId}" readonly>
                        <input type="hidden" name="id" value="${customer.id}"  />

                    </td>
                    <td>客户名称</td>
                    <td>
                        <input name="order.orderCusName" value="${customer.cusName}" readonly>
                    </td>
                </tr>
                <tr>
                    <td>送货地址</td>
                    <td>
                        <input type="text" name="order.orderAddr"  lay-verify="required|addr"/>
                        <span>*</span>

                    </td>
                    <td>状态</td>
                    <td>
                        <select name="order.orderStatic" style='display: block'>
                            <option value="已付款">已付款</option>
                            <option value="未付款">未付款</option>
                        </select>
                        <span>*</span>
                    </td>
                </tr>
            </table>
            <%--表二=================--%>
                <div>
                    <table class="layui-table" id="pro_table">
                        <thead>
                        <tr>
                            <td style="width: 20%;">商品</td>
                            <td style="width: 10%;">数量</td>
                            <td style="width: 10%;">单位</td>
                            <td style="width: 10%;">单价（元）</td>
                            <td style="width: 10%;">金额（元）</td>
                            <td style="width: 10%;">状态</td>
                        </tr>
                        </thead>
                        <tbody id="tbody2">
                        <tr id="pro_con">
                            <td><select id="pro_name1" name="goodsNo0" style="display: block"></select></td>
                            <td><input type="text" id="pro_num1"   lay-verify="required|ttt"/></td>
                            <td><select style="display: block">
                                <option>台</option>
                                <option>架</option>
                                <option>辆</option>
                            </select ></td>
                            <td><input type="text" id="pro_price1"/></td>
                            <td><input type="text" id="pro_prices1" onMouseUp="count_pri()" name="order.orderMoney" /></td>
                            <td><a onclick="fun()"><i class="layui-icon" style="color: #01AAED;font-size: 30px">&#xe61f;</i></a></td>
                        </tr>
                        </tbody>
                    </table>
                    <div STYLE="width: 1000px;margin: 0 auto;">
                   <span style="background-color:#1AA094;color:white;text-align: center;font-size:16px;display: block;float:right;width: 20%;height: 40px;line-height: 40px;text-align: center">总金额：<span id="sum_price" style="color: white"></span></span>
                    </div>
                </div>

        </div>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        $("#pro_name" + i + "").change(function () {
//            alert(i);
            var pro_name=$("#pro_name" + i + "").val();
//            alert(pro_name);
            $.get("goodslist.action",function (data) {
                      $(data).each(function(j,data) {
                    if(pro_name==data.goodsNo){
//                        alert(data.goodsName);
                        $("#pro_price"+i+"").val(data.goodsPrice);

                    }
                })


//                    $(data).each(function(j,obj) {
//                        $("#pro_name" + i + "").append("<option value="+obj.goodsNo+">"+obj.goodsName+"</option>");
//                    })
            })

        })

    })

    function dianji() {
        $("#pro_name" + i + "").change(function () {
//            alert(i);
            var pro_name=$("#pro_name" + i + "").val();
//            alert(pro_name);
            $.get("goodslist.action",function (data) {
                $(data).each(function(j,data) {
                    if(pro_name==data.goodsNo){
//                        alert(data.goodsName);
                        $("#pro_price"+i+"").val(data.goodsPrice);

                    }
                })


//                    $(data).each(function(j,obj) {
//                        $("#pro_name" + i + "").append("<option value="+obj.goodsNo+">"+obj.goodsName+"</option>");
//                    })
            })

        })


    }
    //设置前一行的属性为只读
    function before() {
        var s=parseInt(i);
//        alert(s-1);
//        $("#pro_name" +(s-1) + "").prop("readonly",true);
        $("#pro_name" +(s-1) + "").focus(function(){
            $(this).attr('defaultIndex',$(this).attr('selectedIndex'));
        });
        $("#pro_name" +(s-1) + "").change(function(){
            $(this).attr('selectedIndex',$(this).attr('defaultIndex'));
        });
        $("#pro_num" +(s-1) + "").prop("readonly",true);
        $("#pro_price" +(s-1) + "").prop("readonly",true);
        $("#pro_prices" +(s -1) + "").prop("readonly",true);
    }
</script>
</body>
</html>
