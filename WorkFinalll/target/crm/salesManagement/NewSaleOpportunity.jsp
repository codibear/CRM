<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/7/27
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>新建销售机会</title>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/NewSaleOpportunity.css">
    <link rel="stylesheet" href="../css/main.css" />


    <script>
        layui.use('laydate', function(){
            var laydate = layui.laydate;

            var start = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                    end.min = datas; //开始日选好后，重置结束日的最小日期
                    end.start = datas //将结束日的初始值设定为开始日
                }
            };

            var end = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                    start.max = datas; //结束日选好后，重置开始日的最大日期
                }
            };

            document.getElementById('LAY_demorange_s').onclick = function(){
                start.elem = this;
                laydate(start);
            }
            document.getElementById('LAY_demorange_e').onclick = function(){
                end.elem = this
                laydate(end);
            }

        });
    </script>

    <script type="text/javascript" >

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

        layui.use('form', function(){
            var form = layui.form();
            form.verify({

                phone: [
                    /^1[3|4|5|7|8][0-9]{9}$/,
                    '请输入正确手机号'
                ],
            });
            //监听提交
        });


        //新建

            $(function(){

                $("#sub").click(function(){
                    var cusname = $("#cusname").val();
                    var rate = $("#rate").val();
                    var about = $("#about").val();
                    var linkman = $("#linkman").val();
                    var linkphone = $("#linkphone").val();
                    var creatman = $("#creatman").val();

                          //创建时间
                    var mydate = new Date();


                    var date = mydate.getFullYear() + "-" + (mydate.getMonth() + 1) + "-" + mydate.getDate() +" "+mydate.getHours()+":"+mydate.getMinutes()+":"+mydate.getSeconds();


                    var creattime = $("#creattime").val(date);


                    var giveman=$("#type").val();

                    var givetime=$("#givertime").val();

                    var ph=/^1[3|4|5|7|8][0-9]{9}$/;


                    if (cusname.length != 0 && rate.length != 0 && about.length != 0 && linkman.length != 0 && ph.test(linkphone) && creatman.length != 0 && creattime.length != 0 && giveman.length!=0 &&givetime.length!=0) {


                    $.get("/CRM/sales/salessave.action",$("#myform").serialize(),function(data) {

                        layer.confirm('保存成功', {
                                    icon:6,
                                    btn: ['确定'] //按钮
                                }, function(){
                                    window.location.href=getRootPath_web()+"/salesManagement/ManageSaleOpportunity.jsp";
                                }
                        );
                        });
                    }
                });
            })


        $(function () {
            $.get("${pageContext.request.contextPath}/sales/salesfindUser.action",function (data) {
                var type = $("#type") ;
                var tr="";
                $(data).each(function(i,obj){
                    var td = "<option value='"+ obj.userName +"'>" + obj.userName + "</option>"
                    tr = tr + td  ;
                });
                $(type).append(tr) ;
                render();
            }) ;

        })



</script>

</head>
<body>
    <div class="admin-main">
        <div id="main">
            <span class="title1">
            <a href="">销售机会管理 ></a>
            <a href="">新建销售机会</a>
            </span>
            <form class="layui-form" id="myform">

            <div class="layui-btn-group">
                <button class="layui-btn">帮助</button>

                <button class="layui-btn" type="button" lay-submit  lay-filter="formDemo" id="sub">保存</button>
                <button type="button" class="layui-btn" >  <a href="/CRM/salesManagement/ManageSaleOpportunity.jsp" >返回</a></button>
            </div>

            <%--<form id="NewSale" action="" method="post">--%>
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
                        <td class="td1">
                            <input type="text" name="sales.salesId"  autocomplete="off" class="layui-input" value="${sales.salesId}" placeholder="自动生成" readonly>
                        </td>
                        <td class="td1">机会来源</td>
                        <td class="td1">
                            <input type="text"  name="sales.oppSource"  autocomplete="off" class="layui-input">
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">客户名称</td>
                        <td class="td1">
                            <input type="text" id="cusname" name="sales.cusName"  autocomplete="off" class="layui-input" required lay-verify="required">
                            <span class="tab">*</span>
                        </td>
                        <td class="td1">成功机率(%)</td>
                        <td class="td1">
                            <input type="text" id="rate" name="sales.succRate" autocomplete="off" class="layui-input" required lay-verify="number">
                            <span class="tab">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">概要</td>
                        <td colspan="3" class="td1">
                            <input type="text" id="about" name="sales.outLine" autocomplete="off" class="layui-input" required lay-verify="required" >
                            <span class="tab">*</span>
                        </td>

                    </tr>
                    <tr>
                        <td class="td1">联系人</td>
                        <td class="td1">
                            <input type="text" id="linkman" name="sales.linkName"  autocomplete="off" class="layui-input" required lay-verify="required">
                            <span class="tab">*</span>
                        </td>
                        <td class="td1">联系人电话</td>
                        <td class="td1">
                            <input type="text" id="linkphone" name="sales.linkPhone" autocomplete="off" class="layui-input" required lay-verify="phone">
                            <span class="tab">*</span>
                        </td>
                    </tr>
                    <tr id="rowFive">
                        <td class="td1">机会描述</td>
                        <td colspan="3" class="td1">
                            <textarea name="sales.oppDesc"  class="layui-textarea"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">创建人</td>
                        <td class="td1">
                            <input type="text" id="creatman" name="sales.creatMan" class="layui-input"   required  lay-verify="required" value="${user.userName}" readonly/>
                            <span class="tab">*</span>
                        </td>
                        <td class="td1">创建时间</td>
                        <td class="td1">
                            <%--<input type="text" name="createTime" lay-verify="createTime" autocomplete="off" class="layui-input">--%>
                                <div class="layui-inline">

                                    <input class="layui-input" id="creattime" name="sales.creatTime" placeholder="自定义日期格式" readonly>

                                </div>

                                <span class="tab">*</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="layui-table" lay-even="" lay-skin="row">
                    <colgroup>
                        <col width="200">
                        <col width="350">
                        <col width="200">
                        <col width="350">
                    </colgroup>
                    <tbody>
                    <tr style="margin-top: 10px">

                        <td class="td1">指派给</td>
                        <td class="td1">
                            <select  id="type" style="display: block" name="sales.giveMan" lay-verify="required" lay-search="" class="layui-input">

                            </select>
                            <span class="tab2">*</span>
                        </td>
                        <td class="td1">指派时间</td>
                        <td class="td1">
                            <div class="layui-inline">
                                <input class="layui-input" id="givertime" name="sales.giveTime" placeholder="自定义日期格式" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required  lay-verify="required"/>
                            </div>
                            <span class="tab2">*</span>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </form>

        </div>
    </div>
</body>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

</html>
