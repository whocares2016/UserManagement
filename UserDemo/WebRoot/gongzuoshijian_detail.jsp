<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("gongzuoshijian").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">员工</td>
                <td></td>

                <td width="180">工号</td>
                <td><%= map.get("gonghao") %></td>
            </tr>
            <tr>
                <td width="180">姓名</td>
                <td><%= map.get("xingming") %></td>

                <td width="180">部门</td>
                <td><% Map mapbumen13 = new CommDAO().find("SELECT bumenmingcheng FROM bumen where id='" + map.get("bumen") + "'"); %>
<%= mapbumen13.get("bumenmingcheng") %></td>
            </tr>
            <tr>
                <td width="180">职位</td>
                <td><% Map mapzhiwei14 = new CommDAO().find("SELECT zhiweimingcheng FROM zhiwei where id='" + map.get("zhiwei") + "'"); %>
<%= mapzhiwei14.get("zhiweimingcheng") %></td>

                <td width="180">工作日期</td>
                <td><%= map.get("gongzuoriqi") %></td>
            </tr>
            <tr>
                <td width="180">开始时段</td>
                <td><%= map.get("kaishishiduan") %></td>

                <td width="180">结束时段</td>
                <td><%= map.get("jieshushiduan") %></td>
            </tr>
            <tr>
                <td width="180">工作备注</td>
                <td><%= map.get("gongzuobeizhu") %></td>

                <td width="180">添加人</td>
                <td><%= map.get("tianjiaren") %></td>
            </tr>
            <tr></tr>
        </table>
    </div>

    <div class="button-list">
        <div class="">
            <button onclick="history.go(-1);" style="background: #07de19; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">返回</button>
            <button onclick="window.print()" style="background: #de2010; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">打印</button>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

