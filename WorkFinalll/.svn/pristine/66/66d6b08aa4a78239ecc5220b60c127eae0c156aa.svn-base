<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/8
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改轮播图</title>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/newsManagement/css/updateCarouse.css" />
    <link rel="stylesheet" href="../css/layer.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/layer.js"></script>
    <script type="text/javascript" src="../js/jquery.form.js"></script>

    <script>
        $(function () {
            $("#save").click(function() {

                $('form').on('submit', function() {
                    var title = $('input[name=file]').val();

                    $(this).ajaxSubmit({
                        type: 'post', // 提交方式 get/post
                        url: 'lunboexecute.action', // 需要提交的 url
                        data: {
                            'file': title,
                        },
                        success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                            // 此处可对 data 作相关处理
                            up();
//                            alert("图片提交成功！")
                        }

                });
                    return false; // 阻止表单自动提交事件
                });
            });
        })


        //验证
        $(function(){
            //            加载upload模块
            layui.use('upload', function(){
                layui.upload(options);
//                upload.render(); //更新全部
            });
            $("#save").click(function(){
                var check1 = false;
                var check2 = false;
                var check3 = false;

                var b1 =  $("#uploadMan").val();
                var b2 =  $("#newPic").val();
                var b3 =  $("#picName").val();

                if(b1.trim()!=""){
                    check1 = true;
                }
                if(b2.trim()!=""){
                    check2 = true;
                }
                if(b3.trim()!=""){
                    check3 = true;
                }
                if((check1&&check3)!=false) {
                }else{

                    layer.msg('请写全内容', {
                        msg:[1,'#3595CC'],
                        area:['200px','48px'],
                        tips: [1, '#1AA094'],
                        time:2000
                    });
                }
            });

        });

        function up(){
                var a=$("#uploadMan").val();
                var b=$("#newPic").val();
                var c=$("#picName").val();
                if(a!=""&&c!=""){
                    $.get("${pageContext.request.contextPath}/news/lunbomodify.action",$("#myform").serialize(),function(data){


                    });

                    layer.msg('修改成功', {
                        msg:[1,'#3595CC'],
                        area:['200px','48px'],
                        tips: [1, '#1AA094'],
                        time:2000
                    });
                }else{

                    layer.msg('请上传文件', {
                        msg:[1,'#3595CC'],
                        area:['200px','48px'],
                        tips: [1, '#1AA094'],
                        time:2000
                    });
                }
        }

        function m(i){
            var url=i.value;
            url=url.split("\\");
            var n = url[url.length-1];
//                                            n = n.substring(0,n.lastIndexOf('.'));
            document.getElementById('picName').value = n;
        }



        // 绑定键盘按下并松开事件
        $('#goodsNa').bind('keyup', function() {

            $("#searchList_ul1").empty();
            var text=$.trim($(this).val());
            if(text!=""){
                $.get("${pageContext.request.contextPath}/basicData/stockselect.action",{goodsName:text},function(data) {
                    if($.isEmptyObject(data)){
                    }else {
                        $(data).each(function (i, obj) {
                            var tr = "<li>";
                            //   如果有相关的自动提示就显示
                            var td = "<a   title='" + obj.goodsName + "'href='#'   onclick='fu(this)'>" + obj.goodsName + "</a>";
                            tr = tr + td + "</li>";
                            $("#searchList_ul1").append(tr);
                        })
                    }
                })
            }
        });
        //    点击自动提示结果中的某一条，将其内容填充到搜索框中
        function fu(t) {
            var v=$(t).attr("title");
            $("#goodsNa").val(v);
            $("#goodsName").val($(t).attr("value"))
            $("#searchList_ul1").empty();
        }

    </script>
</head>
<body>
<div id="main">
    <%--路径--%>
    <div id="nav">
        <span class="title1">
		  <a href="">轮播管理 ></a>
		  <a href="">修改轮播图</a>
		</span>
    </div>
    <form class="layui-form" id="myform"  method="post" enctype="multipart/form-data">
            <%--控制按钮--%>
            <div class="layui-btn-group globalHight">
                <button class="layui-btn">帮助</button>
                <button class="layui-btn" id="save" type="submit">保存</button>
                <a href="${pageContext.request.contextPath}/newsManagement/carouselManagement.jsp"><button class="layui-btn"type="button">返回</button></a>
            </div>
            <%--具体内容--%>
            <div>
                    <table class="layui-table">

                        <tr>
                            <td>上传人</td>
                            <td>
                               <input id="photoId" type="hidden" name="lunbo.photoId" value="${lunbo.photoId}">
                                <input id="uploadMan" type="text" name="lunbo.uploadMan" style="width: 200px" value="${lunbo.uploadMan}">
                            </td>
                        </tr>

                        <tr>
                            <td>上传图片</td>
                            <td>
                                <div class="site-demo-upbar">
                            <%--<input type="file" name="lunbo.picPath" id="newPic" value="${lunbo.picPath}">--%>
                                    <input type="file" name="file" id="newPic"  onChange="m(this)" >
                                </div>
                            </td>
                       </tr>

                        <tr>
                            <td>图片名称</td>
                            <td>
                                <div class="site-demo-upbar">
                                    <input type="text" name="lunbo.picName" value="${lunbo.picName}" id="picName" onChange="n(this)" style="width: 200px">
                                </div>
                            </td>
                        </tr>


                </table>
            </div>

        </form>

</div>
</body>
</html>
