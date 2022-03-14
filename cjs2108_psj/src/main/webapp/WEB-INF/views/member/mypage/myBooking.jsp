<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 정보</title>
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
		function fCheck(){
			var booDate1 = myform.booDate1.value;
			var booDate2 = myform.booDate2.value;
			var booDate3 = myform.booDate3.value;
			var booDate = myform.booDate1.value + myform.booDate2.value + myform.booDate3.value;
			var dateCheck = /^[0-9]+$/;
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0'+(today.getMonth() + 1)).slice(-2);
			var day = ('0'+today.getDate()).slice(-2);
			var dateString = year +"-"+ month +"-"+ day;
			
			if(booDate1 == ""){
				alert("년도를 입력해주세요");
				myform.booDate1.focus();
			}
			else if(!dateCheck.test(booDate1)){
				myform.booDate1.focus();
			}
			else if(booDate2 == ""){
				alert("월을 입력해주세요");
				myform.booDate2.focus();
			}
			else if(!dateCheck.test(booDate2)){
				myform.booDate2.focus();
			}
			else if(booDate3 == ""){
				alert("일을 입력해주세요");
				myform.booDate3.focus();
			}
			else if(!dateCheck.test(booDate3)){
				myform.booDate3.focus();
			}
			else{
				if(booDate2 < 10) booDate2 = 0+booDate2;
				if(booDate3 < 10) booDate3 = 0+booDate3;
				booDate = booDate1 + "-" + booDate2 + "-" + booDate3;
				if(booDate <= dateString){
					alert("당일예약과 지나간 날짜의 예약은 불가합니다");
					myform.booDate1.focus();
					return false;
				}
				myform.booDate.value = booDate;
				myform.submit();
			}
			
		}
		
  	// 수정하기
  	function bookingUpdate(mid){
  		var mid = "${sMid}";
  		var name = "${sName}";
			var booDate1 = myform.booDate1.value;
			var booDate2 = myform.booDate2.value;
			var booDate3 = myform.booDate3.value;
			var booTime = myform.booTime.value;
			var dateCheck = /^[0-9]+$/;
			
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0'+(today.getMonth() + 1)).slice(-2);
			var day = ('0'+today.getDate()).slice(-2);
			var dateString = year +"-"+ month +"-"+ day;
			if(booDate1 == ""){
				alert("년도를 입력해주세요");
				myform.booDate1.focus();
			}
			else if(!dateCheck.test(booDate1)){
				alert("날짜형식에 맞게 입력해주세요");
				myform.booDate1.focus();
			}
			else if(booDate2 == ""){
				alert("월을 입력해주세요");
				myform.booDate2.focus();
			}
			else if(!dateCheck.test(booDate2)){
				alert("날짜형식에 맞게 입력해주세요");
				myform.booDate2.focus();
			}
			else if(booDate3 == ""){
				alert("일을 입력해주세요");
				myform.booDate3.focus();
			}
			else if(!dateCheck.test(booDate3)){
				alert("날짜형식에 맞게 입력해주세요");
				myform.booDate3.focus();
			}
			else{
				if(booDate2 < 10) booDate2 = 0+booDate2;
				if(booDate3 < 10) booDate3 = 0+booDate3;
				booDate = booDate1 + "-" + booDate2 + "-" + booDate3;
				if(booDate <= dateString){
					alert("당일예약과 지나간 날짜의 예약은 불가합니다");
					myform.booDate1.focus();
					return false;
				}
	  		$.ajax({
	  			type : "post",
	  			url : "${ctp}/mypage/bookingUpdate",
	  			data : {
	  				mid : mid,
	  				name : name,
	  				booDate : booDate,
	  				booTime : booTime
	  			},
	  			success:function(){
	  				location.reload();
	  			},
	  			error : function(){
	  				alert("전송오류");
	  			}
	  		});
			}
  	}
  	
  	// 취소하기
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
				<a href="${ctp}/mypage/myBooking" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">나의 방문 예약</a>
		<a href="${ctp}/mypage/myQuestion" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myWish" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 위시리스트</a>
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
	<div class="row" style="margin:50px 50px;">
		<div class="col-lg-6 w3-margin-bottom w3-margin-top">
		<h2><b>방문 예약/변경</b></h2>
			<form name="myform" method="post">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td>${sMid}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${sName}</td>
					</tr>
					<tr>
						<th>예약 날짜</th>
						<td>
							<div class="w3-row-padding">
							  <div class="w3-third">
							    <input class="w3-input w3-border" name="booDate1" id="booDate1" type="text" placeholder="YYYY" maxlength="4" required >
							  </div>
							  <div class="w3-third">
							    <input class="w3-input w3-border" name="booDate2" id="booDate2" type="text" placeholder="MM" maxlength="2" required >
							  </div>
							  <div class="w3-third">
							    <input class="w3-input w3-border" name="booDate3" id="booDate3" type="text" placeholder="DD" maxlength="2" required >
							  </div>
							  <span style="color:red">날짜가 올바르지 않으면 예약이 취소됩니다<br/> 당일 예약은 불가합니다</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>예약 시간</th>
						<td>
							<select name="booTime" id="booTime" class="form-control">
								<option value="1:00pm">1:00pm</option>
								<option value="1:30pm">1:30pm</option>
								<option value="2:00pm">2:00pm</option>
								<option value="2:30pm">2:30pm</option>
								<option value="3:00pm">3:00pm</option>
								<option value="3:30pm">3:30pm</option>
								<option value="4:00pm">4:00pm</option>
								<option value="4:30pm">4:30pm</option>
								<option value="5:00pm">5:00pm</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center">
							<c:if test="${vo == null}"><input type="button" value="예약하기" onclick="fCheck()" class="mybtn" /></c:if>
							<c:if test="${vo != null}"><input type="button" value="예약 변경하기" onclick="bookingUpdate('${vo.mid}')" class="mybtn" /></c:if>
						</td>
					</tr>
				</table>
				<input type="hidden" name="mid" value="${sMid}"/>
				<input type="hidden" name="name" value="${sName}"/>
				<input type="hidden" name="booDate"/>
			</form>
		</div>
		<div class="col-lg-6 w3-margin-bottom w3-margin-top">
			<h2><b>나의 예약 내역</b></h2>
			<br/><hr/><br/>
			<c:if test="${vo != null}">
				<div style="font-size:20px">${vo.name}님</div><br/>
				<div style="font-size:20px">${vo.booDate}&nbsp;&nbsp;${vo.booTime}에 예약 되셨습니다</div><br/>
				<div style="font-size:20px">늦지말고 방문 부탁드립니다<br/> 예약을 변경하시려면 왼쪽에서 변경해주세요</div><br/>
				<input type="button" value="예약취소하기" onclick="bookingDelCheck('${vo.mid}')" class="mybtn" />
			</c:if>
			<c:if test="${vo == null}">
				<div style="font-size:20px">아직 예정된 방문 예약 건이 없습니다. 방문 예약을 서둘러주세요.</div><br/>
			</c:if>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>