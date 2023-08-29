<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="productDetail">
	<div class="page-body d-flex">
		<div class="thumb-wrap">
			<div class="thumb-info">
				<div class="thumb">
					<img src="${product.image1}" width="440" height="400" alt="상품이미지">
				</div>
			</div>
		</div>
		<div class="info">
			<h3 class="prd-title">[${product.producer}] ${product.artist} -
				${product.name}</h3>
			<div class="table-prd">
				<table>
					<colgroup>
						<col width="90">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<div class="tb-l">판매가</div>
							</th>
							<td>
								<div class="tb-l" id="price" data-price="${product.price}">${product.price}</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="tb-l">아티스트</div>
							</th>
							<td>
								<div class="tb-l">${product.artist}</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="tb-l">제작사</div>
							</th>
							<td>
								<div class="tb-l">${product.producer}</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="tb-l">발매일</div>
							</th>
							<td>
								<div class="tb-l">
									<fmt:formatDate pattern="yyyy/MM/dd"
										value="${product.releaseDate}" />
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="stock-wrap">
									<div class="inner-stock-wrap">
										<div class="inner-stock">
											<ul>
												<li class="d-flex"><span>${product.artist} -
														${product.name}</span>
													<div class="count-ctrl">
														<input type="text" id="count" name="count" value="1" size="4" style="text-align: right; float: left;" readonly>
														<a href="#" class="btn-up"> 
															<img src="/static/images/basket_up.gif" alt="수량증가" border="0">
														</a> 
														<a href="#" class="btn-dw"> 
															<img src="/static/images/basket_down.gif" alt="수량감소" border="0">
														</a>
													</div> 
													<strong> 
														<span class="total-price">${product.price}원</span>
													</strong>
												</li>
											</ul>
										</div>
										<div class="inner-price">
											<span>총 상품 금액</span> 
											<strong class="total-price">${product.price}원</strong>
										</div>
									</div>
								</div>
							</td>

						</tr>
					</tbody>
				</table>
			</div>
			<div class="prd-btns">
				<div class="btn-area">
					<a href="#" class="buy" data-product-id="${product.id}">상품구매</a>
					<a href="#" class="add-cart" data-product-id="${product.id}">장바구니 추가</a>
				</div>
			</div>
		</div>
	</div>
		<div class="d-flex justify-content-center">
			<img src="/static/images/product_detail.gif" alt="디테일">
		</div>
		<div>
			------이미지-------
			<!-- 이미지추가 -->
		</div>
		<p>
			------상세설명------
			<!-- 상품 상세 설명 -->
		</p>
		<div class="review-write">
				---- 리뷰 뿌리기 ----
		</div>
</div>

<script>
function cart_confirm() {
	var cartConfirm = confirm("이미 장바구니에 상품이 담겨있습니다.\n수량 조정은 장바구니에서 가능합니다. 장바구니로 이동하시겠습니까?");
	if (cartConfirm) {
		location.href = "/user/cart_view";
	}		
}
$(document).ready(function() {
	// 수량 증가
	$('.btn-up').on('click', function(e) {
		e.preventDefault();
		let count = $('#count').val();
		let price = $('#price').data('price');
		let totalPrice = $('.total-price').val();
		count++;
		$('#count').val(count);
		totalPrice = count * price;
		$('.total-price').text(totalPrice + "원");
	});

	// 수량 감소
	$('.btn-dw').on('click', function(e) {
		e.preventDefault();
		let count = $('#count').val();
		if (count <= 1) {
			alert("최소 구매 가능 수량이 1개입니다.");
			return;
		}

		let price = $('#price').data('price');
		let totalPrice = $('.total-price').val();
		count--;
		$('#count').val(count);
		totalPrice = count * price;
		$('.total-price').text(totalPrice + "원");
	});
	
	// 장바구니 추가
	$('.add-cart').on('click', function(e) {
		e.preventDefault();
		let productId = $(this).data('product-id');
		let count = $('#count').val();
		
		$.ajax({
			type:"post"
			, url:"/cart/add_to_cart" 
			, data:{"productId":productId, "count":count}
			, success: function(data) {
				if (data.code == 1) {
					alert(count + "개의 상품이 장바구니에 담겼습니다.");
					location.reload(true);
				} else {
					alert(data.errorMessage)
				}
			}
			, error: function(reqeust, status, error) {
				alert('이미 장바구니에 상품이 담겨있습니다.\n수량 조정은 장바구니에서 가능합니다.');
				cart_confirm();
			}
		});
	});
	
	// 상품 구매
	$('.buy').on('click', function() {
		let productId = $(this).data('product-id');
		let count = $('#count').val();
		   
		$.ajax({
			type:"post"
			, url:"/cart/add_to_cart" 
			, data:{"productId":productId, "count":count}
			, success: function(data) {
				if (data.code == 1) {
					alert("장바구니에 담겨있는 상품도 함께 주문됩니다.\n원치 않으실 경우 장바구니를 비워주세요.");
					location.href = "/shop/order_view";
				} else {
					alert(data.errorMessage)
				}
			}
			, error: function(reqeust, status, error) {
				alert("장바구니에 담겨있는 상품도 함께 주문됩니다.\n원치 않으실 경우 장바구니를 비워주세요.");
				cart_confirm();
			}
		});
	});
});
</script>