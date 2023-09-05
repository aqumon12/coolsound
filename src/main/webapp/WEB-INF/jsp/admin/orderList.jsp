<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="order-list">
	<h1>주문관리</h1>
	<select>
		<option>구매자명</option>
	</select>
	<input type="text">
	<a class="btn btn-secondary">검색</a>
	<table class="table">
		<thead>
			<tr>
				<th>구매자</th>
				<th>주문정보</th>
				<th>결제금액</th>
				<th>주문일자</th>
				<th>상태</th>
				<th>상태변경</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${OrderViewList}" var="orderView" varStatus="status">
			<tr>
				<td><a>${orderView.userEntity.name}</a></td>
				<td><a>${orderView.productList[0].artist}-${orderView.productList[0].name} 외 ${fn:length(orderView.productList)-1}개</a></td>
				<td><a>${orderView.order.price}원</a></td>
				<td>
					<a>
					<fmt:parseDate value="${orderView.order.createdAt}" var="parsedCreatedAt" pattern="yyyy-MM-dd'T'HH:mm:ss" />
					<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</a>
				</td>
				<td><a>${orderView.order.state}</a></td>
				<td>
					<select class="select-state">
						<option>주문확인</option>
						<option>배송전</option>
						<option>배송중</option>
						<option>배송완료</option>
					</select>
					<a class="update-btn btn btn-secondary" data-order-id="${orderView.order.id}">변경</a>
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
				alert("수정되었습니다.");
				location.reload(true);
			}
			, error:function(request, error, status) {
				alert("수정실패")
			}
		})
	});
});
</script>
