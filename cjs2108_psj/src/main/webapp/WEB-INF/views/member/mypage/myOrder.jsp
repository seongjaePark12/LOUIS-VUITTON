<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의주문내역</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	  <script>
    // 배송지 정보보기
    function nWin(orderIdx) {
    	var url = "${ctp}/mypage/dbOrderBaesong?orderIdx="+orderIdx;
    	window.open(url,"dbOrderBaesong","width=390px,height=430px");
    }
    
    $(document).ready(function() {
    	// 주문 상태별 조회
    	$("#orderStatus").change(function() {
	    	var orderStatus = $(this).val();
	    	location.href="${ctp}/mypage/orderStatus?orderStatus="+orderStatus+"&pag=${pag}";
    	});
    });
    
    // 날짜별 주문 조건 조회
    function orderCondition(conditionDate) {
    	location.href="${ctp}/mypage/orderCondition?conditionDate="+conditionDate+"&pag=${pag}";
    }
    
    function finish(orderIdx){
    	var ans = confirm("제품을 받으셨으면 구매확정을 해주세요\n 구매를 확정하시면 반품을 불가합니다");
    	if(!ans) return false; 
    	
    	$.ajax({
  			type  : "post",
  			url   : "${ctp}/mypage/gumeCheck",
  			data  : {orderIdx : orderIdx},
  			success : function(data) {
  				location.reload();
  			}
    	});
    }
    function nofinish(orderIdx){
    	var ans = confirm("반품신청을 하시겠습니까? \n 반품신청시 안내를위하여 전화가 갈 수 있습니다.");
    	if(!ans) return false; 
    	
    	$.ajax({
  			type  : "post",
  			url   : "${ctp}/mypage/gumeCheck2",
  			data  : {orderIdx : orderIdx},
  			success : function(data) {
  				location.reload();
  			}
    	});
    }
    function nofinish2(orderIdx){
    	var ans = confirm("반품을 취소 하시겠습니까?");
    	if(!ans) return false; 
    	
    	$.ajax({
  			type  : "post",
  			url   : "${ctp}/mypage/gumeCheck3",
  			data  : {orderIdx : orderIdx},
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
		<a href="${ctp}/mypage/myWish" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 위시리스트</a>
		<a href="${ctp}/mypage/myOrder" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left w3-bottombar w3-border-black">나의 주문제품</a>
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
	<c:set var="conditionOrderStatus" value="${conditionOrderStatus}"/>
	<c:set var="orderStatus" value="${orderStatus}"/>
	<div class="w3-container w3-margin w3-padding-16 w3-margin-right w3-margin-left">
	  <c:set var="condition" value="전체 조회"/>
	  <c:if test="${conditionDate=='1'}"><c:set var="condition" value="오늘날짜조회"/></c:if>
	  <c:if test="${conditionDate=='7'}"><c:set var="condition" value="일주일 이내 조회"/></c:if>
	  <c:if test="${conditionDate=='30'}"><c:set var="condition" value="한달 이내 조회"/></c:if>
	  <c:if test="${conditionDate=='90'}"><c:set var="condition" value="석달 이내 조회"/></c:if>
	  <h2 class="text-center"><b>나의 주문 확인</b></h2>
	  <hr/>
	  <table class="table table-borderless">
	    <tr>
	      <td style="text-align:left;">주문상태조회:
				  <c:choose>
				    <c:when test="${conditionDate == '1'}"><c:set var="conditionDate" value="오늘"/></c:when>
				    <c:when test="${conditionDate == '7'}"><c:set var="conditionDate" value="일주일이내"/></c:when>
				    <c:when test="${conditionDate == '30'}"><c:set var="conditionDate" value="한달이내"/></c:when>
				    <c:when test="${conditionDate == '90'}"><c:set var="conditionDate" value="세달이내"/></c:when>
				    <c:otherwise><c:set var="conditionDate" value="전체"/></c:otherwise>
				  </c:choose>
	        <input type="button" class="mybtn2" value="오늘" onclick="orderCondition(1)"/>
	        <input type="button" class="mybtn2" value="일주일이내" onclick="orderCondition(7)"/>
	        <input type="button" class="mybtn2" value="한달이내" onclick="orderCondition(30)"/>
	        <input type="button" class="mybtn2" value="3달이내" onclick="orderCondition(90)"/>
	        <input type="button" class="mybtn2" value="전체조회" onclick="orderCondition(99999)"/>
	      </td>
	      <td style="text-align:right;">주문상태조회:
	        <select name="orderStatus" id="orderStatus">
	          <option value="전체" ${orderStatus == '전체' ? 'selected' : ''}>전체조회</option>
	          <option value="결제완료" ${orderStatus == '결제완료' ? 'selected' : ''}>결제완료</option>
	          <option value="배송중"  ${orderStatus == '배송중' ? 'selected' : ''}>배송중</option>
	          <option value="배송완료"  ${orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
	          <option value="구매확정"  ${orderStatus == '구매확정' ? 'selected' : ''}>구매확정</option>
	          <option value="반품처리"  ${orderStatus == '반품처리' ? 'selected' : ''}>반품처리</option>
	        </select>
	      </td>
		    </tr>
		    <tr>
	    </tr>
	  </table>
	  
		<form name="myform" method="post">
		<div class="row">
			<!-- blog grid -->
			<c:forEach var="vo" items="${myOrderVos}">
				<div class="col-lg-2 w3-margin-bottom">
					<div class="card border-0">
						<div class="card-header p-0">
							<img src="${ctp}/data/shop/product/${vo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="100px" onclick="nWin('${vo.orderIdx}')" />
						</div>
						<div class="text-left">
							<div>
								<h4 style="color: black; font-size: 16px;" onclick="nWin('${vo.orderIdx}')">${vo.productName}</h4>
								<font color="red">${vo.orderStatus}</font>
								<c:if test="${vo.baesongNum != null}">
									<div>운송장 번호 :${vo.baesongNum}</div>
								</c:if>
								<c:if test="${vo.baesongNum == null}">
									<div>운송장 번호 : 택배사에 접수중입니다</div>
								</c:if>
							</div>
							<div><h4 style="color: black; font-size: 16px;" onclick="nWin('${vo.orderIdx}')">￦<fmt:formatNumber value="${vo.totalPrice}"/></h4></div>
							<c:if test="${vo.orderStatus == '배송완료'}">
								<input type="button" value="구매확정" class="mybtn2" onclick="finish(${vo.orderIdx})" />
								<input type="button" value="반품신청" class="mybtn2" onclick="nofinish(${vo.orderIdx})" />
							</c:if>
							<c:if test="${vo.orderStatus == '반품처리'}">
								<input type="button" value="반품취소" class="mybtn2" onclick="nofinish2(${vo.orderIdx})" />
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</form>
		
		<div class="container">
			<ul class="pagination justify-content-center">
				<c:if test="${totPage == 0}">
				<div style="text-align:center">
					<div class="col-lg-11 w3-margin-bottom text-center" ><img src="${ctp}/images/장바구니.png" width="85%"/></div>
					<div class="text-center"><h2>주문내역이 비어있습니다</h2></div>
					<div class="text-center"><input type="button" value="쇼핑 시작하기" onClick="location.href='${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=001';" class="mymy"/></div>
				</div>
				</c:if>
				<c:if test="${totPage != 0}">
					<c:if test="${pag != 1}">
						<li class="page-item"><a href="${ctp}/mypage/myOrder?pag=1" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="첫페이지">◀◀</a></li>
					</c:if>
					<c:if test="${curBlock > 0}">
						<li class="page-item"><a href="${ctp}/mypage/myOrder?pag=${(curBlock-1)*blockSize + 1}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="이전">◀</a></li>
					</c:if>
					<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
						<c:if test="${i == pag && i <= totPage}">
							<li class="page-item active"><a href='${ctp}/mypage/myOrder?pag=${i}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
						</c:if>
						<c:if test="${i != pag && i <= totPage}">
							<li class="page-item"><a href='${ctp}/mypage/myOrder?pag=${i}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${curBlock < lastBlock}">
						<li class="page-item"><a href="${ctp}/mypage/myOrder?pag=${(curBlock+1)*blockSize + 1}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="다음">▶</a></li>
					</c:if>
					<c:if test="${pag != totPage}">
						<li class="page-item"><a href="${ctp}/mypage/myOrder?pag=${totPage}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="마지막">▶▶</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
	<br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>