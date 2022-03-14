<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<style>
		#more {display: none;}
		.heart{
			font-size:17px;
		}
		.heart:hover{
			cursor: pointer;
			color: gold;
		}
	</style>
	<script>
	function heartCheckon1(){
		var ans = confirm("로그인 후 이용가능한 서비스입니다.\n로그인창으로 이동 하시겠습니까?");
		if(!ans) {
			return false;
		}
		else {
   		location.href = "../member/login";
		}
	}
    
	function heartCheckon(idx){
		var mid = document.getElementById("mid").value;
		var productName = document.getElementById("productName"+idx).value;
		var productCode = document.getElementById("productCode"+idx).value;
		var disPrice = document.getElementById("disPrice"+idx).value;
		var productMainImg = document.getElementById("productMainImg"+idx).value;
		var wish = document.getElementById("wish"+idx).value;
		var query = {
				mid : mid,
				productIdx : idx,
				productName : productName,
				productCode : productCode,
				disPrice : disPrice,
				productMainImg : productMainImg,
				wish : wish
		}
		$.ajax({
  			type  : "post",
  			url   : "${ctp}/shop/heartOn",
  			data  : query,
  			success : function(data) {
  				location.href='${ctp}/shop/userShop?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}';
  			}
    	});
	}
	
	function levelCheck(){
		alert("GOLD/BLACK등급만 이용가능합니다");
	}
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/userShopC.jsp"/>
	<div class="w3-col s4"></div>
	<div class="w3-bar w3-border-top w3-border-bottom  w3-padding-16 w3-large">
		<a href="javascript:location.href='${ctp}/shop/userPool?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}&disPriceSw=L';" class=" w3-bar-item w3-hide-small w3-right w3-border-right"  style="font-size:15px; color: black;">낮은가격순</a>
		<a href="javascript:location.href='${ctp}/shop/userRich?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}&disPriceSw=H';" class="w3-bar-item w3-hide-small w3-right w3-border-left w3-border-right"  style="font-size:15px; color: black;">높은가격순</a>
		<a href="javascript:location.href='${ctp}/shop/userPop?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}&disPriceSw=I';" class="w3-bar-item w3-hide-small w3-right w3-border-left w3-border-right"  style="font-size:15px; color: black;">인기순</a>
		<a href="${ctp}/shop/userShop?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}" class=" w3-bar-item w3-hide-small w3-right w3-border-left"  style="font-size:15px; color: black;">기본순</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/shop/userShop?part=${Lpart}&Mpart=${Mpart}&Spart=${Spart}" class="w3-bar-item w3-button w3-border-bottom">기본순</a>
		<a href="javascript:location.href='${ctp}/shop/userPop?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}&disPriceSw=I';" class="w3-bar-item w3-button w3-border-bottom">인기순</a>
		<a href="javascript:location.href='${ctp}/shop/userRich?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}&disPriceSw=H';" class="w3-bar-item w3-button w3-border-bottom">높은가격순</a>
		<a href="javascript:location.href='${ctp}/shop/userPool?Lpart=${Lpart}&Mpart=${Mpart}&Spart=${Spart}&disPriceSw=L';" class="w3-bar-item w3-button">낮은가격순</a>
	</div>
		<input type="hidden" name="Lpart" value="${Lpart}"/>
		<input type="hidden" name="Mpart" value="${Mpart}"/>
		<input type="hidden" name="Spart" value="${Spart}"/>
	<br/><br/>
	<jsp:include page="/WEB-INF/views/include/userShopA.jsp"/>
	<form name="myform" method="post">
	<div class="w3-display-container w3-margin w3-padding-16 w3-margin-right w3-margin-left">
		<div class="row">
			<c:if test="${Spart == '005'}">
				<div class="col-lg-4 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<video class="menu3" width="100%" src="${ctp}/images/shop/남자향수.mp4" autoplay loop style="display: block;" muted></video>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${Spart == '004'}">
				<div class="col-lg-4 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<video class="menu3" width="100%" src="${ctp}/images/shop/여자향수2.mp4" autoplay loop style="display: block;" muted></video>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${Spart == '034'}">
				<div class="col-lg-8 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<video class="menu3" width="100%" src="${ctp}/images/shop/남성메신저.mp4" autoplay loop style="display: block;" muted></video>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${Spart == '037'}">
				<div class="col-lg-8 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<video class="menu3" width="100%" src="${ctp}/images/shop/남성스몰백.mp4" autoplay loop style="display: block;" muted></video>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${Spart == '042'}">
				<div class="col-lg-8 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<video class="menu3" width="100%" src="${ctp}/images/shop/남성벨트.mp4" autoplay loop style="display: block;" muted></video>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${Spart == '050'}">
				<div class="col-lg-8 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<video class="menu3" width="100%" src="${ctp}/images/shop/남성스니커즈.mp4" autoplay loop style="display: block;" muted></video>
						</div>
					</div>
				</div>
			</c:if>
			<c:forEach var="vo" items="${vos}" >
				<div class="col-lg-4 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
						<c:choose>
							<c:when test="${Spart == '008' || Spart == '009'}">
								<c:if test="${level == 0 || level == 1 || level == 2}">
									<a href="${ctp}/shop/userShopContent?idx=${vo.idx}"><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="100px"/></a>
								</c:if>
								<c:if test="${level == 3 || level == 4 || level == 99}">
									<a href="javascript:levelCheck()"><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="100px"/></a>
								</c:if>
							</c:when>
							<c:when test="${Spart != '008' || Spart != '009'}">
							<a href="${ctp}/shop/userShopContent?idx=${vo.idx}"><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="100px"/></a>
							</c:when>
						</c:choose>	
								<c:set var="mid" value="${sMid}"/>
								<c:if test="${mid == null}">
									<i class="fa fa-heart-o w3-display-topright w3-padding heart" onclick="heartCheckon1()"></i>
								</c:if>
			 					<c:if test="${mid != null && (empty vo.wishCheck || vo.wishCheck == '0')}">
									<i class="fa fa-heart-o w3-display-topright w3-padding heart" onclick="heartCheckon(${vo.idx})"></i>
									<input type="hidden" name="wish" id="wish${vo.idx}" value="1" />
								</c:if>
								<c:if test="${mid != null && vo.wishCheck == '1'}">
									<i class="fa fa-heart w3-display-topright w3-padding heart" onclick="heartCheckon(${vo.idx})"></i>
									<input type="hidden" name="wish" id="wish${vo.idx}" value="0" />
								</c:if>
								<input type="hidden" name="mid" id="mid" value="${sMid}"/>
						    <input type="hidden" name="productName${vo.idx}" id="productName${vo.idx}" value="${vo.productName}"/>
						    <input type="hidden" name="productCode${vo.idx}" id="productCode${vo.idx}" value="${vo.productCode}"/>
						    <input type="hidden" name="disPrice${vo.idx}" id="disPrice${vo.idx}"  value="${vo.disPrice}"/>
						    <input type="hidden" name="productMainImg${vo.idx}" id="productMainImg${vo.idx}" value="${vo.productMainImg}"/>
						</div>
						<div class="text-left">
							<h4 style="color: black; font-size: 16px;"><a href="${ctp}/shop/userShopContent?idx=${vo.idx}">${vo.productName}</a></h4>
							<c:if test="${vo.disPrice == vo.mainPrice}"><h4 style="color: black; font-size: 16px;"><a href="${ctp}/shop/userShopContent?idx=${vo.idx}">￦<fmt:formatNumber value="${vo.disPrice}" pattern="#,###"/></a></h4></c:if>
							<c:if test="${vo.disPrice != vo.mainPrice}"><h4 style="color: black; font-size: 16px;"><a href="${ctp}/shop/userShopContent?idx=${vo.idx}"><span style="color:red">SALE</span>&nbsp;<span style="text-decoration: line-through;">￦<fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/></span></a>&nbsp;<a href="${ctp}/shop/userShopContent?idx=${vo.idx}">￦<fmt:formatNumber value="${vo.disPrice}" pattern="#,###"/></a></h4></c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</form>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userShop.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>