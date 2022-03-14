<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script>
  	// 댓글 삭제
  	function DelCheck(idx){
  		var query = {idx : idx};
  		var ans = confirm("삭제 하시겠습니까?");
  		if(!ans) return;
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/admin/simpleAdmin",
  			data : query,
  			success:function(){
  				location.reload();
  			},
  			error:function(){
					alert("전송오류");
				}
  		});
  	}
  	//부분검색
  	function whatCheck() {
		  var what = whatForm.what.value;
		  location.href = "${ctp}/admin/simpleAdmin?pag=${pag}&pageSize=${pageSize}&what="+what;
	  } 
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
<br/><br/><br/><br/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h2>자주하는질문</h2></td>
	    </tr>
			<tr>
		 		<td class="text-right p-0">
	      	<c:if test="${sLevel == 0 }">
	        	<a href="${ctp}/admin/simpleInput" class="btn btn-outline-warning btn w3-border w3-round-xxlarge font6 m-0">글쓰기</a>
	        </c:if>
     		</td>
     	</tr>
     	<tr>	
     		<td class="text-left">
     			<form name="whatForm">
						<select name="what" id="what" onchange="whatCheck()" class="w3-panel w3-border w3-round-xxlarge m-0">
	            <option value="" ${what == '' ? 'selected' : '' }>전체</option>
	            <option value="FAQ" ${what == 'FAQ' ? 'selected' : '' }>사이트관련</option>
	            <option value="회원관리" ${what == '회원관리' ? 'selected' : '' }>회원관리</option>
	            <option value="배송관리" ${what == '배송관리' ? 'selected' : '' }>배송관리</option>
	            <option value="교환및환불" ${what == '교환및환불' ? 'selected' : '' }>교환및환불</option>
	            <option value="제품관련" ${what == '제품관련' ? 'selected' : '' }>제품관련</option>
	            <option value="COVID-19안내사항" ${what == 'COVID-19안내사항' ? 'selected' : '' }>COVID-19 안내사항</option>
						</select>
					</form>
				</td>
	    </tr>
	  </table>
		<table class="table text-center">
			<thead>
	    <tr class="tablehead text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
	      <th style="width:20%">번호</th>
	      <th style="width:80%">제목</th>
	    </tr>
	    </thead>
		</table>
		<div class="accordion text-left">
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="item"><h6><span style="margin: 0 30px 0 50px;">${st.count}</span><span style="margin-left: 50px;">${vo.title}</span></h6></div>
					<div class="w3-animate-zoom" style="display: none;">
						<br/>
						<span style="margin-left: 50px;">${fn:replace(vo.content,newLine,'<br/>')}
							<c:if test="${sLevel == 0}">
			 					<a href="javascript:DelCheck(${vo.idx})" class="btn btn-outline-warning btn-sm ">삭제</a>
			 				</c:if>
		 				</span>
		 				<br/>
					</div>
					<hr/>			
			</c:forEach>
		</div>
			  <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
					<c:if test="${totPage != 0}">
						<c:if test="${pag != 1}">
							<li class="page-item"><a href="${ctp}/admin/simpleAdmin?pag=1&pageSize=${pageSize}&what=${what}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
						</c:if>
						<c:if test="${curBlock > 0}">
							<li class="page-item"><a href="${ctp}/admin/simpleAdmin?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&what=${what}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
						</c:if>
						<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
							<c:if test="${i == pag && i <= totPage}">
								<li class="page-item active"><a href='${ctp}/admin/simpleAdmin?pag=${i}&pageSize=${pageSize}&what=${what}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
							</c:if>
							<c:if test="${i != pag && i <= totPage}">
								<li class="page-item"><a href='${ctp}/admin/simpleAdmin?pag=${i}&pageSize=${pageSize}&what=${what}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${curBlock < lastBlock}">
							<li class="page-item"><a href="${ctp}/admin/simpleAdmin?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&what=${what}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="다음">▶</a></li>
						</c:if>
						<c:if test="${pag != totPage}">
							<li class="page-item"><a href="${ctp}/admin/simpleAdmin?pag=${totPage}&pageSize=${pageSize}&what=${what}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
		<!-- 블록 페이징처리 끝 -->
	<script>
		$(document).ready(function() {
		    'use strict';
		    $('.item').on("click", function () {
		        $(this).next().slideToggle(100);
		        $('p').not($(this).next()).slideUp('fast');
		    });
		});    
	</script>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>