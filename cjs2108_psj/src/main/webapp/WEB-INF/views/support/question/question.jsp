<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q＆A 리스트</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/niceSelect.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script>
  	//부분검색
  	function whatCheck() {
		  var what = whatForm.what.value;
		  location.href = "${ctp}/support/question?pag=${pag}&pageSize=${pageSize}&what="+what;
	  } 
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">Q＆A</h1></div>
	<!-- <div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">Q＆A</h1></div> -->
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-margin-left"><i class="fa fa-arrow-left w3-xlarge"></i></a>
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">Q＆A</a>
		<a href="${ctp}/support/notice" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">공지사항</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/support/notice" class="w3-bar-item w3-button w3-border-bottom">공지사항</a>
		<a href="${ctp}/support/question" class="w3-bar-item w3-button w3-border-bottom">Q＆A</a>
	</div>
  <div class="w3-container" id="showcase">
		<table class="table table-borderless">
	    <tr>
	    	<td>
    		<c:if test="${sLevel == 1 || sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5 }">
        	<a href="${ctp}/support/questionInput" class="text-left btn btn-outline-warning w3-border w3-round-xxlarge font6">글쓰기</a>
        </c:if>
        </td>
	    </tr>
	    <tr>
	    	<td>
	    		<form name="whatForm">
	 					<select name="what" id="what" onchange="whatCheck()" class="nice-select text-left">
	            <option value="" ${what == '' ? 'selected' : '' }>문의유형 전체</option>
	            <option value="상품문의" ${what == '상품문의' ? 'selected' : '' }>상품문의</option>
	            <option value="반품문의" ${what == '반품문의' ? 'selected' : '' }>반품문의</option>
	            <option value="배송문의" ${what == '배송문의' ? 'selected' : '' }>배송문의</option>
	            <option value="불량/오발송문의" ${what == '불량/오발송문의' ? 'selected' : '' }>불량/오발송문의</option>
	            <option value="A/S" ${what == 'A/S' ? 'selected' : '' }>A/S</option>
	            <option value="기타" ${what == '기타' ? 'selected' : '' }>기타</option>
						</select>
					</form>
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
		      	<a href="${ctp}/support/questionContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
		      	<c:if test="${vo.diffTime <= 24}"><img src="${ctp}/images/new.png" width="40px" height="20px"/></c:if>
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
  <br/><br/>
 <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/support/question?pag=1&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/support/question?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='${ctp}/support/question?pag=${i}&pageSize=${pageSize}&what=${what}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/support/question?pag=${i}&pageSize=${pageSize}&what=${what}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/support/question?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/support/question?pag=${totPage}&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="마지막">▶▶</a></li>
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