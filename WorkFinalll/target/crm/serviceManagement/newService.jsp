<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chinasofti.crm.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>服务创建</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/layui.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/layui/lay/dest/layui.all.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/css/custInformation.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/prettify.js"></script>
    <%--<%--%>
        <%--User user = (User) session.getAttribute("user");--%>
        <%--String name =  user.getUserName();--%>
    <%--%>--%>

</head>
<body>
<div id="main">
    <div>
		  <span style="color: black;">客户服务管理 ></span>
          <span style="color: black;">服务创建</span>
    </div>
    <form class="layui-form">
        <div class="layui-btn-group globalHight">
            <a data-method="notice" class="layui-btn" type="button"  onclick="help()">帮助</a>
            <a class="layui-btn" lay-submit="" id="save"  >保存</a>
        </div>

        <div>
            <table class="layui-table">
                <tr>
                    <td >编号</td>
                    <td>
                        <input   name="service.serviceId" readonly="readonly" value="<%=new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date())%>" >
                    </td>
                    <td>服务类型</td>
                    <td>
                        <select id="serviceType" name="service.serviceType" style="display: block;width: 80px"></select>
                    </td>
                </tr>
                <tr>
                    <td>概要</td>
                    <td colspan="3">
                            <input type="text" id="outline" name="service.serviceOutline" onblur="IsChinese()" placeholder="输入格式支持数字，汉字，英文" required lay-verify="required"><span> *</span>
                    </td>
                </tr>
                <tr>
                    <td>客户</td>
                    <td>
                        <div style="position: relative">
                        <input type="text" id="search" name="service.cusName" placeholder="请输入客户名" required lay-verify="required"/>
                            <span> *</span>
                            <%--自动提示--%>
                            <div id="searchList" style="position: absolute ; z-index: 2 ; background-color: white ;width: 398px">
                                <ul id="searchList_ul">
                                </ul>
                            </div>
                        </div>
                    </td>
                    <td>状态</td>
                    <td>
                        <input name="service.serviceState"  readonly value="新创建" />
                    </td>
                </tr>
                <tr>
                    <td>服务请求</td>
                    <td colspan="3">
                            <textarea name="service.serviceRequest" id="request"  required lay-verify="required"  style=" width:900px;height:200px;"></textarea>
                            <span style="float: right;padding:-10px 150px"> *</span>
                    </td>
                </tr>
                <tr>
                    <td>创建人</td>
                    <td>
                        <input readonly name="service.serviceCreateUser" value="${user.userName}" required lay-verify="required"><span> *</span>
                    </td>
                    <td>创建时间</td>
                    <td>
                        <input name="service.serviceCreateTime"  readonly="readonly"  value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>"><span> *</span>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
</html>

<script type="text/javascript">

    //  保存服务
    $(function(){
        $("#save").click(function(){
            var outline = $("#outline").val();
            var cusName = $("#search").val();
            var request = $("#request").val();
            if(outline=="" || cusName=="" || request==""){
            }else {
                $.get("<%=request.getContextPath()%>/service/servicesave.action", $("form").serialize(), function (data) {
                    if(data == true){
                        layer.confirm('保存成功', {
                                icon:6,
                                btn: ['确定'] //按钮
                            }, function(){
                            location.href = "<%=request.getContextPath()%>/serviceManagement/newService.jsp";
                            });
                    }else {
                        layer.confirm('客户不存在，保存失败', {
                            icon:6,
                            btn: ['确定'] //按钮
                        }, function(){
                            location.href=getRootPath_web()+"/salesManagement/ManageSaleOpportunity.jsp";
                        });
                    }
                });
            }
        });
    }) ;

    //  获取服务类型
    $(function () {
        $.get("<%=request.getContextPath()%>/service/servicefindAllselect.action?message=服务类型",{},function (type) {
            //接收并显示服务类型
            $(type).each(function (i,obj) {
                var option = "<option value="+'"'+obj.entry+'"'+">"+obj.entry+"</option>";
                $("#serviceType").append(option);
            })
        })
    })

    //  判断输入的字符是否支持中，英文，数字
    function IsChinese() {
        var str = document.getElementById('outline').value.trim();
        if(str.length!=0){
            var pattern = /^[\u4E00-\u9FA5\uF900-\uFA2D\da-zA-Z]+$/ ;
            if(!pattern.test(str)){
                alert("sorry，您输入的字符串类型不支持!");
                $("#outline").val("") ;
            }
        }
    }

    //  编辑器
    KindEditor.ready(function(K) {
        var editor1 = K.create('textarea[name="service.serviceRequest"]', {
            cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
            uploadJson : '<%=request.getContextPath()%>/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : '<%=request.getContextPath()%>/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    K('form[name=myform]')[0].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    K('form[name=myform]')[0].submit();
                });
            },
            afterBlur: function(){this.sync();}
        });
        prettyPrint();
    });

    //  模糊查询
    // 绑定键盘按下并松开事件
        $('#search').bind('keyup', function() {
            $("#searchList_ul").empty();
            var text=$.trim($(this).val());
            if(text!=""){
                $.get("<%=request.getContextPath()%>/service/serviceselect.action",{cusName:text},function(data) {
                    if($.isEmptyObject(data)){
                    }else {
                        $(data).each(function (i, obj) {
                            var tr = "<li>";
                            //   如果有相关的自动提示就显示
                            var td = "<a   title='" + obj.cusName + "'href='#' value='"+obj.cusName+"'  onclick='fu(this)'>" + obj.cusName + "</a>";
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
            $("#search").val(v);
            $("#search").val($(t).attr("value"))
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
                content: '<div style="padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><img src="<%=request.getContextPath()%>/images/newService.png" style="width:620px;height:350px"></div>',
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