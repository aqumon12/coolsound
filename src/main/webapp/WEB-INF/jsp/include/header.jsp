<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-top">
	<div class="top-area clear">
		<nav class="inner">
			<ul class="nav gnb clear">
			<c:choose>
				<c:when test="${userId == null}">
				<li class="nav-item"><a href="/user/sign_in_view" class="nav-link nav1">로그인</a></li>
				<li class="nav-item"><a href="/user/sign_up_view" class="nav-link nav1">회원가입</a></li>
				</c:when>
				<c:otherwise>
				<li class="nav item"><a href="#" class="nav-link nav1">${userName}님</a></li>
				<li class="nav-item"><a href="/user/sign_out" class="nav-link nav1">로그아웃</a></li>
				</c:otherwise>
				</c:choose>
				<li class="nav-item"><a href="/user/cart_view" class="nav-link nav1">장바구니</a></li>
				<li class="nav-item"><a href="/user/myPage_view" class="nav-link nav1">마이페이지</a></li>
			</ul>
		</nav>
	</div>
</div>
<div class="header-mid">
	<div class="mid-area">
		<div class="bi pl-4">
			<a href="/shop/main_view">
				<img src="/static/images/logo_top.jpg" width="130" alt="coolsound">
			</a>
		</div>
		<div class="search-area">
		<div class="search-box">
			<input name="search" class="search-word" onkeyup="enterkey();">
			<button class="btn" id="searchBtn">
				<img src="/static/images/btn_search.png" alt="검색">
			</button>
		</div>
		</div>
	</div>
</div>
<script>
function enterkey() {
	if (window.event.keyCode == 13) {
		$("#searchBtn").click();
		}
	}
$(document).ready(function() {
	$('#searchBtn').on('click', function() {
		let search = $('.search-word').val().trim();
		if (search == "") {
			alert('검색어를 입력해주세요!');
			return false;
		}
	
		window.location.href = "/shop/search_view?search=" + encodeURI(search);
	})
});
</script>