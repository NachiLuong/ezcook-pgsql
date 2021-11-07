<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/admin-user-list" var="userList"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar responsive ace-save-state">
    <ul class="nav nav-list">
        <li href="${userList}" >
            <a href="${userList}" >
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                <fmt:message key="label.manager.account" bundle="${lang}"/>
            </a>
        </li>
        <li class="">
            <a href="#">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                <fmt:message key="label.manager.food" bundle="${lang}"/>
            </a>
        </li>
        <li class="">
            <a href="#">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                <fmt:message key="label.manager.foodType" bundle="${lang}"/>
            </a>
        </li>
    </ul>
    <%--<div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>--%>
</div>