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
						width="440" alt="��ǰ�̹���">
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
								<div class="tb-l">�ǸŰ�</div>
							</th>
							<td>
								<div class="tb-l" id="price" data-price="${product.price}">${product.price}</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="tb-l">��Ƽ��Ʈ</div>
							</th>
							<td>
								<div class="tb-l">${product.artist}</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="tb-l">���ۻ�</div>
							</th>
							<td>
								<div class="tb-l">${product.producer}</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="tb-l">�߸���</div>
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
														<input type="text" id="count" name="count" value="1"
															size="4" style="text-align: right; float: left;" readonly>
														<a href="#" class="btn-up"> <img
															src="/static/images/basket_up.gif" alt="��������" border="0">
														</a> <a href="#" class="btn-dw"> <img
															src="/static/images/basket_down.gif" alt="��������"
															border="0">
														</a>
													</div> 
													<strong> 
														<span class="total-price">${product.price}��</span>
													</strong>
												</li>
											</ul>
										</div>
										<div class="inner-price">
											<span>�� ��ǰ �ݾ�</span> 
											<strong class="total-price">${product.price}��</strong>
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
					<a href="" class="buy">��ǰ����</a>
					<a href="#" class="add-cart" data-product-id="${product.id}">��ٱ��� �߰�</a>
				</div>
			</div>
		</div>
	</div>
		<div class="d-flex justify-content-center">
			<img src="/static/images/product_detail.gif" alt="������">
		</div>
		<div>
			------�̹���-------
			<!-- �̹����߰� -->
		</div>
		<p>
			------�󼼼���------
			<!-- ��ǰ �� ���� -->
		</p>
		<div class="review-write">
				---- ���� �Ѹ��� ----
		</div>
</div>

<script>
	$(document).ready(function() {
		// ���� ����
		$('.btn-up').on('click', function(e) {
			e.preventDefault();
			let count = $('#count').val();
			let price = $('#price').data('price');
			let totalPrice = $('.total-price').val();
			count++;
			$('#count').val(count);
			totalPrice = count * price;
			$('.total-price').text(totalPrice + "��");
		});

		// ���� ����
		$('.btn-dw').on('click', function(e) {
			e.preventDefault();
			let count = $('#count').val();
			if (count <= 1) {
				alert("�ּ� ���� ���� ������ 1���Դϴ�.");
				return;
			}

			let price = $('#price').data('price');
			let totalPrice = $('.total-price').val();
			count--;
			$('#count').val(count);
			totalPrice = count * price;
			$('.total-price').text(totalPrice + "��");
		});
		
		// ��ٱ��� �߰�
		$('.add-cart').on('click', function(e) {
			e.preventDefault();
			let productId = $(this).data('product-id');
			let count = $('#count').val();
			
			$.ajax({
				type:"post"
				, url:"/shop/add_to_cart"
				, data:{"productId":productId, "count":count}
				, success: function(data) {
					if (data.code == 1) {
						alert("��ٱ����߰�");
					}
				}
			});
		});
	});
</script>