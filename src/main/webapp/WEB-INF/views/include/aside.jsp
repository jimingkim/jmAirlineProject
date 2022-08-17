<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<style>
		.aside{
			float: right;
		}	
	</style>
</head>
<ul id="aside">
	<c:if test="${user == null}">
		<li><a href="/user/signin">로그인</a></li>
		<li><a href="/user/signup">회원가입</a></li>
	</c:if>
	
	<c:if test="${user != null}">
		<li><a href="/user/signout">로그아웃</a></li>
	</c:if>
		<li><a href="#">고객센터</a></li>
		<li><a href="#">SNS</a></li>
</ul>
</html>