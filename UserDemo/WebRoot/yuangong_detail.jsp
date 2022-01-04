<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("yuangong").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">工号</td>
                <td><%= map.get("gonghao") %></td>

                <td width="180">密码</td>
                <td><%= map.get("mima") %></td>
            </tr>
            <tr>
                <td width="180">姓名</td>
                <td><%= map.get("xingming") %></td>

                <td width="180">性别</td>
                <td><%= map.get("xingbie") %></td>
            </tr>
            <tr>
                <td width="180">联系方式</td>
                <td><%= map.get("lianxifangshi") %></td>

                <td width="180">部门</td>
                <td><% Map mapbumen5 = new CommDAO().find("SELECT bumenmingcheng FROM bumen where id='" + map.get("bumen") + "'"); %>
<%= mapbumen5.get("bumenmingcheng") %></td>
            </tr>
            <tr>
                <td width="180">职位</td>
                <td><% Map mapzhiwei6 = new CommDAO().find("SELECT zhiweimingcheng FROM zhiwei where id='" + map.get("zhiwei") + "'"); %>
<%= mapzhiwei6.get("zhiweimingcheng") %></td>
            </tr>
        </table>
    </div>

    <div class="button-list">
        <div class="">
            <button onclick="history.go(-1);" style="background: #07de19; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">返回</button>
            <button onclick="window.print()" style="background: #4961de; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">打印本页</button>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

