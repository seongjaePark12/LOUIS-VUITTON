<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루이비통 위치</title>
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
	<div align="center" style=" text-align: center; background: linear-gradient(120deg,#8D5731,#DAC85D); color: transparent; -webkit-background-clip: text;"><h1><b>LOUIS VUITTON 공식판매점</b></h1></div><br/>
	<div class="row" style="margin:50px 50px;">
		<div class="col-lg-9">
			<div id="map" style="width:95%;height:600px;"></div>
			<p id="result"></p>
		</div>
		<div class="col-lg-3">
			<div class="row">
				<div class="col-lg-5">
					<img src="${ctp}/images/map/본점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 코리아(본사)</div>
					<div>서울특별시 강남구 삼성로 511</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 신세계 인천국제공항 면세점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이 비통 신세계 인천국제공항 면세점</div>
					<div>인천광역시 중구 운서동 공항로 271</div>
					<div>+82327434500</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 롯데 인천 터미널점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이 비통 롯데 인천 터미널점</div>
					<div>인천광역시 Michuhol-gu</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/대구중구.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이 비통 현대 대구점</div>
					<div>북구 태평로 161, 롯데백화점 1층 702-746 대구</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/대구동구.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이 비통 신세계 대구점</div>
					<div>대구광역시 동구 신천동 동부로 149</div>
					<div>+8215881234</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/부산.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이 비통 롯데 부산 서면점</div>
					<div>롯대백화점, 503-15, 부전동, 진구,부산</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/강남.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 신세계백화점강남점</div>
					<div>서울특별시 서초구 반포동 19-3</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 메종 서울.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 메종 서울</div>
					<div>서울특별시 강남구 청담동 압구정로 454</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/신세계.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 신세계본점</div>
					<div>서울특별시 중구 충무로1가 소공로 63 신세계백화점 신관 가서울 6층</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 신세계 타임스퀘어점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통신세계백화점영등포점</div>
					<div>서울특별시 영등포구 영등포동4가</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 현대 목동점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 현대백화점 목동점</div>
					<div>1F Hyundai Department Store, 916, Mok 1-Dong, 양천구 서울특별시</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 서울 신라 면세점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 서울신라면세점</div>
					<div>서울특별시 중구 장충동 동호로 249</div>
					<div>+82222334010</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/루이 비통 서울 롯데 면세점.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 롯데월드타워면세점</div>
					<div>서울특별시 송파구 잠실동 40-1</div>
					<div>+82232136990</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/동화.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 서울동화면세점</div>
					<div>Dongwha Duty Free Shop Gwangwhamoon B/D, 211-1 Sejongro Chongro-Ku, 서울특별시</div>
					<div>+8223993080</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/대전.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이 비통 대전 갤러리아 타임월드</div>
					<div>대전광역시 서구 대덕대로 211</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/울산.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 현대 울산점</div>
					<div>울산광역시 남구 삼산동 삼산로 261</div>
					<div>+82234321854</div><hr/>
				</div>
				<div class="col-lg-5">
					<img src="${ctp}/images/map/광주.png" width="100px">
				</div>
				<div class="col-lg-7">
					<div>루이비통 광주 신세계점</div>
					<div>1F Shinsegae Department Store, 49-1 Gwangchundong, Seogu, 광주광역시</div>
					<div>+82234321854</div><hr/>
				</div>
			</div>
		</div>		
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c92e0ec819dc03ce031fff6ae64596dd"></script>
	<script>
    var imageSize = new kakao.maps.Size(75, 75), // 마커이미지의 크기입니다
    	imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.504412998532544, 130.86311921460725), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '<div>루이비통 코리아(본사)</div>', 
		        latlng: new kakao.maps.LatLng(37.507650902155845, 127.05549409704372)
		    },
		    {
		        content: '<div>루이 비통 신세계 인천국제공항 면세점</div>', 
		        latlng: new kakao.maps.LatLng(37.44935394952594, 126.45047604337404)
		    },
		    {
		        content: '<div>루이 비통 롯데 인천 터미널점</div>', 
		        latlng: new kakao.maps.LatLng(37.44276976993389, 126.70087698519482)
		    },
		    {
		        content: '<div>루이 비통 현대 대구점</div>', 
		        latlng: new kakao.maps.LatLng(35.87600636373499, 128.59522371047387)
		    },
		    {
		        content: '<div>루이 비통 신세계 대구점</div>', 
		        latlng: new kakao.maps.LatLng(35.87771430878011, 128.62860325021788)
		    },
		    {
		        content: '<div>루이 비통 롯데 부산 서면점 여성</div>', 
		        latlng: new kakao.maps.LatLng(35.15691215281527, 129.05661237592886)
		    },
		    {
		        content: '<div>루이 비통 대전 갤러리아 타임월드</div>', 
		        latlng: new kakao.maps.LatLng(36.35531452817578, 127.37832417549072)
		    },
		    {
		        content: '<div>루이비통 신세계백화점강남점</div>', 
		        latlng: new kakao.maps.LatLng(37.50741520407013, 127.00376661617722)
		    },
		    {
		        content: '<div>루이비통 메종 서울</div>', 
		        latlng: new kakao.maps.LatLng(37.52761919396323, 127.04553035479873)
		    },
		    {
		        content: '<div>루이비통 신세계본점</div>', 
		        latlng: new kakao.maps.LatLng(37.562482568992095, 126.9813190008434)
		    },
		    {
		        content: '<div>루이비통신세계백화점영등포점</div>', 
		        latlng: new kakao.maps.LatLng(37.5189773474639, 126.90433084521351)
		    },
		    {
		        content: '<div>루이비통 현대백화점 목동점</div>', 
		        latlng: new kakao.maps.LatLng(37.52675390487808, 126.8750051222956)
		    },
		    {
		        content: '<div>루이비통 서울신라면세점</div>', 
		        latlng: new kakao.maps.LatLng(37.558795387692314, 127.0078045615348)
		    },
		    {
		        content: '<div>루이비통 롯데월드타워면세점</div>', 
		        latlng: new kakao.maps.LatLng(37.51310253314067, 127.10267385115593)
		    },
		    {
		        content: '<div>루이비통 서울동화면세점</div>', 
		        latlng: new kakao.maps.LatLng(37.569640386102115, 126.97609563892313)
		    },
		    {
		        content: '<div>루이비통 현대 울산점</div>', 
		        latlng: new kakao.maps.LatLng(35.53968136509428, 129.33576829643206)
		    },
		    {
		        content: '<div>루이비통 광주 신세계점</div>', 
		        latlng: new kakao.maps.LatLng(35.16053285738306, 126.88259881497736)
		    }
		];
		for (var i = 0; i < positions.length; i ++) {
			 var imageSrc = '${ctp}/images/map/map.png'; // 마커이미지의 주소입니다    
				
			   //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption); 
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커의 위치
		        image : markerImage 
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>