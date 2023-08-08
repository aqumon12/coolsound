<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="loginWrap">
	<div class="login-box">
		<h3>로그인</h3>
		<form id="loginForm" method="post" action="/user/sign_in">
			<div class="input-group">
				<ul class="frm-list">
					<li class="id">
						<label>
							<span>ID</span>
							<input type="text" id="loginId" name="loginId">
						</label>
					</li>
					<li class="password">
						<label>
							<span>PASSWORD</span>
							<input type="password" id="password" name="password">
						</label>
					</li>
				</ul>
			<input type="submit" id="loginBtn" class="btn" value="로그인">
			</div>
		</form>
	</div>
	<div class="sign-up-box">
		<p class="findIdPw">
			<a href="#">아이디/비밀번호 찾기</a>
		</p>
		<div class="">
			<a href="/user/sign_up_view" id="joinBtn">회원가입</a>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 로그인
	$("#loginForm").on('submit', function(e) {
		e.preventDefault();
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		
		if (loginId == "") {
			alert("회원 ID를 입력하세요");
			return false;
		}
		if (password =="") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		let url = $(this).attr('action');
		//alert(url);
		let params = $(this).serialize();
		//alert(params);
		$.post(url, params)
		.done(function(data) {
			if (data.code == 1) {
				location.href = "/shop/main_view";
			} else {
				alert(data.errorMessage);
				location.reload(true);
			}
			
		});
	});
});
</script>
