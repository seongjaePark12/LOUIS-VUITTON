<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대분류 등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/categoryMain.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	    <form name="categoryMainForm">
		  	<h2 class="text-center">대분류 관리</h2><br/><br/>
		  	대분류코드(코드는 영문대문자1자리)
		  	<input type="text" name="categoryMainCode"/> &nbsp; &nbsp;
		  	대분류명
		  	<input type="text" name="categoryMainName"/>
		  	<input type="button" value="대분류등록" onclick="categoryMainCheck()" class="btn btn-warning btn-sm"/>
			  <table class="table table-hover m-3">
			    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
			      <th>대분류코드</th>
			      <th>대분류명</th>
			      <th>삭제</th>
			    </tr>
			    <c:forEach var="mainVo" items="${mainVos}" varStatus="st">
			    	<tr class="text-center">
			    	  <td>${mainVo.categoryMainCode}</td>
			    	  <td>${mainVo.categoryMainName}</td>
			    	  <td><a href="javascript:delCategoryMain('${mainVo.categoryMainCode}');"><i class="fa fa-close"></i></a>
			    	</tr>
			    </c:forEach>
			  </table>
		  </form>
		</div>
	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>