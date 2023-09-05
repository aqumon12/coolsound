<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COOLSOUND ADMIN</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<div>
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
								<input type="text" id="name" name="name" value="${product.name}">
								<input type="hidden" id="id" name="id" value="${product.id}">
							</td>
						</tr>
						<tr>
							<th class="col1">*카테고리</th>
							<td class="col2">
								<select id="selectCategory" name="selectCategory" data-category-id="${product.categoryId}">
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
								<input type="text" id="artist" name="artist" value="${product.artist}">
							</td>
						</tr>
						<tr>
							<th class="col1">*제작사</th>
							<td class="col2">
								<input type="text" id="producer" name="producer" value="${product.producer}">
							</td>
						</tr>
						<tr>
							<th class="col1">*가격</th>
							<td class="col2">
								<input type="number" id="price" name="price" value="${product.price}"> 
							</td>
						</tr>
						<tr>
							<th class="col1">*재고</th>
							<td class="col2">
								<input type="number" name="stock" id="stock" maxlength="4" value="${product.stock}">	
							</td>
						</tr>
						<tr>
							<th class="col1">*발매일</th>
							<td class="col2">
								
								<input type="text" name="releaseDate" id="releaseDate" value="${product.releaseDate}">
							</td>
						</tr>
						<tr>
							<th class="col1">*상세정보</th>
							<td class="col2">
								<textarea rows="10" cols="80" name="detail" id="detail">${product.detail}</textarea>
							</td>
						</tr>
						<tr>
							<th class="col1">*이미지1(썸네일)</th>
							<td class="col2">
								<label for="image1">
									<a class="btn btn-light">파일선택</a>
									<span id="imageName1">${product.image1}</span>
								</label>
								<input type="file" id="image1" class="d-none" accept=".jpg, .jpeg, .png, .gif">
							</td>
						</tr>
						<tr>
							<th class="col1">*이미지2</th>
							<td class="col2">
								<label for="image2">
									<a class="btn btn-light">파일선택</a>
									<span id="imageName2">${product.image2}</span>
								</label>
								<input type="file" id="image2" class="d-none" accept=".jpg, .jpeg, .png, .gif">
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" id="updateProductBtn" class="btn btn-secondary" value="상품수정">
			</div>
	</div>
</body>
<script>
$(document).ready(function() {
	$('#releaseDate').datepicker({
		  dateFormat:"yy-mm-dd"
	});
	
	let categoryId = $('#selectCategory').data('category-id');
	$('#selectCategory').val(categoryId).prop('selected', true);
	
	$('#image1').on('change', function(e) {
		let imageName = e.target.files[0].name;
	    $('#imageName1').html(imageName);
	});
	
	$('#image2').on('change', function(e) {
		let imageName = e.target.files[0].name;
	    $('#imageName2').html(imageName);
	});
	
	$('#updateProductBtn').on('click', function() {
		let id = $('#id').val();
		let name = $('#name').val().trim();
		let categoryId = $('#selectCategory').val();
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
		formData.append("id", id);
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
			, url:"/admin/a/update_product"
			, data:formData
			, enctype:"multipart/form-data"
			, processData:false
			, contentType:false
			, success: function(data) {
				if (data.code == 1) {
					alert('상품이 수정되었습니다.');
					location.href = "/admin/a/product_list_view";
				} 
			}
			, error:function(request, status, error) {
				alert("상품수정에 실패했습니다.");
			}
		});
	});
});
</script>