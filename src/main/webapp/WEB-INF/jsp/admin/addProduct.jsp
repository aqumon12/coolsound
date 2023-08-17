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
							<select id="selectCategory">
								<option selected>--ī�װ� ����--</option>
								<option>�߶��</option>
								<option>��</option>
								<option>��/����</option>
								<option>R&B/Soul</option>
								<option>�ε�����</option>
								<option>Ʈ��Ʈ</option>
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
							<input type="text" id="price" name="price"> 
						</td>
					</tr>
					<tr>
						<th class="col1">*���</th>
						<td class="col2">
							<input type="text" name="stock" id="stock" maxlength="4">	
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
							<textarea rows="10" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<th class="col1">*�̹���</th>
						<td class="col2">
							��Ƽ�̹������ε�
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" id="addProductBtn" class="btn btn-secondary" value="����">
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