<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">공지사항</h1></div>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-margin-left"><i class="fa fa-arrow-left w3-xlarge"></i></a>
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">Q＆A</a>
		<a href="${ctp}/support/notice" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">공지사항</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/support/notice" class="w3-bar-item w3-button w3-border-bottom">공지사항</a>
		<a href="${ctp}/support/question" class="w3-bar-item w3-button w3-border-bottom">Q＆A</a>
	</div>
  <div class="w3-container" id="showcase">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h1>NOTICE</h1></td>
	    </tr>
  	</table>
	  <table class="table table-hover text-center">
	    <tr class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
	      <th style="width:5%">번호</th>
	      <th style="width:50%">제목</th>
	      <th style="width:15%">작성자</th>
	      <th style="width:15%">작성일</th>
	    </tr>
	    <c:forEach var="vo" items="${novos}">
	    	<tr>
		      <td><font color="red"><b>공지</b></font></td>
		      <td>
		      	<a href="${ctp}/support/noticeContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
		      	<c:if test="${vo.diffTime <= 24}"><img src="${ctp}/images/new.png" width="40px" height="20px"/></c:if>
		      </td>
		      <td>${vo.name}</td>
		      <td>
		      	<c:if test="${vo.diffTime <= 24}">${fn:substring(vo.dateNow,11,16)}</c:if>
		      	<c:if test="${vo.diffTime > 24}">${fn:substring(vo.dateNow,0,10)}</c:if>
		      </td>
		    </tr>
		  </c:forEach>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		      <td>${curScrStartNo}</td>
		      <td>
		      	<a href="${ctp}/support/noticeContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
		      	<c:if test="${vo.diffTime <= 24}"><img src="${ctp}/images/new.png" width="40px" height="20px"/></c:if>
		      </td>
		      <td>${vo.name}</td>
		      <td>
		      	<c:if test="${vo.diffTime <= 24}">${fn:substring(vo.dateNow,11,16)}</c:if>
		      	<c:if test="${vo.diffTime > 24}">${fn:substring(vo.dateNow,0,10)}</c:if>
		      </td>
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	  </table>
  </div>
  <br/><br/>
 <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/support/notice?pag=1&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/support/notice?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='${ctp}/support/notice?pag=${i}&pageSize=${pageSize}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/support/notice?pag=${i}&pageSize=${pageSize}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/support/notice?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/support/notice?pag=${totPage}&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<br/><br/><br/><br/><br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>