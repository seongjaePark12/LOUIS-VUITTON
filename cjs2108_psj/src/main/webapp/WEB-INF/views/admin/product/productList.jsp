<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/productList.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
<br/><br/><br/><br/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  <form name="myform">
	  <table class="table table-boderless m-0">
				<tr>
					<td colspan="2">
						<h2 style="text-align: center;">상품 리스트</h2>
					</td>
				</tr>
				<tr>
					<td style="text-align: left">
						<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp;
						<input type="button" value="선택상품 삭제" onclick="selectDelCheck()" class="btn btn-warning btn-sm"/>
						<input type="button" value="전체보기" onclick="location.href='${ctp}/product/productList';" class="btn btn-warning btn-sm"/>
					</td>
					<td style="text-align: right">
						<input type="text" name="productName" value="${productName}" placeholder="검색할상품명입력"/>
						<input type="button" value="개별검색" onclick="midSearch()" class="btn btn-warning btn-sm" />
					</td>
				</tr>
			</table>
			<table class="table">
				<tr style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
					<th>선택</th>
					<th>번호</th>
					<th>상품코드</th>
					<th>상품명</th>
					<th>판매가격<a href="javascript:location.href='${ctp}/product/mainPriceL?disPriceSw=LOW';"><i class="fa fa-caret-down"></i></a>&nbsp;<a href="javascript:location.href='${ctp}/product/mainPriceH?disPriceSw=HIGH';"><i class="fa fa-caret-up"></i></a></th>
					<th>할인가격<a href="javascript:location.href='${ctp}/product/mainPriceLL?disPriceSw=LOWD';"><i class="fa fa-caret-down"></i></a>&nbsp;<a href="javascript:location.href='${ctp}/product/mainPriceHH?disPriceSw=HIGHD';"><i class="fa fa-caret-up"></i></a></th>
				</tr>
					<c:forEach var="vo" items="${ProVos}">
				<tr>
					<td><input type="checkbox" name="chk" class="chk" value="${vo.idx}"/></td>
					<td>${curScrStartNo}</td>
					<td>${vo.productCode}</td>
					<td><a href="${ctp}/product/productContent?idx=${vo.idx}">${vo.productName}</a></td>
					<td><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</td>
					<td><fmt:formatNumber value="${vo.disPrice}" pattern="#,###"/>원</td>
				</tr>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
					</c:forEach>
			</table>
			</form>
						  <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
					<c:if test="${totPage != 0}">
						<c:if test="${pag != 1}">
							<li class="page-item"><a href="${ctp}/product/productList?pag=1&pageSize=${pageSize}" class="page-link text-warning" title="첫페이지">◀◀</a></li>
						</c:if>
						<c:if test="${curBlock > 0}">
							<li class="page-item"><a href="${ctp}/product/productList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-warning" title="이전">◀</a></li>
						</c:if>
						<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
							<c:if test="${i == pag && i <= totPage}">
								<li class="page-item active"><a href='${ctp}/product/productList?pag=${i}&pageSize=${pageSize}' class="page-link text-dark bg-warning border-warning">${i}</a></li>
							</c:if>
							<c:if test="${i != pag && i <= totPage}">
								<li class="page-item"><a href='${ctp}/product/productList?pag=${i}&pageSize=${pageSize}' class="page-link text-dark">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${curBlock < lastBlock}">
							<li class="page-item"><a href="${ctp}/product/productList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-warning" title="다음">▶</a></li>
						</c:if>
						<c:if test="${pag != totPage}">
							<li class="page-item"><a href="${ctp}/product/productList?pag=${totPage}&pageSize=${pageSize}" class="page-link text-warning" title="마지막">▶▶</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>