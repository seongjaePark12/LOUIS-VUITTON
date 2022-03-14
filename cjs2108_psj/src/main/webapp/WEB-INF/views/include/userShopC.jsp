<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
	<div class="w3-border-top">
		<div class="w3-padding-16 w3-col s8 w3-left" style="margin-left: 5%;">
			<c:if test="${Spart == '001'}">
			<div style="font-size: 20px; color: black;"><b>PRECIOUS TIGER 컬렉션</b></div><br/>
			</c:if>
			<c:if test="${Spart == '002'}">
			<div style="font-size: 20px; color: black;"><b>루이 비통 2022 크루즈 컬렉션</b></div><br/>
			</c:if>
			<c:if test="${Spart == '003'}">
			<div style="font-size: 20px; color: black;"><b>자카드 데님 ＆ 브로더리</b></div><br/>
			</c:if>
			<c:if test="${Spart == '004'}">
			<div style="font-size: 20px; color: black;"><b>콜로뉴 퍼퓸</b></div><br/>
			</c:if>
			<c:if test="${Spart == '005'}">
			<div style="font-size: 20px; color: black;"><b>콜로뉴 퍼퓸</b></div><br/>
			</c:if>
			<c:if test="${Spart == '006'}">
			<div style="font-size: 20px; color: black;"><b>LV² COLLECTION</b></div><br/>
			</c:if>
			<c:if test="${Spart == '007'}">
			<div style="font-size: 20px; color: black;"><b>2022 봄-여름 패션쇼</b></div><br/>
			</c:if>
			<c:if test="${Spart == '008'}">
			<div style="font-size: 20px; color: black;"><b>파인 주얼리</b></div><br/>
			<div style="font-size: 15px;">모던한 디자인과 정교한 장인의 기술. 수석 보석 세공사의 손에서 탄생한 루이 비통의 여성 파인 주얼리 컬렉션. 명장이 귀금<span id="dots"></span><span id="more">속과 엄선된 보석, 눈부신 광채를 자아내는 다이아몬드를 완성한 시그니처 LV 볼트(LV Volt), B 블라썸(B Blossom), 컬러 블라썸(Color Blossom), 이딜 블라썸(Idylle Blossom) 및 스타 블라썸(Star Blossom) 라인의 귀걸이, 목걸이, 펜던트, 팔찌와 반지로 구성. 루이 비통에서 스털링 실버 소재로 선보이는 유니세프 실버 락킷(UNICEF Silver Lockit) 팔찌 라인도 포함.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '009'}">
			<div style="font-size: 20px; color: black;"><b>한정판매</b></div><br/>
			</c:if>
			<c:if test="${Spart == '010'}">
			<div style="font-size: 20px; color: black;"><b>숄더 ＆ 크로스 백</b></div><br/>
			<div style="font-size: 15px;">메종의 비길 데 없는 스타일을 비롯해 손을 사용하지 않는 편리한 휴대 경험을 선사하는 현대적인 감성의 루이 비통 여성 숄더 백 ＆<span id="dots"></span><span id="more">크로스 백 컬렉션. LV 퐁 뇌프(LV Pont 9), 도핀(Dauphine), 트위스트(Twist), 쁘띠뜨 말(Petite Malle), 쿠상(Coussin), 알마(Alma) 등 부드럽거나 구조적인 실루엣, 클래식하거나 트렌디한 디자인, 탈착형 또는 조절형 스트랩을 갖춘 다채로운 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '011'}">
			<div style="font-size: 20px; color: black;"><b>토트 백</b></div><br/>
			<div style="font-size: 15px;">도심과 해변, 주중과 주말 등 언제 어디서나 시그니처 감성을 선사하는 루이 비통의 스타일리시하고 실용적인 여성 토트 ＆<span id="dots"></span><span id="more">쇼퍼 백 컬렉션. 클래식한 네버풀(Neverfull)을 비롯해 온더고(Onthego), 락미 쇼퍼(Lockme Shopper), 온 마이 사이드(On My Side) 등 하우스의 아이코닉한 캔버스 또는 고급스러운 가죽 소재로 제작한 세련되고 넉넉한 디자인의 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '012'}">
			<div style="font-size: 20px; color: black;"><b>체인 백 ＆ 클러치</b></div><br/>
			<div style="font-size: 15px;">어떤 실루엣에도 스타일리시한 매력을 더해줄 루이 비통의 여성 체인 백 ＆<span id="dots"></span><span id="more">클러치 컬렉션. 랑데부(Rendez-Vous), 멀티 포쉐트 악세수아(Multi Pochette Accessoires), 트위스트(Twist) 체인 백 등 데일리 룩과 이브닝 룩에 모두 어울리는 아이템으로 구성. 파우치나 포쉐트처럼 다야양하게 활용할 수 있는 다양한 디자인.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '013'}">
			<div style="font-size: 20px; color: black;"><b>백팩 ＆ 벨트 백</b></div><br/>
			<div style="font-size: 15px;">스타일과 기능성을 겸비한 루이 비통의 여성 백팩 ＆ 벨트 백 컬렉션. 여성스러운 몽수리(Montsouris), 팜 스프링스(Palm Springs) 백팩과 같이 필수 소지품을 휴대할 수 있는 넉넉한 수납공간으로 많은 사랑을 받는 실용적인<span id="dots"></span><span id="more">시티 백부터 모노그램(Monogram) 및 모노그램 앙프렝뜨(Monogram Empreinte) 가죽 소재의 범백처럼 소지품을 안전하게 보관해주고 손을 사용하지 않고 편리하게 휴대할 수 있는 디자인까지 다채로운 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '014'}">
			<div style="font-size: 20px; color: black;"><b>이그조틱 레더 백</b></div><br/>
			<div style="font-size: 15px;">파이톤, 리자드, 밍크, 타조, 크로커다일 스킨 등 희귀하고 진귀한 소재를 사용해 루이 비통의 아뜰리에에서 수제작한 최고급 여성 백 컬렉션. 메종의 전설적인 노하<span id="dots"></span><span id="more">우를 바탕으로 숙련된 장인의 손에서 탄생하여 마치 오브제와 같이 평생을 함께하고도 남을 아름다움을 선사할 특별한 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '015'}">
			<div style="font-size: 20px; color: black;"><b>장지갑</b></div><br/>
			<div style="font-size: 15px;">아이코닉한 모노그램(Monogram) 캔버스 또는 하우스의 상징적인 가죽 소재로 제작한 우아하고 실용적인 디자인이 돋보이는 루이 비통의 여성 장지갑 컬렉션. 감각<span id="dots"></span><span id="more">적인 클러치로도 활용 가능한 트위스트(Twist) 및 카퓌신(Capucines) 라인. 매 시즌 새로운 세련된 패턴과 모티프로 재해석해 선보이는 지피(Zippy), 사라(Sarah), 클레망스(Clémence) 등의 클래식한 라인.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '016'}">
			<div style="font-size: 20px; color: black;"><b>반지갑</b></div><br/>
			<div style="font-size: 15px;">시그니처 가죽, 모노그램(Monogram) 캔버스 및 Since 1854 우븐 자카드 소재로 선보이는 루이 비통의 여성 반지갑 ＆ 동전 지갑.  현금, 카드 등 소지품을 수납할 수 있<span id="dots"></span><span id="more">는 여유로운 수납 공간을 갖추고 있으며 지퍼 또는 엔벨로프 스타일의 플랩을 구성한 세련되고 독창적인 디자인이 특징. 조에(Zoé), 빅토린(Victorine)과 지피 코인 퍼스(Zippy Coin Purse) 라인뿐만 아니라 새롭게 선보이는 줄리엣(Juliette) 및 클레아(Cléa) 라인을 포함하여 많은 사랑을 받는 모델로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '018'}">
			<div style="font-size: 20px; color: black;"><b>파우치</b></div><br/>
			<div style="font-size: 15px;">캔버스 또는 가죽 소재로 제작된 스타일리시하고 활용도 높은 아이템을 선보이는 루이 비통의 여성 파우치 컬렉션. 일상의 필수품을 휴대하기에 이상적인 데일리<span id="dots"></span><span id="more">파우치(Daily Pouch), 시티 파우치(City Pouch) 또는 포쉐트 멜라니(Pochette Mélanie). 다양한 용도로 사용할 수 있는 독창적인 디자인의 트리오 파우치(Trio Pouch)와 키리가미(Kirigami) 트리플 엔벨로프. 그 외 코스메틱 파우치와 토일렛 파우치도 함께 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '019'}">
			<div style="font-size: 20px; color: black;"><b>카드 홀더</b></div><br/>
			<div style="font-size: 15px;">에피(Epi)나 모노그램 앙프렝뜨(Monogram Empreinte)와 같은 상징적인 가죽 및 아이코닉한 모노그램(Monogram) 또는 다미에(Damier) 캔버스 소재로 제작하여 다채롭고<span id="dots"></span><span id="more">우아한 디자인을 선보이는 루이 비통 여성 카드 홀더 컬렉션. 시그니처를 새긴 금속 디테일로 포인트를 준 세련되고 실용적인 액세서리. 일부 아이템의 경우 열쇠나 작은 크기의 소지품 수납도 가능.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '020'}">
			<div style="font-size: 20px; color: black;"><b>벨트</b></div><br/>
			<div style="font-size: 15px;">감각적인 스트랩과 반짝이는 시그니처 버클이 조화를 이루는 세련되고 활용도 높은 루이 비통 여성 벨트. 메종의 아이코닉한 모노그램(Monogram) 캔버스, 다미에<span id="dots"></span><span id="more">(Damier) 캔버스 또는 고급 가죽 소재로 선보이는 필수 패션 액세서리. 리버서블 디자인을 비롯해 가느다란 실루엣부터 굵은 실루엣까지 허리 라인을 한층 강조하는 다양한 아이템.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '021'}">
			<div style="font-size: 20px; color: black;"><b>모자 ＆ 장갑</b></div><br/>
			<div style="font-size: 15px;">머리와 손에 스타일리시한 감각을 더해줄 루이 비통의 여성 모자 ＆ 장갑 컬렉션. 트렌디한 버킷 스타일, 따뜻한 울 소재의 비니, 경쾌한 이어머프, 스포티한 캡 등 아<span id="dots"></span><span id="more">이코닉한 하우스 시그니처가 새겨진 다양한 모자. 세련된 디테일이 돋보이는 포근한 글러브, 미튼, 핸드머프와 같이 손을 따스하게 감싸주는 다채로운 장갑.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '022'}">
			<div style="font-size: 20px; color: black;"><b>코트 ＆ 재킷</b></div><br/>
			<div style="font-size: 15px;">우아한 스타일을 위한 필수 아이템으로 이루어진 루이 비통의 여성 코트 ＆ 재킷 컬렉션. 니콜라 제스키에르(Nicolas Ghesquière)와 그의 팀이 가죽, 울 및 현대적인 테<span id="dots"></span><span id="more">크니컬 소재로 디자인한 랩코트, 트렌치코트, 푸퍼 재킷, 파카 등의 클래식한 아이템으로 구성. 모든 계절에 어울리는 매력적인 블레이저, 보머 재킷과 이브닝 재킷 포함.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '023'}">
			<div style="font-size: 20px; color: black;"><b>드레스</b></div><br/>
			<div style="font-size: 15px;">스타일리시한 칵테일 드레스부터 우아한 이브닝 드레스, 스포티한 실루엣, 매혹적인 핏 앤 플레어 실루엣까지 어떠한 자리에나 어울리는 다양한 스타일로 구성된<span id="dots"></span><span id="more">니콜라 제스키에르(Nicolas Ghesquière)의 루이 비통 여성 드레스. 니콜라 제스키에르(Nicolas Ghesquière)가 매 시즌 새롭게 재창작한 시그니처 실루엣, 영감을 받아 완성한 패턴과 프린트 및 재해석한 하우스의 상징적인 디자인 코드를 만나볼 수 있는 컬렉션.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '024'}">
			<div style="font-size: 20px; color: black;"><b>티셔츠 ＆ 블라우스</b></div><br/>
			<div style="font-size: 15px;">루이 비통의 레디 투 웨어 디자인 스튜디오에서 제안하는 스타일리시하고 독창적인 여성 톱 컬렉션. 여성스러운 블라우스, 스포티한 티셔츠, 칼라 셔츠, 활용도 높은<span id="dots"></span><span id="more">롤넥 등의 기본적인 디자인부터 강렬하고 독보적인 스타일까지 당장 착용하고 싶은 욕구를 불러일으키는 감각적인 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '025'}">
			<div style="font-size: 20px; color: black;"><b>니트웨어</b></div><br/>
			<div style="font-size: 15px;">어떠한 계절에도 포근함을 선사해줄 루이 비통의 스타일리시한 여성 니트웨어 컬렉션. 레이어링 하기 좋은 세련된 리브드 가디건부터 저지 소재의 감각적인 탱크<span id="dots"></span><span id="more">톱, 따뜻한 울 소재의 풀오버까지 고급 니트를 제작해온 하우스의 우수한 기술이 엿보이는 다양한 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '026'}">
			<div style="font-size: 20px; color: black;"><b>바지</b></div><br/>
			<div style="font-size: 15px;">오피스 룩과 오프 듀티 룩, 테일러드 팬츠와 스키니 팬츠, 포멀한 이브닝 룩과 집에서 휴식할 때 입는 여유로운 룩 등 어떠한 스타일이나 분위기에도 잘 어울리는 아<span id="dots"></span><span id="more">이템을 폭넓게 선보이는 루이 비통의 여성 팬츠 컬렉션. 가죽, 데님 및 테크니컬 혼방 소재를 아우르는 다양한 소재에 메종을 상징하는 디테일을 담아낸 디자인.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '027'}">
			<div style="font-size: 20px; color: black;"><b>스커트 ＆ 쇼츠</b></div><br/>
			<div style="font-size: 15px;">체형을 한층 돋보이게 하는 디자인을 선보이는 루이 비통의 여성 스커트 ＆ 쇼츠 컬렉션. 캐주얼한 분위기에 어울리는 미니 또는 허벅지 중간 기장의 스포티하면서도<span id="dots"></span><span id="more">우아한 버뮤다 쇼츠. 미니 또는 미디 기장으로 만나볼 수 있는 A라인, 랩, 펜슬 등 다양한 실루엣의 스커트. 정교한 테일러링과 하우스 고유의 시그니처가 특징인 여성스러운 디자인.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '028'}">
			<div style="font-size: 20px; color: black;"><b>스니커즈</b></div><br/>
			<div style="font-size: 15px;">캐주얼한 룩에 스타일리시한 매력을 더해주는 루이 비통의 고급 여성 스니커즈 컬렉션. 많은 사랑을 받는 LV 아치라이트(LV Archlight)부터 아이코닉한 타임 아웃(Time<span id="dots"></span><span id="more">Out), 런 어웨이(Run-Away)까지 다양한 아이템으로 구성. 이탈리아에서 제작되고 하우스의 시그니처를 더해 완성한 하이탑, 로우탑, 스니커 부츠 등의 스타일리시한 디자인이 특징.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '029'}">
			<div style="font-size: 20px; color: black;"><b>뮬 ＆ 슬라이드</b></div><br/>
			<div style="font-size: 15px;">여성스러운 디자인으로 가득한 루이 비통의 여성 뮬 ＆ 슬라이드 컬렉션. 플랫, 플랫폼, 키튼 힐, 스틸레토 힐 등의 어떠한 룩에도 돋보이는 포인트가 되어줄 스타일리시한 아이템으로 구성.</div>
			</c:if>
			<c:if test="${Spart == '030'}">
			<div style="font-size: 20px; color: black;"><b>샌들</b></div><br/>
			<div style="font-size: 15px;">플랫, 웨지, 플랫폼, 스트랩 디자인을 모두 아우르는 루이 비통의 여성 샌들 ＆ 에스파드류 컬렉션. 이브닝 룩에 어울리는 화려한 하이힐부터 여유롭고 세련된 분위<span id="dots"></span><span id="more">기를 선사하는 에스파드류까지 메종을 상징하는 디테일을 더해 이탈리아에서 정교하게 제작한 다채로운 아이템으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '031'}">
			<div style="font-size: 20px; color: black;"><b>부츠 ＆ 부티</b></div><br/>
			<div style="font-size: 15px;">청키한 실루엣부터 날렵한 실루엣까지, 플랫부터 하이힐까지, 첼시(Chelsea)부터 웨스턴(Western)까지, 도시적인 분위기에 어울리는 디자인부터 아프레 스키 디자인<span id="dots"></span><span id="more">까지 폭넓은 스타일을 선보이는 루이 비통의 여성 부츠 ＆ 앵클 부츠 컬렉션. 스타 트레일(Star Trail), 메트로폴리스(Metropolis), LV 보부르(LV Beaubourg) 등의 아이코닉한 부츠뿐만 아니라 매 시즌 새롭게 만나볼 수 있는 모델도 모두 포함된 라인업.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '032'}">
			<div style="font-size: 20px; color: black;"><b>홈슈즈</b></div><br/>
			<div style="font-size: 15px;">고급스러우면서도 휴식에 어울리는 편안함을 선사하기 위해 벨벳처럼 부드럽고 도톰한 소재를 사용하여 이탈리아에서 제작한 루이 비통의 여성 슬리퍼. 여성스러<span id="dots"></span><span id="more">운 파우치가 함께 제공되어 소중한 사람이나 스스로에게 멋진 선물이 되어줄 다양한 시그니처 홈슈즈로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '033'}">
			<div style="font-size: 20px; color: black;"><b>백팩</b></div><br/>
			<div style="font-size: 15px;">도시에서 캠퍼스로 또는 사무실에서 야외로 다양하게 활동하는 남성을 위해 견고하고 세련된 아이템을 선보이는 루이 비통의 남성 백팩 컬렉션. 시그니처 캔버스나<span id="dots"></span><span id="more">고급 가죽 소재로 제작된 스타일리시하고 실용적인 디자인. 디스커버리(Discovery), 크리스토퍼(Christopher), 마이클(Michael) 등의 클래식한 아이템부터 브리프케이스(Briefcase), 소프트 트렁크(Soft Trunk), 스티머(Steamer) 등의 하이브리드 디자인까지 만나볼 수 있는 모든 라이프스타일을 위한 다채로운 라인업.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '034'}">
			<div style="font-size: 20px; color: black;"><b>메신저 백 ＆ 크로스 백</b></div><br/>
			<div style="font-size: 15px;">아이코닉한 캔버스, 고급 가죽 및 스타일리시한 혼합 소재로 제작한 세련된 아이템을 선보이는 루이 비통의 남성 메신저 백 ＆ 크로스 백 컬렉션. 조절형 스트랩으로<span id="dots"></span><span id="more">다양하게 연출할 수 있어 현대적인 라이프스타일에 완벽하게 어울리는 아이템. 다뉴브(Danube), 디스트릭트(District), 알렉스(Alex) 등의 클래식한 디자인부터 트렁크, 소프트 트렁크(Soft Trunk), 아웃도어 백 등의 트렌디한 스타일까지 폭넓게 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '035'}">
			<div style="font-size: 20px; color: black;"><b>비즈니스 백</b></div><br/>
			<div style="font-size: 15px;">하우스의 상징적인 캔버스, 시그니처 가죽 및 희귀한 이그조틱 스킨 소재를 사용하여 세련되고 전문성이 느껴지는 디자인을 선보이는 루이 비통의 남성 비즈니스<span id="dots"></span><span id="more">백 컬렉션. 서류, 전자기기 등의 소지품을 보관할 수 있는 포켓과 수납공간을 구성한 감각적인 디자인. 이카르(Icare), 댄디(Dandy), 안톤(Anton) 등 많은 사랑을 받는 클래식한 라인부터 최근 새롭게 추가된 스티머(Steamer)와 소프트 트렁크 라인까지 폭넓게 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '036'}">
			<div style="font-size: 20px; color: black;"><b>토트 백</b></div><br/>
			<div style="font-size: 15px;">스타일과 기능성을 겸비하여 여행용이나 업무용으로 활용하기 좋은 아이템을 선보이는 루이 비통의 남성 토트 백 컬렉션. 유서 깊은 모노그램(Monogram), 다미에 캔<span id="dots"></span><span id="more">버스 또는 하우스의 시그니처 가죽 소재로 제작된 넉넉한 실루엣에 편안한 상단 핸들을 구성한 디자인. 안톤(Anton)과 삭 플라(Sac Plat) 모델은 스트랩을 활용하여 숄더 백 또는 크로스 바디 백으로도 연출 가능.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '037'}">
			<div style="font-size: 20px; color: black;"><b>스몰 백 ＆ 벨트 백</b></div><br/>
			<div style="font-size: 15px;">벨트 백, 범백, 슬링 백 등 남성을 위한 감각적인 아이템을 선보이는 루이 비통의 남성 스몰 백 ＆ 벨트 백 컬렉션. 컴팩트하면서도 활용도가 높아 실용적이며 휴대가<span id="dots"></span><span id="more">편리한 디자인. 일상 필수품을 안전하게 보관할 수 있는 다양한 아이템. 허리에 두르거나 어깨에 걸칠 수 있으며 가슴을 가로지르도록 착용하여 현대적인 룩도 연출 가능.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '039'}">
			<div style="font-size: 20px; color: black;"><b>장지갑</b></div><br/>
			<div style="font-size: 15px;">전체 지퍼형 지피(Zippy) 라인부터 클래식한 브라짜(Brazza) 실루엣까지 다양한 아이템을 선보이는 루이 비통의 남성 장지갑 ＆ 오거나이저 컬렉션. 모노그램<span id="dots"></span><span id="more">(Monogram) 또는 다미에 캔버스 소재뿐만 아니라 에피(Epi) 가죽과 그 외 고급 가죽 소재로 제작된 클래식한 에디션 및 시즌 에디션. 호리존탈, 버티컬 및 XL 모델로 만나볼 수 있는 다채로운 액세서리.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '040'}">
			<div style="font-size: 20px; color: black;"><b>반지갑</b></div><br/>
			<div style="font-size: 15px;">대부분의 포켓에 쏙 들어갈 만큼 슬림한 실루엣과 컴팩트한 크기가 특징인 루이 비통의 남성 반지갑. 고급스러운 가죽 소재로 제작되거나 매 시즌 새로운 애니메이<span id="dots"></span><span id="more">션을 더한 상징적인 캔버스 소재로 선보여 많은 사랑을 받는 멀티플 (Multiple) 및 슬렌더(Slender) 라인. 포켓 오거나이저, 빌폴드, 코인 및 카드 홀더를 포함하는 폭넓은 컬렉션.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '041'}">
			<div style="font-size: 20px; color: black;"><b>카드 지갑 ＆ 여권 지갑</b></div><br/>
			<div style="font-size: 15px;">남성을 위한 카드 홀더와 패스포트 커버를 다채롭게 선보이는 루이 비통의 고급 가죽 소품 컬렉션. 메종의 상징적인 모노그램(Monogram)과 다미에(Damier) 캔버스 소<span id="dots"></span><span id="more">재뿐만 아니라 시그니처 가죽 소재로도 만나볼 수 있는 다양한 아이템. 신용카드, 여행 서류, 티켓, 영수증 등을 모두 보관할 수 있는 포켓과 슬롯을 갖춘 스마트한 액세서리.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '042'}">
			<div style="font-size: 20px; color: black;"><b>벨트</b></div><br/>
			<div style="font-size: 15px;">실용적일 뿐만 아니라 어떠한 룩에도 스타일리시한 포인트가 되어줄 루이 비통의 남성 벨트 컬렉션. 모던한 감각을 더한 클래식 아이템부터 트렌디한 스타일까지<span id="dots"></span><span id="more">폭넓게 구성. 아이코닉한 모노그램(Monogram) 또는 다미에(Damier) 캔버스, 송아지 가죽 또는 현대적인 테크니컬 소재 등 다양한 소재로 제작되어 대부분 리버서블 디자인으로 만나볼 수 있는 아이템.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '043'}">
			<div style="font-size: 20px; color: black;"><b>모자 ＆ 장갑</b></div><br/>
			<div style="font-size: 15px;">클래식한 실루엣과 현대적인 실루엣에 모두 어울리는 루이 비통의 남성 모자 ＆ 장갑 컬렉션. 모노그램(Monogram), 다미에(Damier), LV 이니셜(LV Initials)과 같은 메종의<span id="dots"></span><span id="more">아이코닉한 시그니처가 특징. 현대적인 분위기를 선사하는 스포티한 캡 모자, 트렌디한 버킷 햇, 니트 소재의 비니 및 부드럽고 따뜻한 소재로 제작된 스타일리시한 장갑으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '044'}">
			<div style="font-size: 20px; color: black;"><b>아우터 ＆ 코트</b></div><br/>
			<div style="font-size: 15px;">어떠한 날씨에도 어울리는 스타일을 폭넓게 선보이는 루이 비통의 남성 아우터 ＆ 코트 컬렉션. 스포티한 파카부터 베이스볼 재킷, 바시티 스타일의 재킷, 윈드브레<span id="dots"></span><span id="more">이커, 블루종 및 세련된 테일러드 코트까지 하우스의 남성복 아티스틱 디렉터 버질 아블로(Virgil Abloh)만의 독창적인 미학이 담긴 다양한 디자인으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '045'}">
			<div style="font-size: 20px; color: black;"><b>블레이저 ＆ 재킷</b></div><br/>
			<div style="font-size: 15px;">전문적인 테일러링을 바탕으로 현대적인 옷장에 필요한 필수 아이템을 선보이는 루이 비통 남성 블레이저 ＆ 재킷 컬렉션. 스타일리시한 데님 소재의 캐주얼한 디자<span id="dots"></span><span id="more">인부터 퓨어 울 또는 테크니컬 혼방 소재의 우아한 스타일까지 아우르는 라인업. 버질 아블로(Virgil Abloh)만의 독창적인 감각으로 재해석한 하우스의 클래식한 시그니처 및 모티프가 특징.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '046'}">
			<div style="font-size: 20px; color: black;"><b>팬츠</b></div><br/>
			<div style="font-size: 15px;">오피스 룩에 어울리는 테일러드 트라우저부터 캐주얼한 데님 진, 치노 또는 카고 팬츠, 편안한 트랙 팬츠와 스웨트 팬츠까지 폭넓은 스타일을 선보이는 루이 비통 남<span id="dots"></span><span id="more">성 팬츠 컬렉션. 엄선된 소재로 정교하게 재단한 현대적인 실루엣과 버질 아블로(Virgil Abloh)의 아이코닉한 시그니처가 조화를 이루는 다양한 아이템.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '047'}">
			<div style="font-size: 20px; color: black;"><b>셔츠</b></div><br/>
			<div style="font-size: 15px;">모든 계절 상황을 위해 다채로운 디자인을 선보이는 루이 비통의 남성 셔츠 컬렉션. 클래식한 비즈니스 스타일부터 캐주얼한 베이스볼 셔츠 또는 하와이안 셔츠까<span id="dots"></span><span id="more">지 면 포플린, 필 쿠페 자카드, 옥스포드(Oxford) 천, 실크 등 엄선된 소재로 제작된 다양한 아이템. 버질 아블로(Virgil Abloh)가 탄생시킨 새롭고 색다른 모노그램(Monogram)으로 꾸준히 재해석해 내는 메종의 모티프가 특징.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '048'}">
			<div style="font-size: 20px; color: black;"><b>니트 ＆ 스웨트 셔츠</b></div><br/>
			<div style="font-size: 15px;">편안하면서도 스타일리시한 디자인을 만나볼 수 있는 루이 비통의 남성 니트웨어 ＆ 스웨트셔츠 컬렉션. 최고급 메리노 울, 캐시미어, 펠파 면 또는 현대적인 혼방 소<span id="dots"></span><span id="more">재로 제작되었으며 자카드, 인따르시아를 비롯한 다양하고 세련된 패턴과 위빙 디테일이 특징. 버질 아블로(Virgil Abloh)만의 감성이 고스란히 담긴 크루넥, 후디, 질레 또는 지퍼형 니트 재킷으로 구성.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '049'}">
			<div style="font-size: 20px; color: black;"><b>캐주얼 상의</b></div><br/>
			<div style="font-size: 15px;">오프 듀티 룩에 한층 세련된 매력을 더해줄 루이 비통의 남성 티셔츠 ＆ 폴로 컬렉션. 고급스러운 촉감을 선사하는 엄선된 소재를 정교하게 재단하고 자수, 인따르시<span id="dots"></span><span id="more">아 모티프, 디지털 프린트 등의 독특한 디테일을 담아낸 디자인. 매 시즌 버질 아블로(Virgil Abloh)만의 그래픽한 패턴과 스타일리시한 감각을 더해 새롭게 선보이는 하우스의 아이코닉한 시그니처가 특징.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '050'}">
			<div style="font-size: 20px; color: black;"><b>스니커즈</b></div><br/>
			<div style="font-size: 15px;">버질 아블로(Virgil Abloh)가 디자인한 LV 트레이너부터 상징적인 런 어웨이(Run Away)까지, 강렬하고 컬러풀한 타투(Tattoo)부터 LV 올리(LV Ollie) 스케이트 슈즈까지, 고<span id="dots"></span><span id="more">급스러운 감각과 세련되고 현대적인 감성이 결합된 스타일을 다양하게 만나볼 수 있는 루이 비통 남성 스니커즈 컬렉션. 하이탑, 로우탑, 스니커 부츠, 슬립온 등 메종의 시그니처를 더해 이탈리아에서 정교하게 제작한 아이템.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '051'}">
			<div style="font-size: 20px; color: black;"><b>로퍼 ＆ 모카신</b></div><br/>
			<div style="font-size: 15px;">세련된 디테일과 전문적인 구조가 돋보이는 루이 비통의 남성 로퍼 ＆ 모카신 컬렉션. 하우스의 뛰어난 슈즈 제작 기술이 엿보이는 핸드 스티칭, 정교한 버클과 액세<span id="dots"></span><span id="more">서리 등 다양한 디테일이 특징. 시대를 초월하는 몬테 카를로(Monte Carlo) 슬립 온부터 글레이즈드 송아지 가죽 소재의 클래식한 메이저(Major) 로퍼까지 남성적이고 우아한 룩에 포인트가 되어줄 다채로운 디자인은 모두 이탈리아에서 제작.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '052'}">
			<div style="font-size: 20px; color: black;"><b>레이스업</b></div><br/>
			<div style="font-size: 15px;">모든 드레스 코드를 위해 다채로운 디자인으로 구성한 루이 비통의 남성 레이스업 ＆ 버클 슈즈 컬렉션. 견고한 브로그뿐만 아니라 활용도 높은 더비 슈즈와<span id="dots"></span><span id="more">고급 가죽 소재로 선보이는 우아한 옥스포드(Oxford) 스타일의 리슐리외까지 모두 포함하는 폭넓은 라인업. 하우스의 시그니처 디테일을 더해 이탈리아의 아뜰리에에서 제작.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '053'}">
			<div style="font-size: 20px; color: black;"><b>부츠</b></div><br/>
			<div style="font-size: 15px;">모던하고 남성적인 옷장에 꼭 필요한 고급스러운 루이 비통의 남성 부츠 컬렉션. 하우스<span id="dots"></span><span id="more">의 상징적인 가죽 소재로 제작된 날렵한 첼시(Chelsea)와 다양한 시그니처 소재로 완성한 현대적인 오베르캄프(Oberkampf) 앵클 부츠. 메종의 엄격한 기준에 맞춰 이탈리아에서 제작되는 다양한 아이템.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '054'}">
			<div style="font-size: 20px; color: black;"><b>샌들</b></div><br/>
			<div style="font-size: 15px;">여름 특유의 여유로운 감성을 담아 날렵하고 스포티한 실루엣을 다양하게 선보이는 루이 비통 남성 샌들 컬렉션. 수영장에서 휴식을 취할 때 착용하기 좋은 뮬, 활동<span id="dots"></span><span id="more">적인 아웃도어 라이프스타일을 위한 샌들, 트렌디한 에스파드류 등 더운 날씨에 어울리는 메종만의 디자인. 루이 비통을 상징하는 독특한 디테일을 더해 이탈리아에서 제작.</span><a onclick="more()" class="w3-button w3-vivid-white" id="myBtn">더보기</a></div>
			</c:if>
			<c:if test="${Spart == '055'}">
			<div style="font-size: 20px; color: black;"><b>트렁크 ＆ 박스</b></div><br/>
			</c:if>
			<c:if test="${Spart == '056'}">
			<div style="font-size: 20px; color: black;"><b>롤링 러기지</b></div><br/>
			</c:if>
			<c:if test="${Spart == '057'}">
			<div style="font-size: 20px; color: black;"><b>소프트 러기지 ＆ 더플 백</b></div><br/>
			</c:if>
			<c:if test="${Spart == '058'}">
			<div style="font-size: 20px; color: black;"><b>트래블 액세서리 ＆ 오거나이저</b></div><br/>
			</c:if>
			<c:if test="${Spart == '059'}">
			<div style="font-size: 20px; color: black;"><b>커넥티드 ＆ 오디오 오브제</b></div><br/>
			</c:if>
			<c:if test="${Spart == '060'}">
			<div style="font-size: 20px; color: black;"><b>폰 케이스 ＆ 홀더</b></div><br/>
			</c:if>
			<c:if test="${Spart == '061'}">
			<div style="font-size: 20px; color: black;"><b>스포츠 아이템</b></div><br/>
			</c:if>
			<c:if test="${Spart == '063'}">
			<div style="font-size: 20px; color: black;"><b>라이프 스타일 ＆ 비비엔 인형</b></div><br/>
			</c:if>
		</div>
	</div>