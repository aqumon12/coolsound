<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<form>
		<div class="person-info">
			<table class="person-tb">
				<colgroup>
					<col width="170">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="col1">*이름</th>
						<td class="col2"><input type="text" name="name" id="name">
						</td>
					</tr>
					<tr>
						<th class="col1">*아이디</th>
						<td class="col2"><input type="text" name="id" maxlength="10">
							<input class='but1' type="button" value="중복확인" onclick="">
						</td>
					</tr>
					<tr>
						<th class="col1">*비밀번호</th>
						<td class="col2"><input type="password" name="pwd"
							maxlength="16">
							<p>
								※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~
									16자리</span>로 입력이 가능합니다.
							</p></td>
					</tr>
					<tr>
						<th class="col1">*비밀번호 확인</th>
						<td class="col2"><input type="password" name="pwdCheck"
							maxlength="16"></td>
					</tr>
					<tr>
						<th class="col1">*이메일</th>
						<td class="col2"><input type="text" name="mailid"> <span
							class="a">@</span> <input type="text" name="email"> <select
							name="mailslc">
								<option value="self" selected>직접입력</option>
								<option value="naver">naver.com</option>
								<option value="gm">gmail.com</option>
								<option value="da">daum.com</option>
								<option value="yah">yahoo.com</option>
						</select> <input class='but2' type="button" value="이메일 중복확인" onclick="">
						</td>
					</tr>
					<tr>
						<th class="col1">*우편번호</th>
						<td class="col2">
							<input type="text" name="post" form="join_form" id="post" size="7" maxlength="15" readonly>	
							<a class="btn btn-check" href="#">우편번호 검색</a>				
						</td>
					</tr>
					<tr>
						<th class="col1">*집주소</th>
						<td class="col2">
							<input type="text" name="address1" form="join_form" id="address1" size="40" maxlength="100" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th class="col1">*상세주소</th>
						<td class="col2">
							<input type="text" name="address2" form="join_form" id="address2" size="40" maxlength="100">
						</td>
					</tr>
					<tr>
						<th class="col1">*연락처</th>
						<td class="col2">
							<input type="text" name="tel" form="join_form" id="tel" size="40" maxlength="100">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>