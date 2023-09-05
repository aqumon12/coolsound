<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="product-list">
	<h1>��ǰ���</h1>
	<span>��ǰ�˻�</span>
	<input type="text">
	<a class="btn btn-secondary">�˻�</a>
	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th>��ǰ��</th>
				<th>����</th>
				<th>���</th>
				<th>�����</th>
				<th>������</th>
				<th>����</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${productList}" var="product" varStatus="status">
			<tr>
				<td><a>${status.count}</a></td>
				<td><a>${product.artist} - ${product.name}</a></td>
				<td><a>${product.price}</a></td>
				<td><a>${product.stock}</a></td>
				<td>
					<a>
						<fmt:parseDate value="${product.createdAt}" var="parsedCreatedAt" pattern="yyyy-MM-dd'T'HH:mm:ss" />
						<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</a>
				</td>
				<td>
					<a>
						<fmt:parseDate value="${product.updatedAt}" var="parsedUpdatedAt" pattern="yyyy-MM-dd'T'HH:mm:ss" />
						<fmt:formatDate value="${parsedUpdatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</a>
				</td>
				<td><a class="updateBtn btn btn-secondary" data-product-id="${product.id}">����</a></td>
				<td><a class="deleteBtn btn btn-light">����</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(document).ready(function() {
	$(".updateBtn").on('click', function() {
		let productId = $(this).data('product-id');
		window.open("/admin/a/update_product_view?id="+ productId, "��ǰ ����", "width=1000");
	});
});
</script>