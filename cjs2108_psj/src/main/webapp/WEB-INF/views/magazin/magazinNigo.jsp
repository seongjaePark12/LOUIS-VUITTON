<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루이 비통 X NIGO®</title>
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
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/magazin/magazinMain" class="btn w3-bar-item w3-margin-left"><i class="fa fa-arrow-left w3-xlarge"></i></a>
	</div>
		<img src="${ctp}/images/magazin/메거진nigo1.png" width="100%" class="card-img-bottom img-fluid" alt="image">
	<br/><br/><br/><br/>
	<div class="w3-row">
		<div class="w3-col s3 w3-center"><p>Magazin</p></div>
		<div class="w3-col s9 w3-left"><h2><b>루이 비통 X NIGO®</b></h2></div>
	</div>
	<br/>
	<div class="w3-row">
		<div class="w3-col s3 w3-center"><p></p></div>
		<div class="w3-col s9 w3-left"><h4>루이 비통의 두 번째 LV², “루이 비통 스퀘어드” 컬렉션 공개</h4></div>
	</div>
	<br/><br/><br/>
	<div class="w3-row">
		<div class="w3-col s3 w3-center"><h3><b>영상</b></h3></div>
		<div class="w3-col s9 w3-left"><h4>루이 비통이 두 번째 LV², “루이 비통 스퀘어드” 컬렉션을 선보이며 남성 아티스틱 디렉터 버질 아블로와 휴먼 메이드(Human Made)의 설립자 니고®(Nigo)의 독창성 넘치는 담화를 이어간다. 서로의 우정, 그리고 스트리트웨어로 익히 알려진 서브컬처를 공유한 경험으로 의기투합한 두 디자이너는, 의 엠블럼과 함께, 그들의 다양한 문화적 근원을 탐구한다. 두 번째 시즌의 컬렉션은 일본이라는 니고®의 출신 배경을 기념하며, 그가 자라온 패션 환경 속에 내재했던 태피스트리, 그리고 소년 시절부터 그에게 스며든 서양 남성 복식을 바라보는 지역 특색의 시선들이 교차하며 확장된다.</h4></div>
	</div>
	<br/><br/><br/>
	<div class="w3-content" style="max-width:80%;">
		<div class="mySlides w3-display-containerMain w3-center">
			<video class="menu3" width="100%" src="${ctp}/images/magazin/메거진nigo.mp4" autoplay loop style="display: block;" muted></video>
		</div>
	</div>
	<br/><br/><br/><br/>
	<div class="w3-row">
		<div class="w3-col s3 w3-center"><h3><b>캠페인</b></h3></div>
		<div class="w3-col s9 w3-left"><h4>
			컬렉션의 핵심 피스들은 일본 전통 의상에서 특징을 가져왔다. 네이비 울 코트의 벨트는 일본 전통 의상의 허리띠를 떠오르게 하고, 스트라이프 모노그램의 테일러드 재킷은 몸을 감싸는 구조를 차용했으며, 셔츠에도 전통 의상 코드를 적용했다. 이러한 문화적 만남은 자연스럽게 여행 영역에서도 표현되었다. 클래식 다미에 패턴이 우표를 연상시키는 패턴으로 레드와 화이트 셔츠, 플리스 재킷, 탈착 가능한 저지 슬리브에 녹아들었다. 마찬가지로 버질 아블로는 그가 적용해왔던 여행 중심 액세서리의 변신, 즉 가방이나 의상의 변형 기법을 재킷에도 반영하고, 루이 비통 가방에 사용된 모노그램 캔버스를 활용했다.</h4></div>
	</div>
	<br/><br/><br/><br/>
	<div class="container">
		<div class="row">
			<!-- blog grid -->
			<div class="col-lg-6">
				<div class="card border-0">
					<div class="card-header p-0">
							<img src="${ctp}/images/magazin/메거진nigo2.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card border-0">
					<div class="card-header p-0">
							<img src="${ctp}/images/magazin/메거진nigo3.png" width="600" height="650" class="card-img-bottom img-fluid" alt="image">
					</div>
				</div>
			</div>
		</div>
	</div>
	<br/><br/>
	<div class="w3-content" style="max-width:100%;">
		<img src="${ctp}/images/magazin/메거진nigo4.png" width="100%" class="card-img-bottom img-fluid" alt="image">
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>