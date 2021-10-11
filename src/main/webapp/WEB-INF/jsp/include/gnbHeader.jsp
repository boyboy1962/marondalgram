<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
	
<header class="d-flex justify-content-between align-items-center">
	<div class="logo d-flex ">
		<h4 class="font-weight-bold p-4">Marondalgram</h4>
	</div>
	<div class="login-info d-flex align-itmes-end mr-4">
		<!-- 세션이 존재할때만 나옴 -->
		<c:if test="${not empty userId}">
			<div>
				<span class="font-weight-bold">${userName}군 어서와ㅎㅎ 오늘은 무슨일이 있니?</span>
				<a href="/user/sign_out">로그아웃</a>
			</div>
		</c:if>
		<c:if test="${empty userId}">
			<a href="/user/login_view">로그인</a>
		</c:if>
	</div>
</header>