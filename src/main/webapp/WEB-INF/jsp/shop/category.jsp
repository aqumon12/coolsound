<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-body">
	<div class="sort"></div>
	<div class="prd-list col-9">
			<div class="center d-flex flex-wrap">
			<c:forEach items="${productList}" var="product">
				<ul class="info">
					<li>
						<div class="thumb">
							<a href="/shop/detail_view?id=${product.id}"> <img src="${product.image1}" width="320" height="293" alt="½æ³×ÀÏ">
							</a>
						</div>
					</li>
					<li class="dsc">
						<a href="/shop/detail_view?id=${product.id}">
							${product.artist} - ${product.name}
						</a>
					</li>
					<li class="price"><strong>${product.price}¿ø</strong></li>
				</ul>
			</c:forEach>
			</div>

	</div>
</div>