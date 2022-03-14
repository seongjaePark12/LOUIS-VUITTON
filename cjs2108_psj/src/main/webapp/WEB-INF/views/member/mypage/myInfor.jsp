<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 계정 정보</title>
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
		function memDeleteCheck(){
			var ans = confirm("탈퇴를 하시면 포인트와 등급이 모두 삭제됩니다 정말 탈퇴 하시겠습니까?");
			if(ans){
				ans = confirm("탈퇴하시게되면 1개월간 같은 아이디로는 재가입 하실 수 없습니다 \n탈퇴 하시겠습니까?");
				if(ans) location.href = "${ctp}/member/userDelete";
			}
		}
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item"><img src="${ctp}/images/user/마이페이지 로고.png" width="100%"/></a>
				<a href="${ctp}/mypage/myBooking" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left ">나의 방문 예약</a>
		<a href="${ctp}/mypage/myQuestion" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myWish" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 위시리스트</a>
		<a href="${ctp}/mypage/myOrder" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/mypage/myInfor" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">나의계정</a>
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
		<div class="row" style="margin:50px 50px;">
			<div class="col-lg-6 w3-margin-bottom">
				<h2><b>개인 정보</b></h2>
				<br/><hr/><br/>
				<div style="font-size:20px">이름 : ${vo.name}</div><br/>
				<div style="font-size:20px">생년월일 : ${fn:substring(vo.birth,0,10)}</div><br/>
				<div style="font-size:20px">주소 : ${vo.address}</div><br/>
				<div>정보를 수정하시려면 정보수정 버튼을 눌러주세요</div><br/>
				<input class="mybtn" type="button" onclick="location.href='${ctp}/mypage/pwdCheck';" value="정보수정하기">
			</div>
			<div class="col-lg-6 w3-margin-bottom">
				<h2><b>로그인 정보</b></h2>
					<br/><hr/><br/>
					<div style="font-size:20px">이메일 : ${vo.email}</div><br/>
					<div style="font-size:20px">보유 포인트 : <fmt:formatNumber value="${vo.point}" pattern='#,###P'/></div><br/>
					<div style="font-size:20px">등급 :
						<c:if test="${vo.level == 4}">WELCOME</c:if>
						<c:if test="${vo.level == 3}">RED</c:if>
						<c:if test="${vo.level == 2}">GOLD</c:if>
						<c:if test="${vo.level == 1}">BLACK</c:if>&nbsp;&nbsp;&nbsp;
					
					<!-- 등급별 혜택 버튼 -->
					<button onclick="document.getElementById('id01').style.display='block'" class="mymy">등급별 혜택</button>
						<!-- The Modal -->
					 <div id="id01" class="w3-modal">
					    <div class="w3-modal-content w3-animate-zoom w3-card-4">
					      <header class="w3-container"> 
					        <span onclick="document.getElementById('id01').style.display='none'" 
					        class="w3-button w3-display-topright">&times;</span>
					        <h2>현재 회원님의 등급은
				          	<c:if test="${vo.level == 4}">WELCOME</c:if>
										<c:if test="${vo.level == 3}">RED</c:if>
										<c:if test="${vo.level == 2}">GOLD</c:if>
										<c:if test="${vo.level == 1}">BLACK</c:if>입니다
									</h2>
					      </header>
					      <div class="w3-container">
					        <table class="table table-active table-bordered">
										<tr class="text-center"><th colspan="6">회원 등급표</th></tr>
										<tr class="text-center">
											<th>회원 등급</th>
											<td>WELCOME</td>
											<td>RED</td>
											<td>GOLD</td>
											<td>BLACK</td>
										</tr>
										<tr class="text-center">
											<th>등급기준</th>
											<td>가입시</td>
											<td>1번 구입시</td>
											<td>3번 구입시</td>
											<td>5번 구입시</td>
										</tr>
										<tr class="text-center">
											<th>생일 기프트</th>
											<td colspan="4">생일기프트</td>
										</tr>
										<tr class="text-center">
											<th>등급 혜택</th>
											<td colspan="2">없음</td>
											<td colspan="2">GOLD/BLACK전용관</td>
										</tr>
										<tr class="text-center">
											<th>공동혜택</th>
											<td colspan="4">무료배송/적립 10%</td>
										</tr>
									</table>
					      </div>
					    </div>
					  </div>
				  </div><br/><br/>
			  <div><input class="mybtn" type="button" onclick="location.href='${ctp}/member/logout';" value="로그아웃"></div><br/>
			  <div><input class="mybtn" type="button" onclick="javascript:memDeleteCheck()" value="회원탈퇴"></div>
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