<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("xinzixinxi").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">薪资编号</td>
                <td><%= map.get("xinzibianhao") %></td>

                <td width="180">月份</td>
                <td><%= map.get("yuefen") %></td>
            </tr>
            <tr>

                <td width="180">工号</td>
                <td><%= map.get("gonghao") %></td>
            </tr>
            <tr>
                <td width="180">姓名</td>
                <td><%= map.get("xingming") %></td>

                <td width="180">部门</td>
                <td><% Map mapbumen21 = new CommDAO().find("SELECT bumenmingcheng FROM bumen where id='" + map.get("bumen") + "'"); %>
<%= mapbumen21.get("bumenmingcheng") %></td>
            </tr>
            <tr>
                <td width="180">职位</td>
                <td><% Map mapzhiwei22 = new CommDAO().find("SELECT zhiweimingcheng FROM zhiwei where id='" + map.get("zhiwei") + "'"); %>
<%= mapzhiwei22.get("zhiweimingcheng") %></td>

                <td width="180">基本工资</td>
                <td><%= map.get("jibengongzi") %></td>
            </tr>
            <tr>
                <td width="180">加班工资</td>
                <td><%= map.get("jiabangongzi") %></td>

                <td width="180">全勤奖</td>
                <td><%= map.get("quanqinjiang") %></td>
            </tr>
            <tr>
                <td width="180">优秀员工</td>
                <td><%= map.get("youxiuyuangong") %></td>

                <td width="180">社保</td>
                <td><%= map.get("shebao") %></td>
            </tr>
            <tr>
                <td width="180">公积金</td>
                <td><%= map.get("gongjijin") %></td>

                <td width="180">个人所得税</td>
                <td><%= map.get("gerensuodeshui") %></td>
            </tr>
            <tr>
                <td width="180">应发薪资</td>
                <td><%= map.get("yingfaxinzi") %></td>

                <td width="180">实发薪资</td>
                <td><%= map.get("shifaxinzi") %></td>
            </tr>
            <tr></tr>
        </table>
    </div>

    <div class="button-list">
        <div class="">
            <button onclick="history.go(-1);" style="background: #07de19; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">返回</button>
            <button onclick="window.print()" style="background: #de1b07; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">打印</button>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

