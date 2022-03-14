<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR PAGE</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
		<style>
		#errorimg:hover {
			animation: shake 0.5s;
			animation-iteration-count: infinite;
		}
		@keyframes shake {
			0% { transform: translate(1px, 1px) rotate(0deg); }
			10% { transform: translate(-1px, -2px) rotate(-1deg); }
			20% { transform: translate(-3px, 0px) rotate(1deg); }
			30% { transform: translate(3px, 2px) rotate(0deg); }
			40% { transform: translate(1px, -1px) rotate(1deg); }
			50% { transform: translate(-1px, 2px) rotate(-1deg); }
			60% { transform: translate(-3px, 1px) rotate(0deg); }
			70% { transform: translate(3px, 1px) rotate(-1deg); }
			80% { transform: translate(-1px, -1px) rotate(1deg); }
			90% { transform: translate(1px, 2px) rotate(0deg); }
			100% { transform: translate(1px, -2px) rotate(-1deg); }
		}
	</style>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="container">
		<div class="row">
			<!-- blog grid -->
			<div class="col-lg-6">
				<img src="${ctp}/images/main/404.png" id="errorimg" width="500" height="500" class="card-img-bottom img-fluid" alt="image">
			</div>
			<div class="col-lg-6 w3-margin-top">
				<h1>it's just a 500 Error!</h1><br/>
				<h1>What you’re looking for may have been misplaced in Long Term Memory.</h1><br/>
				<h1><a href="https://www.instagram.com/sj__619/"><i class="fa fa-instagram font1">sj__619</i></a></h1>
				<br/>
				<a href="${ctp}/member/main" class="btn btn-outline-secondary">메인으로</a>
			</div>
			<div class="col-lg-6" style="font-size: 25pt;">
				<br/>
				<ul>
					<li><b>여성</b></li>
					<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=003">자카드 데님 ＆ 브로더리</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=011">토트 백</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=012">체인 백＆클러치</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=013">백백＆벨트백</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=014">이그조틱 레더 백</a></li>
				</ul>
				<br/>
				<ul>
					<li><b>남성</b></li>
					<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=02&Spart=006">LV² COLLECTION</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=033">백백</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=035">비즈니스 백</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=036">토트 백</a></li>
					<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=036">스몰 백</a></li>
				</ul>
			</div>
			<div class="col-lg-6" style="font-size: 25pt;">
				<br/>
				<ul>
					<li><b>추천아이템</b></li>
					<li><a href="${ctp}/shop/userShopContent?idx=129"><img src="${ctp}/images/추천1.png" width="150px"/></a></li>
					<li><a href="${ctp}/shop/userShopContent?idx=248"><img src="${ctp}/images/추천2.png" width="150px"/></a></li>
					<li><a href="${ctp}/shop/userShopContent?idx=408"><img src="${ctp}/images/추천3.png" width="150px"/></a></li>
					<li><a href="${ctp}/shop/userShopContent?idx=407"><img src="${ctp}/images/추천4.png" width="150px"/></a></li>
				</ul>
			</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>