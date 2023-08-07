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
						<td class="col1">*아이디</td>
						<td class="col2"><input type="text" name="id" maxlength="10">
							<input class='but1' type="button" value="중복확인" onclick="">
						</td>
					</tr>
					<tr>
						<td class="col1">*비밀번호</td>
						<td class="col2"><input type="password" name="pwd"
							maxlength="16">
							<p>
								※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~
									16자리</span>로 입력이 가능합니다.
							</p></td>
					</tr>
					<tr>
						<td class="col1">비밀번호 확인</td>
						<td class="col2"><input type="password" name="pwdCheck"
							maxlength="16"></td>
					</tr>
					<tr>
						<td class="col1">이메일</td>
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
				</tbody>
			</table>
		</div>
	</form>
</div>