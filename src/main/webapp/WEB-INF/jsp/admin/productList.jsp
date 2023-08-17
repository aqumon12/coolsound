<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="product-list">
	<h1>상품목록</h1>
	<span>상품검색</span>
	<input type="text">
	<a class="btn btn-secondary">검색</a>
	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>수정</th>
				<th>삭제</th>
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
				<td><a id="updateBtn" class="btn btn-secondary">수정</a></td>
				<td><a id="deleteBtn" class="btn btn-light">삭제</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script>
	
</script>