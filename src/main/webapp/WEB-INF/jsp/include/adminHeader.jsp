<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrap">
	<div class="admin-header d-flex">
		<h1 class="admin"><a href="/admin/main_view">Admin</a></h1>
			<c:if test="${adminId != null}">
			<div class="gnb">
				<span>${adminName}´Ô</span>
				<span><a href="/admin/sign_out">·Î±×¾Æ¿ô</a></span>
			</div>
			</c:if>
			<c:if test="${adminId == null}">
			<div class="gnb">
				<span><a href="/admin/sign_in_view">·Î±×ÀÎ</a></span>
			</div>
			</c:if>
	</div>
</div>