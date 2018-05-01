<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>编辑联系人</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="../plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="css/editContacts.css" />
    <script>
        $(function () {
            layui.use('layer', function(){
                var layer = layui.layer;
                var index = layer.load(1, {
                    shade: [0.1,'#fff'] ,
                    time: 500//0.1透明度的白色背景
                })
            });
            <%--alert("${cstLinkman.lkmSex}");--%>
            $("input[type='radio'][name='cstLinkman.lkmSex'][value='${cstLinkman.lkmSex}']").attr("checked",'checked');
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
                area: ['1400px', '700px']
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="../images/help_editContacts.png" ></div>'
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

                //详细信息的验证方法
                memo: function(value, item) {
                    if ($.trim(value) =="") {
//                        alert("来来来")

                    }else{
                        if (!new RegExp("^.{0,50}$").test(value)) {
                            return '最多只能输入50个字';
                        }
                    }


                },
                //备注证方法
                info: function(value, item) {
                    if ($.trim(value) =="") {
//                        alert("来来来")

                    }else{
                        if (!new RegExp("^.{0,20}$").test($.trim(value))) {
                            return '最多只能输入20个字';
                        }
                    }


                },

                ttt: [
                    /^[\S]{0,20}$/
                    ,'最多输入20个字'
                ]
                //职位的验证方法
                ,name: [
                    /^[\u4e00-\u9fa5]*$/
                    ,'名称中含有非法字符'
                ]



            });

        });

    </script>
</head>
<body>
<div id="main">

    <div>
        <span id="title1">
		  <a href="">客户信息管理 ></a>
		  <a href="">客户信息 ></a>
            <a href=""> 联系人 ></a>
		  <a href="">编辑联系人 ></a>
		</span>
    </div>

    <form class="layui-form" action="cstLinkmanmodify.action" method="get">
    <div class="layui-btn-group globalHight">
        <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
        <a  class="layui-btn"href="cstLinkmanload2.action?id=${id}">返回</a>
        <button class="layui-btn"   lay-submit  lay-filter="formDemo">保存</button>
    </div>

    <div>
        <table class="layui-table">
            <tr>
                <td>姓名</td>
                <td>
                    <input type="hidden" name="id" value="${id}">
                    <input type="hidden" name="cstLinkman.lkmId" value="${cstLinkman.lkmId}">
                    <input type="text" name="cstLinkman.lkmName"  required  lay-verify="required|name" value="${cstLinkman.lkmName}">
                    <span>*</span>
                </td>
                <td>性别</td>
                <td>
                    <div style="width: 50%;height: 100%;float: left"><input class="check" type="radio" name="cstLinkman.lkmSex" value="男" title="男" checked="" style="display: block ;width: 30%;float: left">男</div>
                    <div style="width: 50%;height: 100%;float: left"><input class="check" type="radio" name="cstLinkman.lkmSex" value="女" title="女"  style="display: block;width: 30%;float: left">女</div>
                </td>
            </tr>
            <tr>
                <td>职位</td>
                <td>
                    <input type="text" name="cstLinkman.lkmPostion" required  lay-verify="required|ttt" value="${cstLinkman.lkmPostion}">
                    <span>*</span>
                </td>
                <td>办公电话</td>
                <td>
                    <input type="text" name="cstLinkman.lkmTel" required  lay-verify="required|number|phone" value="${cstLinkman.lkmTel}">
                    <span>*</span>
                </td>
            </tr>

            <tr>
                <td>备注</td>
                <td colspan="3" name="cstLinkman.lkmMemo">
                    <textarea  rows="5" cols="80" name="cstLinkman.lkmMemo"   lay-verify="info">
                        ${cstLinkman.lkmMemo}
                    </textarea>
                </td>
            </tr>
        </table>
    </div>
    </form>
</div>
</body>
</html>
