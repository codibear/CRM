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
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../customer/css/custInformation.css"/>
    <script type="text/javascript" >
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                });
            });
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
                area: ['1400px', '500px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_custInformation.png" ></div>'
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


        //表单验证方法
        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form()
                    ,layer = layui.layer
                    ,layedit = layui.layedit
                    ,laydate = layui.laydate;

            form.verify({

                //资金的验证方法
                money2: function(value, item) {
                    if (value=="") {
                    }else{
                        if (!new RegExp("^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$").test(value)) {
                            return '整数位最多十位，小数为最多为两位，可以无小数位';
                        }
                    }


                }

                //邮箱的验证方法
                ,biz: [
                    /^[\S]{6,6}$/
                    ,'邮编必须是6位，且不能出现空格'
                ]

                //银行账号的验证方法
                ,bankAccount: [
                    /\d{15}|\d{19}/
                    ,'请输入正确的银行账号'
                ]

                //传真的验证方法
                ,fax: [
                        /^(\d{3,4}-)?\d{7,8}$/
                    ,'传真必须是6位，且不能出现空格'
                    ]
                 });

        });
        //客户等级显示
        $(function () {
            $.get("customerfindEntry.action",function (data) {
                var type = $("#level") ;
                $(data).each(function(i,obj){
                    var td = "<option value='"+ obj.entry +"'>" + obj.entry + "</option>";
                    type.append(td) ;
                });

            }) ;})
        $(function () {
            //客户经理显示
            $.get("customerfindUser.action",function (data) {
                var username = $("#city") ;
                $(data).each(function(i,obj){
                    var td = "<option value='"+ obj.userId +"'>" + obj.userName + "</option>";
                    username.append(td) ;
                });

            }) ;
        })


    </script>
</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">客户信息管理 ></a>
		  <a href="">客户信息 ></a>
		</span>
    </div>
        <form class="layui-form" action="customermodify.action" method="get">
            <div class="layui-btn-group globalHight">
                    <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
                <a class="layui-btn" type="button" href="cstLinkmanload2.action?id=${id}"> 联系人</a>
                    <a class="layui-btn"  type="button"href="cstConlist.action?id=${id}">交往记录</a>
                    <a class="layui-btn" type="button" href="orderslist.action?id=${id}">历史订单</a>
                   <a  class="layui-btn" type="button"href="custManage.jsp">返回</a>
                    <button class="layui-btn"   lay-submit  lay-filter="formDemo"  id="cust_save">保存</button>
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
                        <th>客户编号</th>
                        <th>
                            <input type="hidden" value="${id}" name="customer.id" />
                            <input type="text" name="customer.cusId" readonly="true" value="${customer.cusId}"/>
                        </th>
                        <th>名称</th>
                        <th>
                            <input type="text" name="customer.cusName" placeholder="公司名称" required  lay-verify="required" value="${customer.cusName}"/>
                            <span>*</span>
                        </th>
                    </tr>
                    <tr>
                        <td>地区</td>
                        <td>
                            <select  name="customer.cusRegion"  style="display: block"  >
                                <option  value="${customer.cusRegion}">${customer.cusRegion}</option>
                                <option value="010">北京</option>
                                <option value="021">上海</option>
                                <option value="0571">杭州</option>
                            </select>
                        </td>
                        <td>客户经理</td>
                        <td>
                            <div>
                                <select id="city" name="customer.cusManagerId" style="display: block">
                                    <option value="${customer.cusManagerName}">${customer.cusManagerName}</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>客户等级</td>
                        <td colspan="3" class="layui-input-block" >
                            <select style="display: block" name="customer.cusLevel" id="level">

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>客户满意度</td>
                        <td>
                            <select name="customer.cusSatisfy" style="display: block">
                                <option value="1">☆</option>
                                <option value="2">☆☆</option>
                                <option value="3">☆☆☆</option>
                                <option value="4">☆☆☆☆</option>
                                <option value="5">☆☆☆☆☆</option>
                            </select>
                        </td>
                        <td>客户信用度</td>
                        <td>
                            <select style="display: block" name="customer.cusCredit">
                                <option value="1">☆</option>
                                <option value="2">☆☆</option>
                                <option value="3">☆☆☆</option>
                                <option value="4">☆☆☆☆</option>
                                <option value="5">☆☆☆☆☆</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <%--表二=================--%>
                <table class="layui-table">
                    <colgroup>
                        <col class="tit">
                        <col class="content">
                        <col class="tit">
                        <col class="content">
                    </colgroup>
                    <tr>
                        <td>地址</td>
                        <td>
                            <input type="text" name="customer.cusAddr" placeholder="请输入地址"   required lay-verify="required">
                            <span>*</span>
                        </td>
                        <td>邮政编码</td>
                        <td>
                            <input type="text"  name="customer.cusZip" placeholder="请输入邮政编码" required lay-verify="required|biz">
                            <span>*</span>
                        </td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td>
                            <input name="customer.cusTel" type="text" placeholder="请输入手机号"  required lay-verify="required|phone|number">
                            <span>*</span>
                        </td>
                        <td>传真</td>
                        <td>
                            <input name="customer.cusFax" type="text" placeholder="请输入传真"  required lay-verify="required|fax">
                            <span>*</span>
                        </td>
                    </tr>
                    <tr>
                        <td>网址</td>
                        <td  colspan="3">
                            <input type="text" name="customer.cusWebsite" required lay-verify="required|url" placeholder="请输入网址">
                            <span>*</span>
                        </td>
                    </tr>
                </table>
                <%--表三=================--%>
                <table class="layui-table">
                    <colgroup>
                        <col class="tit">
                        <col class="content">
                        <col class="tit">
                        <col class="content">
                    </colgroup>
                    <tr>
                        <td>营业执照注册号</td>
                        <td>
                            <input type="text" name="customer.licenceNo">
                        </td>
                        <td>法人</td>
                        <td>
                            <input type="text" value="聪颖" name="customer.chieftain">
                            <span>*</span>
                        </td>
                    </tr>
                    <tr>
                        <td>注册资金（万元）</td>
                        <td>
                            <input type="text" name="customer.bankroll"  lay-verify="money2">
                        </td>
                        <td>年营业额</td>
                        <td>
                            <input type="text" name="customer.cusTurnover"  lay-verify="money2">
                        </td>
                    </tr>
                    <tr>
                        <td>开户银行</td>
                        <td>
                            <input type="text" placeholder="开户银行" name="customer.bank" required lay-verify="required">
                            <span>*</span>
                        </td>
                        <td>银行账号</td>
                        <td>
                            <input type="text" name="customer.bankAccount" placeholder="银行账号" required lay-verify="required|number|bankAccount">
                            <span>*</span>
                        </td>
                    </tr>
                    <tr>
                        <td>地税登记号</td>
                        <td>
                            <input type="text" name="customer.localTaxNo">
                        </td>
                        <td>国税登记号</td>
                        <td>
                            <input type="text" name="customer.nationalTaxNo">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
</div>
        </form>
</div>
</body>
</html>
