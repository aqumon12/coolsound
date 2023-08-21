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
						<th class="col1">*�ٹ���</th>
						<td class="col2">
							<input type="text" id="name" name="name">
						</td>
					</tr>
					<tr>
						<th class="col1">*ī�װ�</th>
						<td class="col2">
							<select id="selectCategory" name="selectCategory">
								<option value="1">�߶��</option>
								<option value="2">��</option>
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
							<input type="text" id="artist" name="artist">
						</td>
					</tr>
					<tr>
						<th class="col1">*���ۻ�</th>
						<td class="col2">
							<input type="text" id="producer" name="producer">
						</td>
					</tr>
					<tr>
						<th class="col1">*����</th>
						<td class="col2">
							<input type="number" id="price" name="price"> 
						</td>
					</tr>
					<tr>
						<th class="col1">*���</th>
						<td class="col2">
							<input type="number" name="stock" id="stock" maxlength="4">	
						</td>
					</tr>
					<tr>
						<th class="col1">*�߸���</th>
						<td class="col2">
							<input type="text" name="releaseDate" id="releaseDate">
						</td>
					</tr>
					<tr>
						<th class="col1">*������</th>
						<td class="col2">
							<textarea rows="10" cols="80" name="detail" id="detail"></textarea>
						</td>
					</tr>
					<tr>
						<th class="col1">*�̹���1(�����)</th>
						<td class="col2">
							<input type="file" name="image1" id="image1" accept=".jpg, .jpeg, .png, .gif">
						</td>
					</tr>
					<tr>
						<th class="col1">*�̹���2</th>
						<td class="col2">
							<input type="file" name="image2" id="image2" accept=".jpg, .jpeg, .png, .gif">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" id="addProductBtn" class="btn btn-secondary" value="��ǰ���">
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
			alert("�ٹ����� �Է��ϼ���");
			return false;
		}
		if (artist == "") {
			alert("�������� �Է��ϼ���");
			return false;
		}
		if (producer == "") {
			alert("���ۻ縦 �Է��ϼ���");
			return false;
		}
		if (price == "") {
			alert("������ �Է��ϼ���");
			return false;
		}
		if (stock == "") {
			alert("��� �Է��ϼ���");
			return false;
		}
		if (releaseDate == "") {
			alert("�߸����� �Է��ϼ���");
			return false;
		}
		if (image1 == "") {
			alert("�̹���1(�����)�� �Է��ϼ���");
			return false;
		}
			
		let ext1 = image1.split(".").pop().toLowerCase();
		if ($.inArray(ext1, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
			alert("�̹��� ���ϸ� ���ε� �� �� �ֽ��ϴ�.");
			$('#image1').val("");
			return false;
		}
		if (image2 != "") {
			let ext2 = image2.split(".").pop().toLowerCase();
			if ($.inArray(ext2, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert("�̹��� ���ϸ� ���ε� �� �� �ֽ��ϴ�.");
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
					alert('��ǰ�� ��ϵǾ����ϴ�.');
					location.href = "/admin/product_list_view";
				} else {
					alert("");
				}
			}
			, error:function(request, status, error) {
				alert("��ǰ��Ͽ� �����߽��ϴ�.");
			}
		});
	})
})
</script>