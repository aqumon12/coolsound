<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="order-list">
	<h1>�ֹ�����</h1>
	<select>
		<option>�����ڸ�</option>
	</select>
	<input type="text">
	<a class="btn btn-secondary">�˻�</a>
	<table class="table">
		<thead>
			<tr>
				<th>������</th>
				<th>�ֹ�����</th>
				<th>�����ݾ�</th>
				<th>�ֹ�����</th>
				<th>����</th>
				<th>���º���</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${OrderViewList}" var="orderView" varStatus="status">
			<tr>
				<td><a>${orderView.userEntity.name}</a></td>
				<td><a>${orderView.productList[0].artist}-${orderView.productList[0].name} �� ${fn:length(orderView.productList)-1}��</a></td>
				<td><a>${orderView.order.price}��</a></td>
				<td>
					<a>
					<fmt:parseDate value="${orderView.order.createdAt}" var="parsedCreatedAt" pattern="yyyy-MM-dd'T'HH:mm:ss" />
					<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</a>
				</td>
				<td><a>${orderView.order.state}</a></td>
				<td>
					<select class="select-state">
						<option>�ֹ�Ȯ��</option>
						<option>�����</option>
						<option>�����</option>
						<option>��ۿϷ�</option>
					</select>
					<a class="update-btn btn btn-secondary" data-order-id="${orderView.order.id}">����</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script>
$(document).ready(function() {
	$('.update-btn').on('click', function() {
		let state = $('.select-state').val();
		let orderId = $(this).data('order-id');
		
		$.ajax({
			type:"post"
			, url:"/order/update_order"
			, data:{'state':state, 'orderId':orderId}
			, success:function() {
				alert("�����Ǿ����ϴ�.");
				location.reload(true);
			}
			, error:function(request, error, status) {
				alert("��������")
			}
		})
	});
});
</script>
