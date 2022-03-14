<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q＆A</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/adminQustion.js"></script>
	<script>
  	//부분검색
  	function whatCheck() {
		  var what = myform.what.value;
		  location.href = "${ctp}/admin/question?pag=${pag}&pageSize=${pageSize}&what="+what;
	  } 
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<form name="myform" method="post">
  <div class="w3-container" id="showcase">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h1>Q＆A</h1></td>
	    </tr>
    	<tr>
				<td>
					<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp;
					<input type="button" value="선택항목 삭제" onclick="selectDelCheck()" class="btn btn-warning btn-sm"/>
					<select name="anser2" onchange="selectLevelCheck()">
							<option value="">답변</option>
							<option value="0">답변대기</option>
							<option value="1">답변완료</option>
					</select>					
				</td>
			</tr>
	    <tr>
	    	<td>
 					<select name="what" id="what" onchange="whatCheck()" class="nice-select text-left">
            <option value="" ${what == '' ? 'selected' : '' }>문의유형 전체</option>
            <option value="상품문의" ${what == '상품문의' ? 'selected' : '' }>상품문의</option>
            <option value="반품문의" ${what == '반품문의' ? 'selected' : '' }>반품문의</option>
            <option value="배송문의" ${what == '배송문의' ? 'selected' : '' }>배송문의</option>
            <option value="불량/오발송문의" ${what == '불량/오발송문의' ? 'selected' : '' }>불량/오발송문의</option>
            <option value="A/S" ${what == 'A/S' ? 'selected' : '' }>A/S</option>
            <option value="기타" ${what == '기타' ? 'selected' : '' }>기타</option>
					</select>
	    	</td>
	    </tr>
  	</table>
	  <table class="table table-hover text-center">
	    <tr class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
	      <th style="width:5%">선택</th>
	      <th style="width:5%">번호</th>
	      <th style="width:40%">제목</th>
	      <th style="width:10%">문의유형</th>
	      <th style="width:10%">작성자</th>
	      <th style="width:10%">답변</th>
	      <th style="width:10%">작성일</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		    	<td><input type="checkbox" name="chk" class="chk" value="${vo.idx}"/></td>
		      <td>${curScrStartNo}</td>
		      <td>
		      	<a href="${ctp}/admin/questionContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
		      	<c:if test="${vo.diffTime <= 24}"><img src="${ctp}/images/new.png" width="40px" height="20px"/></c:if>
		      </td>
		      <td>${vo.what}</td>
		      <td>${fn:substring(vo.mid,0,3)}**</td>
		      <td>
	      		<select name="anser" onchange="levelCheck(this)">
							<option value="0${vo.idx}" <c:if test="${vo.anser == 0}">selected</c:if>>답변대기</option>
							<option value="1${vo.idx}" <c:if test="${vo.anser == 1}">selected</c:if>>답변완료👍</option>
						</select>	
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
</form>  
  <br/><br/>
 <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/admin/question?pag=1&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/admin/question?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='${ctp}/admin/question?pag=${i}&pageSize=${pageSize}&what=${what}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/admin/question?pag=${i}&pageSize=${pageSize}&what=${what}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/admin/question?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/admin/question?pag=${totPage}&pageSize=${pageSize}&what=${what}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<br/><br/><br/><br/><br/><br/>
  </div> 
<script src="${ctp}/js/admin.js"></script>
</body>
</html>