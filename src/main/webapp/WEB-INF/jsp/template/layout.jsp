<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COOLSOUND</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<header>
			<jsp:include page="../include/header.jsp"/>
		</header>
		<div class="d-flex contents">
			<nav class="col-2">
				<jsp:include page="../include/nav.jsp" />
			</nav>
			<section class="col-10">
				<jsp:include page="../${view}.jsp"/>
			</section>
		</div>
		<footer></footer>
	
	</div>
	
</body>
</html>