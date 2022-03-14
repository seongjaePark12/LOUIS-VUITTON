<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${ctp}/css/login.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<div class="w3-top" style="background-color: white;">
	<div style="background-color: white;">
		<a href="${ctp}/member/main" class="btn w3-bar-item" style="font-size:20px; font-weight: bold;">LOUIS VUITTON</a>
		| MYLV 로그인
	</div>
</div>
<p><br/><br/></p>
 <div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
      <div class="col-lg-3">
       </div>
			 <div class="col-lg-6 px-5 pt-5 mt-5">
			   <div align="center"><img src="${ctp}/images/login/Daco_4575367.png" id="imgimg"></div>
			   <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo">아이디 찾기 결과</h1>
			   <br/><br/>
			   <form class="needs-validation" method="post" novalidate>
			     <div class="col-lg-12">
			       <div class="txtb text-center" style="font-size:20pt;">
			       	${mid}
			       </div>
			       <br/><br/>
			       <div class="col-lg-12" align="center">
			       	<input type="button" class="logbtn" onclick="location.href='${ctp}/member/login'" value="돌아가기">
			       </div>
			     </div>
			     <br/><br/>
			     <div align="center">
			       <a href="${ctp}/member/pwdConfirm" style="font-size:16px">비밀번호를 잊으셨나요?</a> 
			     </div>
			      <br/>
			    </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>