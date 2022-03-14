<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/userOrderCon.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<br/><br/><br/><br/>
	<div class="w3-container" style="background: linear-gradient(120deg,#ffefba,#ffffff);">
		<div class="text-center">
			<h1>${sName}님의 주문 내역입니다</h1>
		</div>
		<div class="row" style="margin:50px 50px;">
			<div class="col-lg-12">
			<div class="text-left w3-margin-bottom">
			<c:forEach var="vo" items="${vos}">
				<div class="row">
					<div class="col-lg-6"><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="mx-auto d-block w3-center" width="300px"/></div>
					<div class="col-lg-6">
						<div><h3>주문번호 : ${vo.orderIdx}</h3></div>
						<div><h3>모델명 : ${vo.productName}</h3></div>
						<div>
							<c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
			        <c:set var="optionColor" value="${fn:split(vo.optionColor,',')}"/>
			        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
							<c:if test="${fn:length(optionNames) > 1}"><h3>${fn:length(optionNames)-1}개</h3></c:if>
		          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
		            <h3>${optionNames[i-1]} / ${optionColor[i-1]}</h3>
		          </c:forEach> 
						</div>
						<div><h3>총 주문액 : <fmt:formatNumber value="${vo.totalPrice}"/>원 결제완료</h3></div>
					</div>
				</div>
			</c:forEach>
				<br/><br/>
				<div class="text-center w3-margin-bottom">
					<a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=002" class="btn mybtn3 w3-margin-bottom">계속쇼핑하기</a>
			    <a href="${ctp}/mypage/myOrder" class="btn mybtn3 w3-margin-bottom">구매내역보기</a>
				</div>
			</div>
			</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>