<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<form id="signUpForm" method="post" action="/user/sign_up">
		<div class="person-info">
			<table class="person-tb">
				<colgroup>
					<col width="170">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="col1">*이름</th>
						<td class="col2"><input type="text" id="name" name="name">
						</td>
					</tr>
					<tr>
						<th class="col1">*아이디</th>
						<td class="col2">
							<input type="text" id="loginId" name="loginId" maxlength="10">
							<input id='loginIdCheckBtn' type="button" value="중복확인" onclick="">
							<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
						</td>
					</tr>
					<tr>
						<th class="col1">*비밀번호</th>
						<td class="col2">
							<input type="password" id="password" name="password" maxlength="16">
							<div class="num">※비밀번호는 문자, 숫자, 특수문자(~!@#$%^&*)의 조합 8 ~ 15자리로 입력이 가능합니다.</div>
						</td>
					</tr>
					<tr>
						<th class="col1">*비밀번호 확인</th>
						<td class="col2">
							<input type="password" id="passwordCheck" maxlength="16">
						</td>
					</tr>
					<tr>
						<th class="col1">*이메일</th>
						<td class="col2">
							<input type="text" id="email" name="email"> 
						</td>
					</tr>
					<tr>
						<th class="col1">*우편번호</th>
						<td class="col2">
							<input type="text" name="post" id="post" size="7" maxlength="15" readonly>	
							<a id="postBtn" class="btn btn-check" href="#">우편번호 검색</a>				
						</td>
					</tr>
					<tr>
						<th class="col1">*집주소</th>
						<td class="col2">
							<input type="text" name="address1" id="address1" size="40" maxlength="100" readonly>
						</td>
					</tr>
					<tr>
						<th class="col1">*상세주소</th>
						<td class="col2">
							<input type="text" name="address2" id="address2" size="40" maxlength="100">
						</td>
					</tr>
					<tr>
						<th class="col1">*연락처</th>
						<td class="col2">
							<input type="text" name="tel" id="tel" size="40" maxlength="100">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" id="signUpBtn" class="btn" value="회원가입">
		</div>
	</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function() {
	// 아이디 중복확인
	$('#loginIdCheckBtn').on('click', function() {
		$('#idCheckOk').addClass("d-none");
		let loginId = $('#loginId').val().trim();
		
		if (loginId.length < 4) {
			alert("아이디를 4자이상 입력하셔야 합니다.");
			return;
		}
		
		$.ajax({
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
			,success:function(data) {
				if (data.isDuplicateId) {
					alert("이미 사용중인 ID입니다.");
					$('#loginId').val("");
					return;
				} else {
					$('#idCheckOk').removeClass("d-none");
				}
			}
			, error: function(request, status, error) {
				alert("중복확인에 실패했습니다.");
			}
		});
	});
	
	// 우편번호 검색 
	$('#postBtn').on('click', function() {
		  new daum.Postcode({
	            oncomplete: function(data) {
	            	document.getElementById("post").value = data.zonecode;
	                document.getElementById("address1").value = data.address;
	                $('#address2').focus();
	            }
	        }).open();
	});
	
	// 회원가입 
	$('#signUpForm').on('submit', function() {
		let name = $('#name').val().trim();
		let loginId = $('#loginId').val().trim(); 
		let password = $('#password').val(); 
		let passwordCheck = $('#passwordCheck').val();
		let email = $('#email').val().trim(); 
		let post = $('#post').val(); 
		let address1 = $('#address1').val(); 
		let address2 = $('#address2').val().trim(); 
		let tel = $('#tel').val().trim().toString(); 
		var passRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var telRule = /^(010){1}[0-9]{3,4}[0-9]{4}$/;
		
		if (name == "") {
			alert("이름을 입력하세요.");
			return false;
		}
		if (loginId == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!passRule.test(password)) {
			alert("비밀번호형식이 잘못되었습니다.");
			return false;
		}
		if (passwordCheck == "") {
			alert("비밀번호확인을 입력하세요.");
			return false;
		}
		if (password != passwordCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if (email == "") {
			alert("이메일을 입력하세요.");
			return false;
		}
		if (!emailRule.test(email)) {
			alert("이메일형식이 잘못되었습니다.");
			return false;
		}
		if (post == "") {
			alert("우편번호를 입력하세요.");
			return false;
		}
		if (address2 == "") {
			alert("상세주소를 입력하세요.");
			return false;
		}
		if (tel == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		if (!telRule.test(tel)) {
			alert("휴대폰번호형식이 잘못되었습니다.\n 예)010-000(0)-0000");
			return false;
		}
		
		let url = $(this).attr('action');
		//console.log(url);
		let params = $(this).serialize();
		//console.log(params);
		
		$.post(url, params) 
			.done(function(data) {
				if (data.code == 1) {
				alert("가입을 환영합니다! 로그인을 해주세요.");
				location.href = "/user/sign_in_view";
			} else {
				alert(data.errorMessage);
			}
		});
	});
	
});
</script>