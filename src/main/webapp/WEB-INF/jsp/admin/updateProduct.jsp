<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<form id="updateProductForm" method="post" action="/admin/add_product">
			<div class="product-info">
				<table class="product-tb">
					<colgroup>
						<col width="170">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th class="col1">*�ٹ���</th>
							<td class="col2">
								<input type="text" id="name" name="name" value="${product.name}">
							</td>
						</tr>
						<tr>
							<th class="col1">*ī�װ���</th>
							<td class="col2">
								<select id="selectCategory" name="selectCategory" data-category-id="${product.categoryId}">
									<option value="1">�߶��</option>
									<option value="2">����</option>
									<option value="3">��/����</option>
									<option value="4">R&B/Soul</option>
									<option value="5">�ε�����</option>
									<option value="6">Ʈ��Ʈ</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="col1">*������</th>
							<td class="col2">
								<input type="text" id="artist" name="artist" value="${product.artist}">
							</td>
						</tr>
						<tr>
							<th class="col1">*���ۻ�</th>
							<td class="col2">
								<input type="text" id="producer" name="producer" value="${product.producer}">
							</td>
						</tr>
						<tr>
							<th class="col1">*����</th>
							<td class="col2">
								<input type="number" id="price" name="price" value="${product.price}"> 
							</td>
						</tr>
						<tr>
							<th class="col1">*���</th>
							<td class="col2">
								<input type="number" name="stock" id="stock" maxlength="4" value="${product.stock}">	
							</td>
						</tr>
						<tr>
							<th class="col1">*�߸���</th>
							<td class="col2">
								
								<input type="text" name="releaseDate" id="releaseDate" value="${product.releaseDate}">
							</td>
						</tr>
						<tr>
							<th class="col1">*������</th>
							<td class="col2">
								<textarea rows="10" cols="80" name="detail" id="detail">${product.detail}</textarea>
							</td>
						</tr>
						<tr>
							<th class="col1">*�̹���1(�����)</th>
							<td class="col2">
								<label for="image1">
									<a class="btn btn-light">���ϼ���</a>
									<span id="imageName1">${product.image1}</span>
								</label>
								<input type="file" name="image1" id="image1" class="d-none" accept=".jpg, .jpeg, .png, .gif">
							</td>
						</tr>
						<tr>
							<th class="col1">*�̹���2</th>
							<td class="col2">
								<label for="image2">
									<a class="btn btn-light">���ϼ���</a>
									<span id="imageName2">${product.image2}</span>
								</label>
								<input type="file" name="image2" id="image2" class="d-none" accept=".jpg, .jpeg, .png, .gif">
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" id="addProductBtn" class="btn btn-secondary" value="��ǰ����">
			</div>
		</form>
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
	
	$()
});
</script>