<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 17-11-1
  Time: 下午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<%@include file="../public/adminHeader.jsp"%>
<%@include file="../public/adminNavigator.jsp"%>
<html>
<head>
    <title>分类管理</title>
    <style type="text/css">
        div.operation-btn-div{
            text-align: right;
            padding-right: 200px;
        }
        div.modal-header{
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="workingArea">
        <span class="label label-info" >分类管理</span>
        <br>
        <br>
        <div class="listDataTableDiv">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                <tr class="success">
                    <th>ID</th>
                    <th>图片</th>
                    <th>分类名称</th>
                    <th>属性管理</th>
                    <th>产品管理</th>
                    <th>编辑</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categories}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td><img height="40px" src="/img/category/${c.id}.jpg"></td>
                        <td>${c.name}</td>
                        <td><a href="property/${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                        <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                        <!-- 此处直接把模态框需要的属性声明为标签的属性 也可以利用节点之间的关系找到相应节点并提取val( -->
                        <td><a id="edit_category" data-toggle="modal" data-target="#updateCategoryModal" data="${c.name}" data1="${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a id="delete_category" data=${c.id}><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="pageDiv">
            <%@include file="../public/adminPage.jsp"%>
            <%--<div class="panel panel-warning addDiv">--%>
                <%--<div class="panel-heading">新增分类</div>--%>
                <%--<div class="panel-body">--%>
                    <%--<!-- 文件上传的post,因为ajax不会 所以直接使用form表单上传 -->--%>
                    <%--<form method="post" id="addForm" action="" enctype="multipart/form-data">--%>
                        <%--<table class="addTable">--%>
                            <%--<tr>--%>
                                <%--<td>分类名称</td>--%>
                                <%--<td><input  id="name" name="name" class="form-control"></td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>分类图片</td>--%>
                                <%--<td>--%>
                                    <%--<input id="categoryPic" accept="image/*" type="file" name="image" />--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr class="submitTR">--%>
                                <%--<td colspan="2" align="center">--%>
                                    <%--<button class="btn btn-success">提 交</button>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                        <%--</table>--%>
                    <%--</form>--%>
                <%--</div>--%>
        <%--</div>--%>
        </div>
        <div class="operation-btn-div">
            <button id="add-btn" type="button" class="btn btn-default" data-toggle="modal" data-target="#addCategoryModal">
                新增分类
            </button>
            <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-content-div">
                            <div class="modal-header">
                                <%--<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>--%>
                                <h4 class="modal-title" id="ModalLabel">新增分类</h4>
                            </div>
                            <!-- 因为最后需要页面刷新 所以用不用ajax没有区别 此处直接使用form提交  -->
                            <form id="addModalForm" action="" method="post" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="modal-body-input-div">
                                        <div class="input-group modal-body-input-div-input">
                                            <label for="CategoryName1">分类名称</label>
                                            <input id="CategoryName1" class="form-control" name="name" placeholder="分类名称">
                                        </div>
                                        <br/>
                                        <div class="input-group modal-body-input-div-input">
                                            <label for="CategoryPic1">分类图片</label>
                                            <input id="CategoryPic1" accept="image/*" type="file" name="image" />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="modal-footer-div">
                                        <button type="button" class="btn btn-default modal-footer-btn" data-dismiss="modal">关闭</button>
                                        <button class="btn btn-primary modal-footer-btn">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="updateCategoryModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel2">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-content-div">
                            <div class="modal-header">
                                <h4 class="modal-title" id="ModalLabel2">修改分类</h4>
                            </div>
                            <form id="updateModalForm" action="/admin/category" method="post" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="modal-body-input-div">
                                        <div class="input-group modal-body-input-div-input">
                                            <label for="updateCategoryName">分类名称</label>
                                            <input id="updateCategoryName" class="form-control" name="name" placeholder="分类名称">
                                        </div>
                                        <br/>
                                        <div class="input-group modal-body-input-div-input">
                                            <label for="updateCategoryPic">分类图片</label>
                                            <input id="updateCategoryPic" accept="image/*" type="file" name="image" />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="modal-footer-div">
                                        <button type="button" class="btn btn-default modal-footer-btn" data-dismiss="modal">关闭</button>
                                        <button type="button" id="update-category-btn" class="btn btn-primary modal-footer-btn">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    $("button#update-category-btn").click(function () {

        var form = new FormData(document.getElementById("updateModalForm"));
        form.append('_method','put');
        alert(JSON.stringify(form));
        $.ajax({
            type:"post",
            data:form,
            processData: false,
            contentType: false,
            success:function () {
                alert("上传成功");
            },
            error:function () {
                alert("系统错误")
            }
        });
        get();
    });

    /*
     *   此处不知道是什么bug,后台的DeleteMapper完全接收不到ajax的参数
     *   使用网上的方法后成功,在web.xml中添加两个filter,在使用POST请求承载_method参数
     */
    //删除分类信息
    $("a#delete_category").click(function () {
        $.ajax({
            //因为使用操作符表示 所以使用统一的url
            type:"POST",
            data: {
                id:$(this).attr('data'),
                _method:'DELETE'
            },
            success:function (result) {
                DeleteResultHandler(result);
            },
            error:function () {
                alert("系统错误")
            }
        });
    });


    //在点击属性编辑按钮之后,将原本的分类名称显示在弹出框的名称输入框
    //同时传递分类id
    $("a#edit_category").click(function () {
        $("div#updateCategoryModal").find("input#updateCategoryName").val($(this).attr('data'));
        $("button#update-category-btn").attr("data",$(this).attr("data1"));
    });
</script>
</html>
