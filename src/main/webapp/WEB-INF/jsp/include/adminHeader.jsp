<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrap">
	<div class="admin-header d-flex">
		<h1>Admin</h1>
			<c:if test="${adminId != null}">
			<span>${adminName}´Ô</span>
			<span><a href="/admin/sign_out">·Î±×¾Æ¿ô</a></span>
			</c:if>
	</div>
</div>