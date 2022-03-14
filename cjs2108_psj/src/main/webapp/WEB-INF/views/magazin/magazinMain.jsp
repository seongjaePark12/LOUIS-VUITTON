<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Magazine</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<br/><br/><br/><br/>
	<div class="text-center">
		<h1 style="font-size: 80px; color: black;"><b>Magazine</b></h1>
	</div>
	<br/><br/><br/><br/>
	<div class="container">
		<div class="w3-content" style="max-width:100%;">
			<a href="${ctp}/magazin/magazin2022men2">
				<img src="${ctp}/images/magazin/메거진메인9.png" class="card-img-bottom img-fluid" alt="image">
			</a>
			<h3 style="text-align: center; font-size: 25px; color: black;"><a href="${ctp}/magazin/magazin2022men2"><b>루이 비통 2022 가을-겨울 남성 쇼</b></a></h3>
		</div>
	</div>
	<br/><br/><br/><br/>
	<div class="row w3-margin">
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazinCu">
						<img src="${ctp}/images/magazin/메거진메인2.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazinCu"><b>루이 비통 2022 크루즈 컬렉션</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazinMiranda">
						<img src="${ctp}/images/magazin/미란다커3.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazinMiranda"><b>미란다 커(MIRANDA KERR)가 선보이는 카퓌신 백</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazin2022men">
						<img src="${ctp}/images/magazin/메거진메인8.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazin2022men"><b>루이 비통 2022 봄-여름 남성 캠페인</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazinFung">
						<img src="${ctp}/images/magazin/메거진메인3.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazinFung"><b>우아한 아름다움을 선사하는 퐁 뇌프 백</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazinNigo">
						<img src="${ctp}/images/magazin/메거진메인4.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazinNigo"><b>루이 비통 X NIGO®</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazin2022Cu">
						<img src="${ctp}/images/magazin/메거진메인5.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazin2022Cu"><b>루이 비통 2022 봄-여름 여성 쇼</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazinPo">
						<img src="${ctp}/images/magazin/메거진메인6.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazinPo"><b>루이 비통 X 포르나세티</b></a></h2>
			</div>
		</div>
		<div class="col-lg-3 w3-margin-bottom">
			<div class="card border-0">
				<div class="card-header p-0">
					<a href="${ctp}/magazin/magazinKa">
						<img src="${ctp}/images/magazin/메거진메인7.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</a>
				</div>
				<h2 style="text-align: center; font-size: 20px; color: black;"><a href="${ctp}/magazin/magazinKa"><b>로렌 산토 도밍고 (LAUREN SANTO DOMINGO)의 루이 비통 카퓌신 캠페인</b></a></h2>
			</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>