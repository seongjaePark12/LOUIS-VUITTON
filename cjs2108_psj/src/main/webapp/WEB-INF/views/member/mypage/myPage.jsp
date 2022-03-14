<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
		function bookingDelCheck(mid){
		  	var ans = confirm("예약을 취소하시겠습니까?");
		  	if(!ans) {
		  		return false;
		  	}
	  		$.ajax({
	  			type : "post",
	  			url : "${ctp}/mypage/bookingDelete",
	  			data : {mid : mid},
	  			success:function(){
	  				location.reload();
	  			},
	  			error : function(){
	  				alert("전송오류");
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
		<a href="${ctp}/mypage/myOrder" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/mypage/myInfor" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">나의계정</a>
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">My LV에 오신 것을 환영합니다</a>
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
	<img src="${ctp}/images/user/마이페이지.png" width="100%"/>
	<div class="text-center"><a href="${ctp}/member/logout"><img src="${ctp}/images/user/로고.png" width="100px" class="w3-circle center"></a></div>
	<div class="text-center"><a href="${ctp}/member/logout" style="font-size:20pt">로그아웃</a></div>
		<div class="row" style="margin:50px 50px;">
			<div class="col-lg-6 w3-margin-bottom">
				<h2><b>나의 계정</b></h2>
				<br/><hr/><br/>
				<div style="font-size:20px">이메일 : ${vo.email}</div><br/>
				<div style="font-size:20px">보유 포인트 : <fmt:formatNumber value="${vo.point}" pattern='#,###P'/></div><br/>
				<input class="mybtn" type="button" onclick="location.href='${ctp}/mypage/pwdCheck'" value="정보변경하기">
			</div>
			<div class="col-lg-6 w3-margin-bottom">
				<h2><b>나의 주문제품</b></h2>
					<br/><hr/><br/>
					<div class="row">
						<c:forEach var="myOrderVo" items="${myOrderVos}">
							<c:if test="${myOrderVo.orderStatus != '결제완료'}">
								<div style="font-size:20px">주문한 제품이 없습니다</div><br/>
							</c:if>
								<c:if test="${myOrderVo.orderStatus == '결제완료'}">
								<div class="col-lg-2 w3-margin-bottom">
									<div class="card border-0">
										<div class="card-header p-0">
											<img src="${ctp}/data/shop/product/${myOrderVo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="300px"/>
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>		
						</div>
					<input class="mybtn" type="button" onclick="location.href='${ctp}/mypage/orderStatus?orderStatus=결제완료&pag=1'" value="주문내역 확인하기">
			</div>
			<br/>
			<div class="col-lg-6 w3-margin-bottom w3-margin-top">
				<h2><b>나의 예약</b></h2>
				<br/><hr/><br/>
				<c:if test="${vo1 != null}">
					<div style="font-size:20px">${vo1.name}님</div><br/>
					<div style="font-size:20px">${vo1.booDate}&nbsp;&nbsp;${vo1.booTime}에 예약 되셨습니다</div><br/>
					<div style="font-size:20px">늦지말고 방문 부탁드립니다<br/> 예약을 변경하시려면 왼쪽에서 변경해주세요</div><br/>
					<input type="button" value="예약취소하기" onclick="bookingDelCheck('${vo1.mid}')" class="mybtn" />
				</c:if>
				<c:if test="${vo1 == null}">
					<div style="font-size:20px">아직 예정된 방문 예약 건이 없습니다. 방문 예약을 서둘러주세요.</div><br/>
					<input class="mybtn" type="button" onclick="location.href='${ctp}/mypage/myBooking'" value="방문예약 진행하기">
				</c:if>
			</div>
			<div class="col-lg-6 w3-margin-bottom w3-margin-top">
				<h2><b>나의 케어 서비스</b></h2>
				<br/><hr/><br/>
				<c:if test="${questionCnt == 0}">
					<div style="font-size:20px">문의를 해보세요</div><br/>
					<input class="mybtn" type="button" onclick="location.href='${ctp}/support/questionInput'" value="문의 하러가기">
				</c:if>
				<c:if test="${questionCnt != 0}">
					<div style="font-size:20px">${questionCnt}건의 답변완료가 있습니다</div><br/>
					<input class="mybtn" type="button" onclick="location.href='${ctp}/mypage/myQuestion'" value="답변보러가기">
				</c:if>
			</div>
			<br/>
			<div class="col-lg-12 w3-margin-bottom w3-margin-top">
				<h2><b>나의 위시리스트</b></h2>
				<br/><hr/><br/>
					<div class="w3-display-container">
						<form name="myform" method="post">
						<div class="row">
							<c:if test="${ww == '0'}">
								<div style="font-size:20px">위시리스트에 제품이 없습니다</div><br/>
							</c:if>
							<c:forEach var="wishVo" items="${wishVos}">
								<c:if test="${wishVo.wish == '1'}">
								<div class="col-lg-2 w3-margin-bottom">
									<div class="card border-0">
										<div class="card-header p-0">
											<i class="fa fa-remove w3-display-topright w3-padding heart" onclick="wishDel(${wishVo.idx})"></i>
											<a href="${ctp}/shop/userShopContent?idx=${wishVo.productIdx}"><img src="${ctp}/data/shop/product/${wishVo.productMainImg}" class="card-img-bottom img-fluid" alt="image" width="300px"/></a>
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>
						</div>
						</form>
					</div>
			</div>
			<br/>
		</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>