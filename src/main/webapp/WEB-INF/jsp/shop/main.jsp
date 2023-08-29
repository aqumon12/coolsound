<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
	<div class="banner">
		<div class="main-image pb-3">
			<img src="/static/images/main_banner.jpg" width="1020" alt="메인배너">
		</div>
	</div>
	<div class="new-product">
		<img src="/static/images/new_title.jpg" alt="new product">
		<div class="new-prd-list">
		
			<table>
				<tbody>
					<tr>
					<c:forEach items="${productList}" var="newProduct" begin="0" end="6">
						<td>
							<div class="tb-center">
								<ul>
									<li>
										<div class="thumb">
											<a>
												<img src="${newProduct.image1}" alt="썸네일" width="110" height="120">
											</a>
										</div>
									</li>
									<li class="dsc">${newProduct.artist} - ${newProduct.name}</li>
									<li class="price">${newProduct.price}</li>
								</ul>
							</div>
						</td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach items="${productList}" var="newProduct" begin="7" end="13">
						<td>
							<div class="tb-center">
								<ul>
									<li>
										<div class="thumb">
											<a>
												<img src="${newProduct.image1}" alt="썸네일" width="110" height="120">
											</a>
										</div>
									</li>
									<li class="dsc">${newProduct.artist} - ${newProduct.name}</li>
									<li class="price">${newProduct.price}</li>
								</ul>
							</div>
						</td>
					</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</div>