<%--
  Created by IntelliJ IDEA.
  User: Amily
  Date: 2017/8/5
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新建数据字典信息</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/NewDatas.css">
    <link rel="stylesheet" href="../css/layer.css">
    <script type="text/javascript" src="../plugins/layui/layui.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>

        <script>
//            类别自动补全
        // 绑定键盘按下并松开事件
$(function () {
    render();
        $('#type').bind('keyup', function() {
            $("#searchList_ul").empty();
            var text=$.trim($(this).val());
            if(text!=""){
                $.get("${pageContext.request.contextPath}/basicData/DataDictionaryselect.action",{type:text},function(data) {

                    if($.isEmptyObject(data)){

                    }else {
                        $(data).each(function (i, obj) {
                            var tr = "<li>";
                            //   如果有相关的自动提示就显示
                            var td = "<a   title='" + obj + "'href='#'   onclick='fu(this)'>" + obj + "</a>";
                            tr = tr + td + "</li>";
                            $("#searchList_ul").append(tr);
                        })
                    }
                })
            }
        });
})
    //    点击自动提示结果中的某一条，将其内容填充到搜索框中
    function fu(t) {
        var v=$(t).attr("title");
        $("#type").val(v);
        $("#dataDictionary.type").val($(t).attr("value"))
        $("#searchList_ul").empty();
    }

//            加载form模块
            function render() {
                layui.use('form',function () {
                    var form=layui.form();
                    form.render(); //更新全部

                });

            }

            $(function () {
                $("#submit").click(function(){
                       var a1=$("#type").val();
                       var a2=$("#entry").val();
                    var b1=$.trim(a1);
                    var b2=$.trim(a2);

                    if((b1&&b2)!=""){
                        var param = $("form").serialize()  ;
                        $.get("${pageContext.request.contextPath}/basicData/DataDictionarysave.action",param,function(data){
                            if(data=="success"){
                                layer.msg('保存成功！', {
                                    icon: 6,
                                    skin: 'layer-ext-moon'
                                })
                            }else {
                                layer.msg('该数据已存在！', {
                                    icon: 5,
                                    skin: 'layer-ext-moon'
                                })
                            }


                        });
                    }else {
                        layer.msg('类别和条目不能为空！', {
                            icon: 5,
                            skin: 'layer-ext-moon'
                        })
                    }
                });
            })
    </script>

    <script>
        //帮助按钮弹出框方法
        //触发事件
        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: ['1400px', '400px']
                    ,shade: 0.8
                    ,resize:true
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: [ '好啦，我知道啦']
                    ,moveType: 0//拖拽模式，0或者1
//                        ,content: '<img src="../images/help_cusManage.png" >'
                    ,content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../basicData/img/Data2.png" style="margin-left: 90px;width: 85%" ></div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.css('text-align', 'center');
                        btn.find('.layui-layer-btn0').attr({
                            target: '_blank'
                        });
                    }
                });
            }
        };
        $(function () {

            $(".layui-btn").click(function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        })
    </script>

</head>
<body>
<div class="admin-main">
    <div id="main">
            <span class="title1">
            <a href="">数据字典管理 ></a>
            <a href="">新建数据字典条目</a>
            </span>
        <form class="layui-form" action="">
            <div class="layui-btn-group globalHight">
                <button  id="button" class="layui-btn" type="button" data-method="notice">帮助</button>
                <a href="../basicData/ManageDatas.jsp"> <button class="layui-btn" type="button">返回</button></a>
                <button id="submit" class="layui-btn" type="button"  lay-submit  lay-filter="formDemo">保存</button>
            </div>

            <table class="layui-table">
                <colgroup>
                    <col width="200">
                    <col width="300">
                    <col width="200">
                    <col width="400">
                </colgroup>

                <tbody>
                <tr id="tr1">

                    <td>类别</td>
                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                                <input id="type" type="text" name="dataDictionary.type" lay-verify="required" placeholder="请输入类别" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <%--自动提示--%>
                    </td>
                    <div id="searchList" style="width:190px;height:200px;position: absolute;left: 550px;top:160px;margin-left: 10px">
                        <ul id="searchList_ul"style="background: #F8F8F8;padding-top: 5px">
                        </ul>
                    </div>
                    <td>条目</td>
                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                                <input id="entry" type="text" name="dataDictionary.entry" lay-verify="required" placeholder="请输入条目" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>值</td>
                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                        <input type="text" name="dataDictionary.value" placeholder="请输入值" autocomplete="off" class="layui-input" id="value">
                            </div>
                        </div>
                    </td>

                    <td>是否可编辑</td>
                    <td>
                        <select id="yon" name="dataDictionary.yon" lay-verify="required" >
                            <option>是</option>
                            <option>否</option>
                        </select>
                    </td>
                </tr>
                </tbody>
            </table>

        </form>
    </div>

</div>

</body>
</html>


