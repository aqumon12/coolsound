<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="productDetail">
	<div class="page-body d-flex">
		<div class="thumb-wrap">
			<div class="thumb-info">
				<div class="thumb">
					<img
						src="https://cdn.pixabay.com/photo/2023/08/02/18/21/yoga-8165759_1280.jpg"
						width="440" alt="상품이미지">
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
													<div class="amt-ctrl">
														<input type="text" id="amount" name="amount" value="1"
															size="4" style="text-align: right; float: left;">
														<a href="#" class="btn-up"> <img
															src="/static/images/basket_up.gif" alt="수량증가" border="0">
														</a> <a href="#" class="btn-dw"> <img
															src="/static/images/basket_down.gif" alt="수량감소"
															border="0">
														</a>
													</div> <strong> <span class="total-price">${product.price}원</span>
												</strong></li>
											</ul>
										</div>
										<div class="inner-price">
											<span>총 상품 금액</span> <strong class="total-price">${product.price}원</strong>
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
					<a class="buy">상품구매</a> <a class="add-cart">장바구니 추가</a>
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
	$(document).ready(function() {
		// 수량 증가
		$('.btn-up').on('click', function(e) {
			e.preventDefault();
			let amount = $('#amount').val();
			let price = $('#price').data('price');
			let totalPrice = $('.total-price').val();
			amount++;
			$('#amount').val(amount);
			totalPrice = amount * price;
			$('.total-price').text(totalPrice + "원");
		});

		// 수량 감소
		$('.btn-dw').on('click', function(e) {
			e.preventDefault();
			let amount = $('#amount').val();
			if (amount <= 0) {
				return;
			}

			let price = $('#price').data('price');
			let totalPrice = $('.total-price').val();
			amount--;
			$('#amount').val(amount);
			totalPrice = amount * price;
			$('.total-price').text(totalPrice + "원");
		});
	});
</script>