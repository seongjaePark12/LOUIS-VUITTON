<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item"><img src="${ctp}/images/user/마이페이지 로고.png" width="100%"/></a>
		<a href="${ctp}/mypage/myBooking" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left ">나의 방문 예약</a>
		<a href="${ctp}/mypage/myQuestion" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">나의 케어 서비스</a>
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
	<br/><br/><br/><br/><br/><br/>
	  <div class="w3-container" id="showcase">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h1>나의 문의 내역</h1></td>
	    </tr>
	    <tr>
	    	<td>
    		<c:if test="${sLevel == 1 || sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5 }">
        	<a href="${ctp}/support/questionInput" class="text-left btn btn-outline-warning w3-border w3-round-xxlarge font6">글쓰기</a>
        </c:if>
        </td>
	    </tr>
  	</table>
	  <table class="table table-hover text-center">
	    <tr class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
	      <th style="width:5%">번호</th>
	      <th style="width:40%">제목</th>
	      <th style="width:15%">문의유형</th>
	      <th style="width:10%">작성자</th>
	      <th style="width:10%">답변</th>
	      <th style="width:10%">작성일</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		      <td>${curScrStartNo}</td>
		      <td>
		      	<a href="${ctp}/mypage/myContent?idx=${vo.idx}">${vo.title}</a>
		      </td>
		      <td>${vo.what}</td>
		      <td>${fn:substring(vo.mid,0,3)}**</td>
		      <td>
		      	<c:if test="${vo.anser == 0}"><font color="skyblue">답변대기</font></c:if>
		      	<c:if test="${vo.anser == 1}"><font color="red">답변완료</font></c:if>
		      </td>
		      <td>
		      	<c:if test="${vo.diffTime <= 24}">${fn:substring(vo.dateNow,11,16)}</c:if>
		      	<c:if test="${vo.diffTime > 24}">${fn:substring(vo.dateNow,0,10)}</c:if>
		      </td>
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	  </table>
  </div>
  <br/><br/><br/><br/><br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>