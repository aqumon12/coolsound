<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrap">
	<div class="admin-header">
		<h1>Admin</h1>
			<c:if test="${adminId != null}">
			<li class="nav item"><a href="#" class="nav-link nav1">${userName}��</a></li>
			<li class="nav-item"><a href="/admin/sign_out" class="nav-link nav1">�α׾ƿ�</a></li>
			</c:if>
	</div>
</div>