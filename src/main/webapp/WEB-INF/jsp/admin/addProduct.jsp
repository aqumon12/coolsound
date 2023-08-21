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
							<select id="selectCategory" name="selectCategory">
								<option value="1">발라드</option>
								<option value="2">댄스</option>
								<option value="3">랩/힙합</option>
								<option value="4">R&B/Soul</option>
								<option value="5">인디음악</option>
								<option value="6">트로트</option>
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
							<input type="number" id="price" name="price"> 
						</td>
					</tr>
					<tr>
						<th class="col1">*재고</th>
						<td class="col2">
							<input type="number" name="stock" id="stock" maxlength="4">	
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
							<textarea rows="10" cols="80" name="detail" id="detail"></textarea>
						</td>
					</tr>
					<tr>
						<th class="col1">*이미지1(썸네일)</th>
						<td class="col2">
							<input type="file" name="image1" id="image1" accept=".jpg, .jpeg, .png, .gif">
						</td>
					</tr>
					<tr>
						<th class="col1">*이미지2</th>
						<td class="col2">
							<input type="file" name="image2" id="image2" accept=".jpg, .jpeg, .png, .gif">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" id="addProductBtn" class="btn btn-secondary" value="상품등록">
		</div>
	</form>
</div>

<script>
$(document).ready(function() {
	$('#releaseDate').datepicker({
		  dateFormat:"yy-mm-dd"
	});
	
	$('#addProductForm').on('submit', function() {
		let name = $('#name').val().trim();
		let categoryId = $('#selectCategory option:selected').val();
		let artist = $('#artist').val().trim();
		let producer = $('#producer').val().trim();
		let price = $('#price').val().trim();
		let stock = $('#stock').val().trim();
		let releaseDate = $('#releaseDate').val();
		let detail = $('#detail').val();
		let image1 = $('#image1').val();
		let image2 = $('#image2').val();
		
		if (name == "") {
			alert("앨범명을 입력하세요");
			return false;
		}
		if (artist == "") {
			alert("가수명을 입력하세요");
			return false;
		}
		if (producer == "") {
			alert("제작사를 입력하세요");
			return false;
		}
		if (price == "") {
			alert("가격을 입력하세요");
			return false;
		}
		if (stock == "") {
			alert("재고를 입력하세요");
			return false;
		}
		if (releaseDate == "") {
			alert("발매일을 입력하세요");
			return false;
		}
		if (image1 == "") {
			alert("이미지1(썸네일)을 입력하세요");
			return false;
		}
			
		let ext1 = image1.split(".").pop().toLowerCase();
		if ($.inArray(ext1, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#image1').val("");
			return false;
		}
		if (image2 != "") {
			let ext2 = image2.split(".").pop().toLowerCase();
			if ($.inArray(ext2, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#image2').val("");
				return false;
			}	
		}
				
		let formData = new FormData();
		formData.append("name", name);
		formData.append("categoryId", categoryId);
		formData.append("artist", artist);
		formData.append("producer", producer);
		formData.append("price", price);
		formData.append("stock", stock);
		formData.append("releaseDate", releaseDate);
		formData.append("detail", detail);
		formData.append("image1", $('#image1')[0].files[0]);
		formData.append("image2", $('#image2')[0].files[0]);
		
		$.ajax({
			type:"post"
			, url:"/admin/add_product"
			, data:formData
			, enctype:"multipart/form-data"
			, processData:false
			, contentType:false
			, success: function(data) {
				if (data.code == 1) {
					alert('상품이 등록되었습니다.');
					location.href = "/admin/product_list_view";
				} else {
					alert("");
				}
			}
			, error:function(request, status, error) {
				alert("상품등록에 실패했습니다.");
			}
		});
	})
})
</script>