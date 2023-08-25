<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-body">
	<c:if test="${empty productList}">
		검색된 상품이 없습니다.
	</c:if>
	<c:if test="${productList != null}">
	<div class="sort"></div>
	<div class="prd-list col-9">
			<div class="center d-flex flex-wrap">
			<c:forEach items="${productList}" var="product">
				<ul class="info">
					<li>
						<div class="thumb">
							<a href="/shop/detail_view?id=${product.id}">
								<img src="${product.image1}" alt="썸네일" width="320" height="293">
							</a>
						</div>
					</li>
					<li class="dsc">
						<a href="/shop/detail_view?id=${product.id}">
							${product.artist} - ${product.name}
						</a>
					</li>
					<li class="price"><strong>${product.price}원</strong></li>
				</ul>
			</c:forEach>
			</div>

	</div>
	</c:if>
</div>