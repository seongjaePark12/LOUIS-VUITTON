<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는질문 입력</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script>
    function fCheck() {
    	var title = myform.title.value;
    	var content = myform.content.value;
    	
    	if(title.trim() == "") {
    		alert("게시글 제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(content.trim() == "") {
    		alert("글내용을 입력하세요");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
<br/><br/>
<form name="myform" method="post">
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  	<table class="table table-boderless">
				<tr>
					<td><h2>자주하는 질문 입력창</h2></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>글제목</th>
					<td><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required /></td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td>
						<select name="what" id="what" class="custom-select" required >
	              <option value="FAQ" selected>FAQ</option>
	              <option value="회원관리">회원관리</option>
	              <option value="배송관리" >배송관리</option>
	              <option value="교환및환불" >교환및환불</option>
	              <option value="제품관련">제품관련</option>
	              <option value="COVID-19안내사항">COVID-19안내사항</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea rows="6" name="content" class="form-control" required ></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="button" value="글올리기" onclick="fCheck()" class="btn btn-outline-warning"/>
						<input type="reset" value="다시입력" class="btn btn-outline-warning"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>