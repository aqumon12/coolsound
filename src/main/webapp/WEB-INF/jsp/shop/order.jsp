<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order">
	<h2>주문/결제</h2>
	<div class="page-body">
		<form>
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
					<c:forEach items="${list}" var="prd">
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
                					<input type="radio" value="home" name="place">자택
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
                			<th scope="row"></th>
                			<td colspan="3"></td>
                		</tr>
                		<tr>
                			<th scope="row"></th>
                			<td colspan="3"></td>
                		</tr>
                		<tr>
                			<th scope="row"></th>
                			<td colspan="3"></td>
                		</tr>
                	</tbody>
				</table>
			</div>
		</form>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#postBtn').on('click', function() {
		
	});
});
</script>