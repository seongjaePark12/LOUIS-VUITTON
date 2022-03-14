<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/adminBooking.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<form name="myform" method="post">
  <div class="w3-container" id="showcase">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h1>예약현황</h1></td>
	    </tr>
    	<tr>
				<td>
					<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp;
					<input type="button" value="선택항목 삭제" onclick="selectDelCheck()" class="btn btn-warning btn-sm"/>
				</td>
				<td style="text-align: right">
					<input type="text" name="name" value="${name}" placeholder="검색할아이디입력"/>
					<input type="button" value="개별검색" onclick="nameSearch()" class="btn btn-warning btn-sm" />
					<input type="button" value="전체보기" onclick="location.href='${ctp}/admin/booking';" class="btn btn-warning btn-sm"/>
				</td>
			</tr>
  	</table>
	  <table class="table table-hover text-center">
	    <tr class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
	      <th style="width:10%">선택</th>
	      <th style="width:10%">번호</th>
	      <th style="width:30%">이름</th>
	      <th style="width:30%">날짜</th>
	      <th style="width:20%">시간</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		    	<td><input type="checkbox" name="chk" class="chk" value="${vo.idx}"/></td>
		      <td>${curScrStartNo}</td>
		      <td>${vo.name}</td>
		      <td>${vo.booDate}</td>
		      <td>${vo.booTime}</td>
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	  </table>
  </div>
</form>  
  <br/><br/>
 <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/admin/booking?pag=1&pageSize=${pageSize}&name=${name}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/admin/booking?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&name=${name}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='${ctp}/admin/booking?pag=${i}&pageSize=${pageSize}&name=${name}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/admin/booking?pag=${i}&pageSize=${pageSize}&name=${name}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/admin/booking?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&name=${name}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/admin/booking?pag=${totPage}&pageSize=${pageSize}&name=${name}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<br/><br/><br/><br/><br/><br/>
  </div> 
<script src="${ctp}/js/admin.js"></script>
</body>
</html>