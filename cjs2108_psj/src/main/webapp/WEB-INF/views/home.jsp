<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<html>
<head>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<link rel="stylesheet" href="${ctp}/resources/css/menu.css">
	<link rel="stylesheet" href="${ctp}/resources/css/nav.css">
	<title>PSJ 스프링 프로젝트</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');
		a,div{
		  font-family: 'Nanum Myeongjo', serif;
		}	
		.hh{
			color: black; 
			font-size: 16px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-display-container w3-wide" id="home">
		<video width="100%" src="${ctp}/resources/images/main/메인.mp4" autoplay loop style="display: block;" muted></video>
    <div class="w3-display-bottomleft w3-padding-large">
      <h3 class="w3-text-white"><b>FASHION BLOG</b></h3>
			<h5><a href="" class="w3-button w3-round-large w3-white w3-hover-opacity-off w3-medium">쇼보기</a></h5>
    </div>
  </div>
	<div class="w3-display-container w3-wide" id="home">
		<video width="100%" src="${ctp}/resources/images/main/메인4.mp4" autoplay loop style="display: block;" muted></video>
    <div class="w3-display-bottomleft w3-padding-large">
      <h3 class="w3-text-white"><b>FASHION BLOG</b></h3>
			<h5><a href="" class="w3-button w3-round-large w3-white w3-hover-opacity-off w3-medium">쇼보기</a></h5>
    </div>
  </div>
	<div class="w3-display-container w3-wide" id="home">
		<video width="100%" src="${ctp}/resources/images/main/메인3.mp4" autoplay loop style="display: block;" muted></video>
    <div class="w3-display-bottomleft w3-padding-large">
      <h3 class="w3-text-white"><b>FASHION BLOG</b></h3>
     <h5><a href="" class="w3-button w3-round-large w3-white w3-hover-opacity-off w3-medium">쇼보기</a></h5>
    </div>
  </div>
	<div class="w3-display-container w3-wide" id="home">
		<video width="100%" src="${ctp}/resources/images/main/메인2.mp4" autoplay loop style="display: block;" muted></video>
    <div class="w3-display-bottomleft w3-padding-large">
      <h3 class="w3-text-white"><b>2022 여성 크루즈 컬렉션</b></h3>
      <h5><a href="" class="w3-button w3-round-large w3-white w3-hover-opacity-off w3-medium">쇼보기</a></h5>
    </div>
  </div>
<!-- 메인 -->
	<br/><br/>
	<div class="container">
		<div class="title-section text-center mb-md-5 mb-4">
			<h3 class="w3ls-title mb-3">신상품을 확인 하세요</h3>
		</div>
		<div class="row">
			<!-- blog grid -->
			<div class="col-lg-6">
				<div class="card border-0">
					<div class="card-header p-0">
							<a href="#"><img src="${ctp}/resources/images/main/새상품보기1.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image"></a>
					</div>
					<div class="card-body text-center mt-2">
						<h5 class="blog-title card-title mb-2"><a href="#">2022신상</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-6 ">
				<div class="card border-0">
					<div class="card-header p-0">
							<a href="#"><img src="${ctp}/resources/images/main/새상품보기2.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image"></a>
						</div>
						<div class="card-body text-center mt-2">
							<h5 class="blog-title card-title mb-2"><a href="#">그를 위한 지갑 선물</a></h5>
						</div>
					</div>
			</div>
		</div>
	</div>
	<br/><br/>
	<div style="text-align: center; font-size: 25px;">쇼핑 도움말</div>
	<div class="w3-row w3-container" style="margin:50px 0 ;" >
		<div class="w3-half w3-container w3-margin-bottom" style="background: white;">
			<div>
				<a href="#"><img src="${ctp}/resources/images/main/쇼핑도움말1.png" style="width:100%"></a>
				<div class="hh"><b>어드바이저와 실시간 대화</b></div>
				<div class="hh">온라인 쇼핑 관련 도움이 필요하신 경우 루이 비통의 클라이언트 어드바이저가 도와드리겠습니다</div>
				<div class="hh"><a href="#">바로가기</a></div>
			</div>
		</div>
		<div class="w3-half w3-container w3-margin-bottom" style="background: white;">
			<div>
				<a href="#"><img src="${ctp}/resources/images/main/쇼핑도움말2.png" style="width:100%"></a>
				<div class="hh"><b>매장 정보 및 안내</b></div>
				<div class="hh">나의 위치에서 가장 가까운 루이 비통 매장을 방문해보세요</div>
				<div class="hh"><a href="#">바로가기</a></div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/resources/js/menu.js"></script>
  <script src="${ctp}/resources/js/menu2.js"></script>
  <script src="${ctp}/resources/js/menu3.js"></script>
</body>
</html>
