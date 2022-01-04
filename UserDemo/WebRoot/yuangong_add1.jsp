 <%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">员工注册:</div>
            <div class="panel-body">
                <form action="yuangong.jsp?a=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">工号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入工号" style="width: 150px" id="gonghao" name="gonghao" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">密码<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="输入密码"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写密码"
                                    id="mima"
                                    name="mima"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入姓名"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写姓名"
                                    id="xingming"
                                    name="xingming"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">性别<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_xingbie3"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写性别"
                                    id="xingbie"
                                    name="xingbie"
                                    style="width: 250px"
                                >
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系方式<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系方式"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写联系方式"
                                    phone="true"
                                    data-msg-phone="请输入正确手机号码"
                                    id="lianxifangshi"
                                    name="lianxifangshi"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">部门<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_bumen4"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写部门"
                                    id="bumen"
                                    name="bumen"
                                    style="width: 250px"
                                >
                                    <% List<Map> select = new CommDAO().select("SELECT * FROM bumen ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("bumenmingcheng") %></option>
                                    <%} %>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">职位<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_zhiwei5"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写职位"
                                    id="zhiwei"
                                    name="zhiwei"
                                    style="width: 250px"
                                >
                                    <% select = new CommDAO().select("SELECT * FROM zhiwei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("zhiweimingcheng") %></option>
                                    <%} %>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="referer" value="login.jsp" type="hidden"/>
                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>

