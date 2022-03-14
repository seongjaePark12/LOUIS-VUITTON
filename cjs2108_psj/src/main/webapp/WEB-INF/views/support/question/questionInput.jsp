<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q＆A 등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/niceSelect.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/questionInput.js"></script>
</head>
<body  oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">Q＆A</h1></div>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-margin-left"><i class="fa fa-arrow-left w3-xlarge"></i></a>
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">Q＆A</a>
		<a href="${ctp}/support/notice" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">공지사항</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/support/notice" class="w3-bar-item w3-button w3-border-bottom">공지사항</a>
		<a href="${ctp}/support/question" class="w3-bar-item w3-button w3-border-bottom">Q＆A</a>
	</div>
	  <div class="w3-container" style="margin-top:80px" id="showcase">
			<div class="container">
				<form name="myform" method="post">
					<table class="table table-boderless">
						<tr>
							<td><h2>Q＆A 입력</h2></td>
						</tr>
					</table>
					<table class="table">
						<tr>
							<th>글쓴이</th>
							<td>${sMid}</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required /></td>
						</tr>
						<tr>
							<th>문의유형</th>
							<td>
								<select name="what" id="what" class="nice-select" required >
		              <option value="" disabled selected>문의유형</option>
		              <option value="상품문의">상품문의</option>
		              <option value="반품문의">반품문의</option>
		              <option value="배송문의">배송문의</option>
		              <option value="불량/오발송문의">불량/오발송문의</option>
		              <option value="A/S" >A/S</option>
		              <option value="기타">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required ></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center">
								<input type="button" value="글올리기" onclick="fCheck()" class="btn btn-outline-warning"/>
								<input type="reset" value="다시입력" class="btn btn-outline-warning"/>
								<input type="button" value="돌아가기" onclick="location.href='${ctp}/notice/noticeAdmin';" class="btn btn-outline-warning"/>
							</td>
						</tr>
					</table>
					<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
					<input type="hidden" name="mid" value="${sMid}"/>
				</form>
			</div>
   	</div>
<script>
	CKEDITOR.replace("content", {
		uploadUrl:"${ctp}/support/imageUpload",		/* 여러개의 그림파일을 드래그&드롭으로 처리 */
		filebrowserUploadUrl : "${ctp}/support/imageUpload", /* 파일(이미지) 업로드시 처리 */
		height:400
	});
</script>
 	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>