<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
		<style>
		.heart{
			font-size:17px;
		}
		.heart:hover{
			cursor: pointer;
			color: gold;
		}
	</style>
	<script>
		function wishDel(idx){
			$.ajax({
	  			type  : "post",
	  			url   : "${ctp}/mypage/wishDel",
	  			data  : {idx : idx},
	  			success : function(data) {
	  				location.reload();
	  			}
	    	});
		}
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item"><img src="${ctp}/images/user/마이페이지 로고.png" width="100%"/></a>
		<a href="${ctp}/mypage/myBooking" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left ">나의 방문 예약</a>
		<a href="${ctp}/mypage/myQuestion" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left ">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myWish" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left w3-bottombar w3-border-black">나의 위시리스트</a>
		<a href="${ctp}/mypage/myOrder" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/mypage/myInfor" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">나의계정</a>
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">My LV에 오신 것을 환영합니다</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/mypage/myPage" class="w3-bar-item w3-button w3-border-bottom">My LV에 오신 것을 환영합니다</a>
		<a href="${ctp}/mypage/myInfor" class="w3-bar-item w3-button w3-border-bottom">나의계정</a>
		<a href="${ctp}/mypage/myOrder" class="w3-bar-item w3-button w3-border-bottom">나의 주문제품</a>
		<a href="${ctp}/mypage/myWish" class="w3-bar-item w3-button w3-border-bottom">나의 위시리스트</a>
		<a href="${ctp}/mypage/myQuestion" class="w3-bar-item w3-button">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myBooking" class="w3-bar-item w3-button">나의 방문 예약</a>
	</div>
	<br/><br/>
	<form name="myform" method="post">
		<div class="w3-display-container w3-margin w3-padding-16 w3-margin-right w3-margin-left">
			<div class="row">
				<c:forEach var="vo" items="${wishVos}">
					<c:if test="${vo.wish == '1'}">
					<div class="col-lg-2 w3-margin-bottom">
						<div class="card border-0">
							<div class="card-header p-0">
								<i class="fa fa-remove w3-display-topright w3-padding heart" onclick="wishDel(${vo.idx})"></i>
								<a href="${ctp}/shop/userShopContent?idx=${vo.productIdx}"><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="100px"/></a>
							</div>
							<div class="text-left">
								<div>
									<h5 style="color: black; font-size: 16px;">${vo.productCode}</h5>
									<h4 style="color: black; font-size: 16px;">${vo.productName}</h4>
									<h4 style="color: black; font-size: 16px;">￦<fmt:formatNumber value="${vo.disPrice}" pattern="#,###"/></h4>
								</div>
								<div><a href="${ctp}/shop/userShopContent?idx=${vo.productIdx}">제품상세보기</a></div>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
			<c:if test="${ww == '0'}">
			<br/><br/>
				<div class="text-center"><img src="${ctp}/images/heart.gif" width="300px"/></div>
				<div class="text-center" style="font-size:20px">위시리스트에 제품이 없습니다</div><br/>
			<br/><br/>
			</c:if>
		</div>
	</form>
	<br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>