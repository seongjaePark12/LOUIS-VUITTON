<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/userBag.css">
	<link rel="icon" href="${ctp}/images/title.ico">
 	<script src="${ctp}/js/userBag.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="row" style="margin:50px 50px;">
		<div class="col-lg-8 text-left w3-margin-right w3-margin-bottom">
			<form name="myform" method="post">
			  <c:if test="${vvvi != '0'}">
				<h2 style="color:black;"><b>나의 쇼핑백</b></h2>
				<div><input type="checkbox" id="allcheck" onClick="allCheck()" class="w3-check"/></div>
				<br/><hr/><br/>
				<c:set var="maxIdx" value="0"/>
			  <c:forEach var="vo" items="${cartListVos}">
				<div class="row">
					<div class="col-lg-5 w3-margin-bottom w3-margin-right" ><img src="${ctp}/data/shop/product/${vo.productMainImg}" width="400px"/></div>
					<div class="col-lg-6">
						<div class="text-left"><input type="checkbox" name="idxChecked" id="idx${vo.idx}" value="${vo.idx}" onClick="onCheck()" class="w3-check"/></div>
						<div class="text-left"><h4>${vo.productCode}</h4></div>
						<div class="text-left"><h2><b>${vo.productName}</b></h2></div>
						<hr/>
						<c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
		        <c:set var="optionColors" value="${fn:split(vo.optionColor,',')}"/>
		        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
		        
			      <c:forEach var="i" begin="0" end="${fn:length(optionNames)-1}">
						<div class="row">
							<div class="col-lg-6 text-left"><h5>사이즈 :</h5></div>
							<div class="col-lg-6 text-right"><h5>${optionNames[i]}</h5></div>
						</div>
						</c:forEach>
			      <c:forEach var="j" begin="0" end="${fn:length(optionColors)-1}">
						<div class="row">
							<div class="col-lg-6 text-left"><h5>색상 :</h5></div>
							<div class="col-lg-6 text-right"><h5>${optionColors[j]}</h5></div>
							<div class="col-lg-6 text-left"><h5>개수 :</h5></div>
							<div class="col-lg-6 text-right"><h5>${optionNums[j]}개</h5></div>
						</div>
						</c:forEach>
						<div>
							<div class="text-left"><h5>구매일자 :${fn:substring(vo.cartDate,0,10)}</h5></div>
							<div class="text-left"><h5>￦<fmt:formatNumber value="${vo.totalPrice}" pattern="#,###"/></h5></div>
				      <input type="hidden" id="totalPrice${vo.idx}" value="${vo.totalPrice}"/>
						</div>
						<div class="row">
							<div class="col-lg-6 w3-margin-bottom"><input type="button" value="쇼핑 계속하기" onClick="location.href='${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=001';" class="mybtn2"/></div>
							<div class="col-lg-6"><input type="button" value="삭제하기" class="mybtn2" onClick="cartDel(${vo.idx})"/></div>
							<input type="hidden" name="checkItem" value="0" id="checkItem${vo.idx}"/>
							<input type="hidden" name="idx" value="${vo.idx}"/>
			        <input type="hidden" name="productMainImg" value="${vo.productMainImg}"/>
			        <input type="hidden" name="productName" value="${vo.productName}"/>
			        <input type="hidden" name="realPrice" value="${vo.realPrice}"/>
			        <input type="hidden" name="mainPrice" value="${vo.mainPrice}"/>
			        <input type="hidden" name="point" value="${vo.point}"/>
			        <input type="hidden" name="disPrice" value="${vo.disPrice}"/>
			        <input type="hidden" name="optionName" value="${optionNames}"/>
			        <input type="hidden" name="optionColor" value="${optionColor}"/>
			        <input type="hidden" name="optionNum" value="${optionNums}"/>
			        <input type="hidden" name="totalPrice" value="${vo.totalPrice}"/>
			        <input type="hidden" name="mid" value="${sMid}"/>
						</div>
					</div>
				</div>
				<c:set var="maxIdx" value="${vo.idx}"/>
				</c:forEach>
				</c:if>
				<c:if test="${vvvi == '0'}">
					<div class="col-lg-11 w3-margin-bottom text-center" ><img src="${ctp}/images/장바구니.png" width="85%"/></div>
					<div class="text-center"><h2>쇼핑백이 비어있습니다</h2></div>
					<div class="text-center"><input type="button" value="쇼핑 시작하기" onClick="location.href='${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=001';" class="mybtn3"/></div>
				</c:if>
				<input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
				<input type="hidden" name="orderTotalPrice" id="orderTotalPrice"/>
			</form>
		</div>
		<div class="col-lg-3 w3-margin-bottom w3-margin-top inalTot">
			<c:if test="${vvvi != '0'}">
			<div class="row">
				<div class="col-lg-6 text-left"><h5>합계 :</h5></div>
				<div class="col-lg-6 text-right"><h5><input type="text" id="total" value="0" class="totSubBox" readonly /></h5></div>
			</div>
			<div class="row">
				<div class="col-lg-6 text-left"><h5>배송 :</h5></div>
				<div class="col-lg-6 text-right"><h5><input type="text" id="baesong" value="0" class="totSubBox" readonly /></h5></div>
			</div>
			<div class="row">
				<div class="col-lg-6 text-left"><h4>총액 :</h4></div>
				<div class="col-lg-6 text-right"><h5><input type="text" id="lastPrice" value="0" class="totSubBox" readonly /></h5></div>
			</div>
			<hr/>
			<br/>
			<input type="button" value="결제하기" onClick="order()" class="mybtn2"/>
			<hr/>
			</c:if>
		<jsp:include page="/WEB-INF/views/include/userBagModal.jsp"/>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>