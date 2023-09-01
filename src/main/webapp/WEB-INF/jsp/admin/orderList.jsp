<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="order-list">
	<h1>주문관리</h1>
	<span>검색어</span>
	주문일자검색 / 주문상태검색
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
				<th>변경</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${OrderViewList}" var="orderView" varStatus="status">
			<tr>
				<td><a>${orderView.userEntity.name}</a></td>
				<td><a>${orderView.order.}</a></td>
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
				<td><a id="updateBtn" class="btn btn-secondary">변경</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>