<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
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
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
			<div class="container">
				<form name="myform" method="post">
					<table class="table table-boderless">
						<tr>
							<td><h2>공지사항 입력</h2></td>
						</tr>
					</table>
					<table class="table">
						<tr>
							<th>글쓴이</th>
							<td>${sName}</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required /></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required ></textarea></td>
						</tr>
						<tr>
							<th>공지옵션</th>
							<td>
								<input type="radio" name="notice" value="1">Main공지사항
         			  <input type="radio" name="notice" value="0" checked>비공지
	         		</td>
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
					<input type="hidden" name="name" value="${sName}"/>
				</form>
			</div>
   	</div>
  </div> 
<script>
	CKEDITOR.replace("content", {
		uploadUrl:"${ctp}/notice/imageUpload",		/* 여러개의 그림파일을 드래그&드롭으로 처리 */
		filebrowserUploadUrl : "${ctp}/notice/imageUpload", /* 파일(이미지) 업로드시 처리 */
		height:400
	});
</script>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>