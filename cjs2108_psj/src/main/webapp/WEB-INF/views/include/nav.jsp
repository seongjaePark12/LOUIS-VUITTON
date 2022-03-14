<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: block;"><i class="fa fa-angle-up"></i></a>
	<div class="w3-top" style="background-color: white;">
		<div style="background-color: white;">
			<a href="${ctp}/support/simple?what=FAQ" class="w3-left w3-padding-small">&nbsp; <i class="fa fa-question-circle-o" style="font-size:15px; padding-top: 10px; color: black; margin-right: 20px;">도움이 필요 하세요?</i></a>
			<a href="${ctp}/member/position" class="w3-right w3-padding-small">&nbsp; <i class="fa fa-map-marker" style="font-size:20px; padding-top: 10px; color: black; margin-right: 20px;"></i></a>
			<c:if test="${sWishCount == '' || sWishCount == '0'}">
			<a href="${ctp}/mypage/myWish" class="w3-right w3-padding-small" >&nbsp; <i class="fa fa-heart-o" style="font-size:20px; padding-top: 10px; color: black;"></i></a>
			</c:if>
			<c:if test="${sWishCount != '0'}">
			<a href="${ctp}/mypage/myWish" class="w3-right w3-padding-small" >&nbsp; <i class="fa fa-heart-o" style="font-size:20px; padding-top: 10px; color: black;"><span class="w3-right w3-small"><b>${sWishCount}</b></span></i></a>
			</c:if>
			<c:if test="${empty sLevel}"><a href="${ctp}/member/login" class="w3-right w3-padding-small">&nbsp; <i class="fa fa-user" style="font-size:20px; padding-top: 10px; color: black;"></i></a></c:if>
			<c:if test="${sLevel == '1' ||sLevel == '2' ||sLevel == '3' ||sLevel == '4'}"><a href="${ctp}/mypage/myPage" class="w3-right w3-padding-small">&nbsp; <i class="fa fa-user" style="font-size:20px; padding-top: 10px; color: black;"></i></a></c:if>
			<c:if test="${sLevel == '0'}"><a href="${ctp}/admin/admin" class="w3-right w3-padding-small">&nbsp; <i class="fa fa-user-secret" style="font-size:20px; padding-top: 10px; color: black;"></i></a></c:if>
			<c:if test="${sBagCount == ''}">
			<a href="${ctp}/shop/userBag" class="w3-right w3-padding-small" >&nbsp; <i class="fa fa-shopping-bag" style="font-size:20px; padding-top: 10px; color: black;"></i></a>
			</c:if>
			<c:if test="${sBagCount != ''}">
			<a href="${ctp}/shop/userBag" class="w3-right w3-padding-small" >&nbsp; <i class="fa fa-shopping-bag" style="font-size:20px; padding-top: 10px; color: black;"><span class="w3-right w3-small"><b>${sBagCount}</b></span></i></a>
			</c:if>
		</div>
	</div>
	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
			<!-- Navbar Area -->
			<div class="delicious-main-menu">
					<div class="classy-nav-container breakpoint-off">
							<div class="container" style="margin-left: 5px;">
									<!-- Menu -->
									<nav class="classy-navbar d-flex justify-content-between" id="deliciousNav">

											<!-- Logo -->
											<a class="nav-brand" href="${ctp}/member/main" id="lvlolo">LOUIS VUITTON</a>
											
											<!-- 햄버거 -->
											<div class="classy-navbar-toggler">
													<span class="navbarToggler"><span></span><span></span><span></span></span>
											</div>

											<!-- Menu -->
											<div class="classy-menu" style="margin-right: 300px;">
												<!-- Nav Start -->
												<div class="classynav">
													<ul>
														<li><a href="#">WHAT'S NEW</a>
																<div class="megamenu">
																	<ul class="single-mega cn-col-4">
																		<li class="title">for 여성</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=002">2022크루즈 컬렉션</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=003">자카드 데님＆브로더리</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=001">Precious Tiger 컬렉션</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=004">콜로뉴 퍼퓸</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=A&Mpart=01&Spart=002"><img src="${ctp}/images/menu/1메뉴.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">for 남성</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=02&Spart=007">2022 봄-여름 패션쇼</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=02&Spart=006">LV²컬랙션</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=02&Spart=005">콜로뉴 퍼퓸</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=A&Mpart=02&Spart=007"><img src="${ctp}/images/menu/2메뉴.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">GOLD/BLACK전용관</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=03&Spart=008">파인 주얼리</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=A&Mpart=03&Spart=009">한정판매</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=A&Mpart=03&Spart=008"><img src="${ctp}/images/menu/메뉴3.png" width="100%" alt=""></a>
																	</div>
																</div>
															</li>
															<li><a href="#">여성</a>
																<div class="megamenu">
																	<ul class="single-mega cn-col-4">
																		<li class="title">핸드백</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=010">숄더＆크로스백</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=011">토트 백</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=012">체인 백＆클러치</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=013">백백＆벨트백</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=014">이그조틱 레더 백</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=B&Mpart=04&Spart=010"><img src="${ctp}/images/menu/여자메뉴1.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">지갑＆가죽소품</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=015">장지갑</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=016">반지갑</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=018">파우치</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=019">카드 홀더</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=020">벨트</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=021">모자＆장갑</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=B&Mpart=05&Spart=015"><img src="${ctp}/images/menu/여자메뉴2.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">의류</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=022">코드＆재킷</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=023">드레스</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=024">티셔츠＆블라우스</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=025">니트웨어</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=026">바지</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=027">스커트＆쇼츠</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=B&Mpart=06&Spart=022"><img src="${ctp}/images/menu/여자메뉴3.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">슈즈</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=07&Spart=028">스니커즈</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=07&Spart=029">뮬＆슬라이드</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=07&Spart=030">샌들</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=07&Spart=031">부츠＆부티</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=B&Mpart=07&Spart=032">홈슈즈</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=B&Mpart=07&Spart=028"><img src="${ctp}/images/menu/여자메뉴4.png" width="100%" alt=""></a>
																	</div>
																</div>
															</li>
															<li><a href="#">남성</a>
																<div class="megamenu">
																	<ul class="single-mega cn-col-4">
																		<li class="title">가방</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=033">백팩</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=034">메신저＆크로스백</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=035">비즈니스 백</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=036">토트 백</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=08&Spart=037">스몰백＆벨트 백</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShopContent?idx=129"><img src="${ctp}/images/menu/남자메뉴2.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">지갑＆가죽소품</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=09&Spart=039">장지갑</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=09&Spart=040">반지갑</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=09&Spart=041">카드지갑＆여권지갑</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=09&Spart=042">벨트</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=09&Spart=043">모자＆장갑</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=C&Mpart=09&Spart=039"><img src="${ctp}/images/menu/남자메뉴3.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">의류</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=044">아우터＆코트</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=045">블레이저＆재킷</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=046">팬츠</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=047">셔츠</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=048">니트＆스웨트 셔츠</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=049">캐주얼 상의</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=C&Mpart=10&Spart=044"><img src="${ctp}/images/menu/남자메뉴1.png" width="100%" alt=""></a>
																	</div>
																	<ul class="single-mega cn-col-4">
																		<li class="title">슈즈</li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=11&Spart=050">스니커즈</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=11&Spart=051">로퍼＆모카신</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=11&Spart=052">레이스업</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=11&Spart=053">부츠</a></li>
																		<li><a href="${ctp}/shop/userShop?Lpart=C&Mpart=11&Spart=054">샌들</a></li>
																	</ul>
																	<div class="single-mega cn-col-4">
																		<a href="${ctp}/shop/userShop?Lpart=C&Mpart=11&Spart=050"><img src="${ctp}/images/menu/남자메뉴4.png" width="100%" alt=""></a>
																	</div>
																</div>
														</li>										
														<li><a href="#">라이프 스타일</a>
															<div class="megamenu">
																<ul class="single-mega cn-col-4">
																	<li class="title">트래블＆트렁크</li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=12&Spart=055">트렁크＆박스</a></li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=12&Spart=056">롤링 러기지</a></li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=12&Spart=057">소프트 러기지＆더플 백</a></li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=12&Spart=058">트래블 액세서리＆오거나이저</a></li>
																</ul>
																<ul class="single-mega cn-col-4">
																	<li class="title">테크놀로지 아이템</li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=13&Spart=059">커넥티드＆오디오 오브제</a></li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=13&Spart=060">폰 케이스＆홀더</a></li>
																</ul>
																<ul class="single-mega cn-col-4">
																	<li class="title">게임＆콜렉터블</li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=14&Spart=061">스포츠 아이템</a></li>
																	<li><a href="${ctp}/shop/userShop?Lpart=D&Mpart=14&Spart=063">라이프 스타일＆비비엔 인형</a></li>
																</ul>
																<div class="single-mega cn-col-4">
																	<a href="${ctp}/shop/userShopContent?idx=73"><img src="${ctp}/images/menu/메뉴2.png" width="100%" alt=""></a>
																</div>
															</div>
														</li>
														<li><a href="${ctp}/magazin/magazinMain">MAGAZINE</a></li>
													</ul>
												</div>
												<!-- Nav End -->
											</div>
									</nav>
							</div>
					</div>
			</div>
	</header>