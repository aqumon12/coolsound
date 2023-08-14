<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="cartWrap">
	<div class="cart-header">
		<img src="/static/images/cart_page.gif" alt="장바구니">
	</div>
	<div class="cart-body">
		<div>
			<img src="/static/images/cart_fill.gif" alt="장바구니2">
		</div>
		<div class="table-cart">
			<table>
				<colgroup>
					<col width="60">
					<col width="80">
					<col width="500">
					<col width="80">
					<col width="90">
					<col width="90">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><div class="tb-center">번호</div></th>
						<th scope="col"><div class="tb-center">사진</div></th>
						<th scope="col"><div class="tb-center">제품명</div></th>
						<th scope="col"><div class="tb-center">수량</div></th>
						<th scope="col"><div class="tb-right">가격</div></th>
						<th scope="col"><div class="tb-center">취소</div></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="tb-right">
								<span class="total-price" >
									<c:set var = "total" value = "0" />
									<c:forEach items="${list}" var="cartView">
									<c:set var= "total" value="${total + cartView.product.price * cartView.cart.count}"/>
									</c:forEach> 
								총 구매금액 : ${total}원 + 배송료 2,500원 = </span>
								<strong><span class="MK_chg_total_price MK_change_price">${total +2500}원</span></strong> 
							</div>
						</td>
					</tr>
				</tfoot>
				<tbody>
				<c:forEach items="${list}"  var="cartView" varStatus="status">
					<tr>
						<td><div class="tb-center" id="count">${status.count}</div></td>
						<td>
							<div class="tb-center">
								<div class="thumb">
									<a href="/shop/detail_view?id=${cartView.cart.productId}">
										<img src="${cartView.product.image1}" alt="상품 섬네일">
									</a>
								</div>
							</div>
						</td>
						<td>
							<div class="tb-left">
								<a	href="/shop/detail_view?id=${cartView.product.id}">
								${cartView.product.artist} - ${cartView.product.name}
								</a>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<div class="opt-spin">
									<input type="text" id="count" value="${cartView.cart.count}" size="4" style="text-align: right; float: left;" readonly>
									<a href="#" class="btn-up" data-product-id="${cartView.product.id}"> 
										<img src="/static/images/basket_up.gif" alt="수량증가" border="0" >
									</a> 
									<a href="#" class="btn-dw" data-product-id="${cartView.product.id}"> 
										<img src="/static/images/basket_down.gif" alt="수량감소" border="0" >
									</a>
								</div>
							</div>
						</td>
						<td><div class="tb-right tb-bold tb-price">
								<span id="price" >${cartView.product.price * cartView.cart.count} </span>원
								
							</div></td>
						
						<td>
							<div class="tb-center">
								<span class="d-block">
									<a href="#" class="delete-btn" data-cart-id="${cartView.cart.id}">
										<img src="/static/images/btn_del.gif" alt="삭제">
									</a>
								</span>
							</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="delivery">
		<span class="MK_delivery_message">모든 주문에 배송료 <span
			class="MK_chg_delivery_message">2,500</span>원을 청구합니다.
		</span>
	</div>

</div>
<script>
$(document).ready(function() {
	// 수량 증가
	$('.btn-up').on('click', function(e) {
		e.preventDefault();
		let count = $(this).prev().val();
		let price = $('#price').data('price');
		let productId = $(this).data('product-id');
		count++;
		$(this).prev().val(count);
		totalPrice = count * price;
		
		$.ajax({
			type:"post"
			, url:"/cart/update_cart"
			, data:{"productId":productId, "count":count}
			, success:function(data) {
				if (data.code == 1) {
					location.reload(true);
				}
			}
		});
	});

	// 수량 감소
	$('.btn-dw').on('click', function(e) {
		e.preventDefault();
		let count = $(this).siblings('#count').val();
		console.log(count)
		if (count <= 1) {
			alert("최소 구매 가능 수량이 1개입니다.");
			return;
		}

		let price = $('#price').data('price');
		let totalPrice = $('.total-price').val();
		let productId = $(this).data('product-id');
		count--;
		$(this).siblings('#count').val(count);
		
		$.ajax({
			type:"post"
			, url:"/cart/update_cart"
			, data:{"productId":productId, "count":count}
			, success:function(data) {
				if (data.code == 1) {
					location.reload(true);
				}
			}
		});
	});
	
	$('.delete-btn').on('click', function() {
		let cartId = $(this).data('cart-id');
		if (confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				type:"delete"
				, url:"/cart/delete_cart"
				, data:{"cartId":cartId}
				, success:function(data) {
					if (data.code == 1) {
						location.reload(true);
					}
				}
				, error:function(request, status, error) {
					alert("장바구니삭제에 실패했습니다.");
				}
			});
			
		}
	});
})
</script>