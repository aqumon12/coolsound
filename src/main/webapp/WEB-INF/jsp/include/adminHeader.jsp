<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrap">
	<div class="admin-header d-flex">
		<h1>Admin</h1>
			<c:if test="${adminId != null}">
			<span>${adminName}��</span>
			<span><a href="/admin/sign_out">�α׾ƿ�</a></span>
			</c:if>
	</div>
</div>