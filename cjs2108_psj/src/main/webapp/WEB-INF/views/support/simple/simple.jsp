<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/simple.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">자주하는 질문</h1></div>
<jsp:include page="/WEB-INF/views/include/simpleNav.jsp"/>
	<div class="row">
		<div class="col-lg-1" style="background-color: rgb(246,245, 243)">
		</div>
		<div class="col-lg-7 accordion text-left w3-padding-16" style="background-color: white; background-color: rgb(246,245, 243)">
			<c:if test="${what == 'FAQ'}"><h2 style="color:black;"><b>루이 비통에 대해 더 알아보세요</b></h2></c:if>
			<c:if test="${what == '회원관리'}"><h2 style="color:black;"><b>회원에 관한 질문</b></h2></c:if>
			<c:if test="${what == '배송관리'}"><h2 style="color:black;"><b>배송</b></h2></c:if>
			<c:if test="${what == '교환및환불'}"><h2 style="color:black;"><b>교환 및 환불</b></h2></c:if>
			<c:if test="${what == '제품관련'}"><h2 style="color:black;"><b>제품 관리 방법을 확인하세요</b></h2></c:if>
			<c:if test="${what == 'COVID-19안내사항'}"><h2 style="color:black;"><b>COVID-19 안내사항</b></h2></c:if>
			<br/><hr/><br/>
			<c:forEach var="vo" items="${vos}">
				<button class="accordion" style="background-color: white"><h5><span style="margin-left: 20px;">${vo.title}</span></h5></button>
				<div class="panel">
				  <h5 style="background-color: rgb(246,245, 243)">${fn:replace(vo.content,newLine,'<br/>')}</h5>
				</div>
			</c:forEach>
		</div>
		<div class="col-lg-1" style="background-color: rgb(246,245, 243)">
		</div>
		<div class="col-lg-2 w3-margin-bottom w3-margin-top">
			<h4><b>전화 문의</b></h4>
			<div>010-xxxx-xxxx</div>
			<br/><hr/><br/>
			<h4><b>이메일 문의</b></h4>
			<div>qkrtjdwo337@naver.com</div>
			<br/><hr/><br/>
			<h4><a href="${ctp}/support/notice" style="color:black;font-size:20px;">공지사항</a></h4>
			<div><a href="${ctp}/support/notice">바로가기</a></div>
			<br/><hr/><br/>
			<h4><a href="${ctp}/support/question" style="color:black;font-size:20px;">Q＆A</a></h4>
			<div><a href="${ctp}/support/question">바로가기</a></div>
		</div>
	</div>
	<div style="background-color: rgb(246,245, 243)">
	<br/><br/><br/><br/><br/><br/>	
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script src="${ctp}/js/userNav.js"></script>
	<script src="${ctp}/js/simple.js"></script>
	<script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>