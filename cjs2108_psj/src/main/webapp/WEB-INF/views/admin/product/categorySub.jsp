<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소분류 등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/categorySub.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  <form name="categorySubForm">
		 		<h2 class="text-center">소분류 관리</h2><br/><br/>
		  	<select name="categoryMainCode" onchange="categoryMainChange()">
		  	  <option value="">대분류명</option>
		  	  <c:forEach var="mainVo" items="${mainVos}">
		  	    <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
		  	  </c:forEach>
		  	</select> &nbsp; &nbsp;
		  	<select name="categoryMiddleCode" id="categoryMiddleCode">
		  	  <option value="">중분류명</option>
		  	  <c:forEach var="middleVo" items="${middleVos}">
		  	    <option value=""></option>
		  	  </c:forEach>
		  	</select> &nbsp; &nbsp;
		  	코드는 숫자 3자리
		  	<input type="text" name="categorySubCode"/> &nbsp; &nbsp;
		  	소분류명
		  	<input type="text" name="categorySubName"/>
		  	<input type="button" value="소분류등록" onclick="categorySubCheck()" class="btn btn-secondary btn-sm"/>
			  <table class="table table-hover m-3">
			    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
			      <th>소분류코드명</th>
			      <th>소분류명</th>
			      <th>중분류명</th>
			      <th>대분류명</th>
			      <th>삭제</th>
			    </tr>
			    <c:forEach var="subVo" items="${subVos}" varStatus="st">
			    	<tr class="text-center">
			    	  <td>${subVo.categorySubCode}</td>
			    	  <td>${subVo.categorySubName}</td>
			    	  <td>${subVo.categoryMiddleName}</td>
			    	  <td>${subVo.categoryMainName}</td>
			    	  <td><a href="javascript:delCategorySub('${subVo.categorySubCode}');"><i class="fa fa-close"></i></a></td>
			    	</tr>
			    </c:forEach>
			  </table>
		  </form>
		</div>
	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>