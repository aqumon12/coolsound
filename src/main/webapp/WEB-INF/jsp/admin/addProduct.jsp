<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div>
	<form id="addProductForm" method="post" action="/admin/add_product">
		<div class="product-info">
			<table class="product-tb">
				<colgroup>
					<col width="170">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="col1">*앨범명</th>
						<td class="col2">
							<input type="text" id="name" name="name">
						</td>
					</tr>
					<tr>
						<th class="col1">*카테고리</th>
						<td class="col2">
							<select id="selectCategory">
								<option selected>--카테고리 선택--</option>
								<option>발라드</option>
								<option>댄스</option>
								<option>랩/힙합</option>
								<option>R&B/Soul</option>
								<option>인디음악</option>
								<option>트로트</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="col1">*가수명</th>
						<td class="col2">
							<input type="text" id="artist" name="artist">
						</td>
					</tr>
					<tr>
						<th class="col1">*제작사</th>
						<td class="col2">
							<input type="text" id="producer" name="producer">
						</td>
					</tr>
					<tr>
						<th class="col1">*가격</th>
						<td class="col2">
							<input type="text" id="price" name="price"> 
						</td>
					</tr>
					<tr>
						<th class="col1">*재고</th>
						<td class="col2">
							<input type="text" name="stock" id="stock" maxlength="4">	
						</td>
					</tr>
					<tr>
						<th class="col1">*발매일</th>
						<td class="col2">
							<input type="text" name="releaseDate" id="releaseDate">
						</td>
					</tr>
					<tr>
						<th class="col1">*상세정보</th>
						<td class="col2">
							<textarea rows="10" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<th class="col1">*이미지</th>
						<td class="col2">
							멀티이미지업로드
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" id="addProductBtn" class="btn btn-secondary" value="수정">
		</div>
	</form>
</div>

<script>
$(document).ready(function() {
	$('#releaseDate').datepicker({
		  dateFormat:"yy-mm-dd"
	});
})
</script>