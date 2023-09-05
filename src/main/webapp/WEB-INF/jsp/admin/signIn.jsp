<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="adLoginWrap">
	<div class="login-box">
		<h3>로그인</h3>
		<form id="adLoginForm" method="post" action="/admin/sign_in">
			<div class="input-group">
				<ul class="frm-list">
					<li class="id">
						<label>
							<span>ID</span>
							<input type="text" id="loginId" name="loginId" class="ml-2">
						</label>
					</li>
					<li class="password">
						<label>
							<span>PW</span>
							<input type="password" id="password" name="password">
						</label>
					</li>
				</ul>
			<input type="submit" id="loginBtn" class="btn btn-secondary ml-3" value="로그인">
			</div>
		</form>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#adLoginForm').on('submit', function(e) {
		e.preventDefault();
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		
		if (loginId == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		let url = $(this).attr("action");
		//console.log(url);
		let params = $(this).serialize();
		//console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == "성공") {
				window.location.assign("/admin/a/main_view");
			} else {
				alert(data.errorMessage);
				location.reload(true);
			}
		});
	})
});
</script>