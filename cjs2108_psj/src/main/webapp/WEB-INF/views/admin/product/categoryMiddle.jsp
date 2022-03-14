<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중분류 등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/categoryMiddle.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  <form name="categoryMiddleForm">
		  	<h2 class="text-center">중분류 관리</h2><br/><br/>
		  	<select name="categoryMainCode">
		  	  <option value="">대분류명</option>
		  	  <c:forEach var="mainVo" items="${mainVos}">
		  	    <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
		  	  </c:forEach>
		  	</select> &nbsp; &nbsp;
		  	코드는 숫자 2자리
		  	<input type="text" name="categoryMiddleCode"/> &nbsp; &nbsp;
		  	중분류명
		  	<input type="text" name="categoryMiddleName"/>
		  	<input type="button" value="중분류등록" onclick="categoryMiddleCheck()" class="btn btn-secondary btn-sm"/>
			  <table class="table table-hover m-3">
			    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
			      <th>중분류코드명</th>
			      <th>중분류명</th>
			      <th>대분류명</th>
			      <th>삭제</th>
			    </tr>
			    <c:forEach var="middleVo" items="${middleVos}" varStatus="st">
			    	<tr class="text-center">
			    	  <td>${middleVo.categoryMiddleCode}</td>
			    	  <td>${middleVo.categoryMiddleName}</td>
			    	  <td>${middleVo.categoryMainName}</td>
			    	  <td><a href="javascript:delCategoryMiddle('${middleVo.categoryMiddleCode}');"><i class="fa fa-close"></i></a></td>
			    	</tr>
			    </c:forEach>
			  </table>
		  </form>
		</div>
	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>