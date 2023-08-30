<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<div id="order">
	<h2>주문/결제</h2>
	<div class="page-body">
		<form id="orderForm" method="post" action="/user/add_order">
			<h3>주문리스트</h3>
			<div class="tbl-order">
				<table>
					<colgroup>
						<col width="140px">
						<col width="*">
						<col width="110px">
						<col width="120px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">사진</th>
							<th scope="col">상품</th>
							<th scope="col">수량</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody>
					<c:set var = "total" value = "0" />
					<c:forEach items="${list}" var="prd">
					<c:set var = "total" value = "${total + prd.cart.count * prd.product.price}" />
						<tr class="nbg">
							<td>
								<div class="tb-center">
									<div class="thumb">
										<img src="${prd.product.image1}" width="100" height="100">
									</div>
								</div>
							</td>
							<td>
								<div class="tb-left">
									<a href="#">
										${prd.product.artist} - ${prd.product.name}
									</a>
								</div>
							</td>
							<td>
								<div class="tb-center">${prd.cart.count}</div>
							</td>
							<td>
								<div class="tb-center font-weight-bold">${prd.cart.count * prd.product.price}원</div>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<h3>배송 정보</h3>
			<div class="tbl-order">
				<table>
					<colgroup>
                    	<col style="width: 130px">
                    	<col>
                	</colgroup>
                	<tbody>
                		<tr>
                			<th scope="row">이름</th>
                			<td colspan="3">
                				${userEntity.name}
                				<input type="hidden" value="${userEntity.name}">
                			</td>
                		</tr>
                		<tr>
                			<th scope="row">연락처</th>      			
                			<td colspan="3">
                				${userEntity.tel}
                				<input type="hidden" value="${userEntity.tel}">
                			</td>
                		</tr>
                		<tr>
                			<th scope="row">주소</th>
                			<td colspan="3">
                				<div>
                					<input type="radio" value="home" name="place" checked>자택
                					<input type="radio" value="new" name="place">신규 배송지
                					<div>
	                					<input type="text" name="post" id="post" size="6" class="w60" value="${userEntity.post}" readonly>	
										<a id="postBtn" class="btn btn-white" href="#">우편번호 검색</a>
									</div>
									<div>
										<input type="text" name="address1" id="address1" size="50" value="${userEntity.address1}" readonly>
										<input type="text" name="address2" id="address2" size="50" value="${userEntity.address2}">
									</div>
                				</div>
                			</td>
                		</tr>
                		<tr>
                			<th scope="row">주문메세지<br>(50자내외)</th>
                			<td colspan="3">
                				<textarea name="request" id="request" cols="50" rows="5"></textarea>
                			</td>
                		</tr>
                	</tbody>
				</table>
			</div>
			<h3>결제금액</h3>
			<div class="tbl-pay">
				<table>
	                <colgroup>
	                    <col style="width: 34%">
	                    <col style="width: 33%">
	                    <col style="width: 33%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">상품금액</th>
	                        <th scope="col">배송비</th>
	                        <th scope="col">결제 예정금액</th>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div class="base">
	                            <fmt:formatNumber type="number" groupingUsed="true" value="${total}" var="total-price"/>
	                                <strong>${total-price}원</strong>
	                                <input name="price" value="${total-price}" class="d-none">
	                            </div>
	                        </td>
	                        <td>
	                            <div class="base">
	                            	<a class="plus"><img src="/static/images/bul_h23_plus.png" alt="plus"></a>
	                                <strong>2,500원</strong>
	                            </div>
	                        </td>
	                        <td>
	                            <div class="base">
	                                <a class="equal"><img src="/static/images/bul_h23_equal.png" alt="equal"></a>
	                                <strong><fmt:formatNumber type="number" groupingUsed="true" value="${total + 2500}" />원</strong>
	                            </div>
	                        </td>
	                    </tr>
	                </thead>
	        	</table>
			</div>
			<div id="paybutton">                                
				<input type="image" src="/static/images/order_pay_ok.gif" alt="제출버튼">
				
                <a href="#">
                	<img src="/static/images/order_pay_cancel.gif" alt="주문취소">
                </a>
            </div>
		</form>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function() {
	$('#postBtn').on('click', function() {
		  new daum.Postcode({
	            oncomplete: function(data) {
	            	document.getElementById("post").value = data.zonecode;
	                document.getElementById("address1").value = data.address;
	                $('#address2').focus();
	            }
	        }).open();
	});
	
	$('input[name=place]').on('change', function() {
		var type = $(this).val();
		if (type == 'home') {
			document.getElementById("postBtn").style.display = "none";
			document.getElementById("post").value = ${userEntity.post};
            document.getElementById("address1").value = "${userEntity.address1}";
            document.getElementById("address2").value = "${userEntity.address2}";
            
		} else {
			document.getElementById("postBtn").style.display = "inline";
			document.getElementById("post").value = "";
            document.getElementById("address1").value = "";
            document.getElementById("address2").value = "";
		}
		
	});
	
	$('#orderForm').on('submit', function() {
		let post = $('#post').val();
		let address1 = $('#address1').val();
		let address2 = $('#address2').val().trim();
		if (post == "" || address1 == "") {
			alert("우편번호를 입력해주세요!");
			return false;
		}
		if (address2 == "") {
			alert("상세주소를 입력해주세요!");
			return false;
		}
		 let url = $(this).attr('action');
		 let params = $(this).serialize();
		 $.post(url, params)
		 .done(function(data) {
			 if (data.code == 1) {
				 window.location.href = "order_complete_view";
			 }
			 
		 })
		
	});
});
</script>