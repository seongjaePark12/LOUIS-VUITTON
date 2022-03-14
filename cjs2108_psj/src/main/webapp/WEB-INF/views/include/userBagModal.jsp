<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
			<div>
			  <button onclick="document.getElementById('id01').style.display='block'" class="mybtn"><h5>결제 안내</h5></button>
			  <div id="id01" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id01').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>결제 안내</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>고객님의 편의한 결제를 진행하기 위하여 카카오페이,신용카드와 직불카드 등 각종 카드를 통한 결제 및 실시간 계좌이체를 통한 결제방법을 제공하고 있습니다.</h5><br/>
			        <h5>고객님의 개인정보의 보호와 구매의 안전을 위해 신뢰할 수 있는 결제 대행사인 NHN KCP를 통하여 상품 결제를 제공하고 있습니다. 루이 비통 공식 온라인 스토어에서는 NHN KCP 가맹점 결제 이용시 1만원이상 및 5만원이상 결제시 무이자 할부 서비스 혜택을 제공하고 있사오니, 관련 문의사항은 루이 비통 클라이언트 서비스(02 3432 1854)로 자세한 내용을 확인부탁드립니다.</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>
			<div>
			  <button onclick="document.getElementById('id02').style.display='block'" class="mybtn"><h5>배송 안내</h5></button>
			  <div id="id02" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id02').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>배송 안내</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>배송 안내 배송 연휴일을 제외한 모든 배송 서비스는 주문 및 결제 완료 후 상품 보유 상황에 따라 최소 1-2일 내 발송됩니다. 배송 완료까지 발송일 기준으로 2-3일의 영업일이 소요될 수 있습니다.(단, 택배사 사정에 따라 발송일 및 배송 완료일의 차이가 있을 수 있습니다. 주말, 공휴일 제외) 배송 완료까지 발송일 기준으로 2-3일의 영업일이 소요됩니다.<br/> (주말, 공휴일 제외) 여름철 장마로 인해 비가 집중되는 일부 지역에서 택배 배송이 지연될 수 있는 점 미리 양해 부탁드립니다.택배사 또는 고객님의 사정(연락이 되지 않을 경우)으로 배송이 지연되는 경우에는 온라인 이메일 및 카카오 채팅 문의를 이용해주시기 바랍니다.클라이언트 서비스(02 3432 1854)로 연락해주시면 배송 진행 상황을 확인하실 수 있습니다. 개인 맞춤 제품 및 예약 제품 의 경우 제품에 따라 배송이 지연될 수 있습니다.
개인 맞춤 제품의 경우, 핸드백 및 가죽 소품은 최대 8주까지 배송이 지연될 수 있으며, 롤링 러기지는 최대 12주까지 지연될 수 있는 점 양해 부탁드립니다.예약 제품의 경우 주문하신 제품에 따라 해당 제품의 공급 기간을 포함한 예상 배송 기간이 약 2주에서 3달까지 지연될 수 있습니다. 이와 같이 예약 기능이 가능한 제품은 그 제품의 수명 주기가 만료되면 주문이 취소될 수 있습니다.</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>
			<div>
			  <button onclick="document.getElementById('id03').style.display='block'" class="mybtn"><h5>품질보증기준</h5></button>
			  <div id="id03" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id03').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>품질보증기준</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>구매일로부터 1년이내의 제품 이상인 경우, 보상은 무상 수선을 우선으로 하며, 수선 불가능시에는 교환과 환불을 순차적으로 적용, 진행될 수 있습니다. 사용상의 제품 손상이 발생한 경우, 품질보증기간에 상관없이 유상수선이 진행됩니다.<br/> 시즌 상품(의류, 신발, 잡화 중 컬렉션 제품)의 경우, 구매시즌으로부터 3시즌까지 부속품이 제공되며, 사용감에 따라 발생되는 수선은 품질보증기간에 상관없이 유상수선으로 진행됩니다.</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>
			<div>
			  <button onclick="document.getElementById('id04').style.display='block'" class="mybtn"><h5>교환 및 환불 정책</h5></button>
			  <div id="id04" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id04').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>교환 및 환불 정책</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>만족하지 못한 상품에 대하여 상품을 공급받은 날로부터 7일 이내에 반품 또는 14일 이내에 교환이 가능합니다.
									루이 비통 매장에서는 온라인 스토어에서 구매한 제품의 교환 및 반품이 불가합니다. 온라인 스토어 구매 제품의 교환 및 반품을 희망하실 경우 루이 비통 클라이언트 서비스로 연락 주십시오.</h5>
			        <h5>다음 각 경우에는 법령에 따라 반품 또는 교환이 불가합니다:</h5>
			        <br/>
			        <h5>1. 귀하의 책임있는 사유로 상품이 멸실 또는 훼손된 경우(상품의 내용을 확인하기 위하여 포장을 훼손한 경우 제외)</h5>
			        <h5>2. 귀하의 사용으로 인하여 상품의 가치가 현저히 감소한 경우 3. 이용약관에 따른 주문제작형 (핫 스탬핑 및 이니셜 각인 제품 포함) 상품인 경우</h5>
			        <br/>
			        <h5>배송된 상품이 표시 및 광고된 내용과 다르거나, 계약내용과 다르게 이행된 때에는 그 상품을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 1개월(30일) 이내에, 귀하의 요청에 따라 이를 환불 또는 교환할 수 있습니다.</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>
			<div>
			  <button onclick="document.getElementById('id05').style.display='block'" class="mybtn"><h5>매장 픽업</h5></button>
			  <div id="id05" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id05').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>매장 픽업</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>매장 픽업 서비스 절차: 온라인 주문 -> 제품 매장 도착 후 문자/이메일 수신 -> 문자 및 신분증 지참하여 매장 방문. 매장 픽업 오더 제품의 교환, 환불은 온라인 스토어 또는 클라이언트 서비스(02 3432 1854)를 통해서만 가능합니다. 제품 픽업은 30일간 유효하며, 기간 내 픽업되지 않은 제품의 주문은 철회되고 결제하신 수단으로 환불 절차가 진행될 수 있습니다.</h5>
			        <h5>(단, 개인 맞춤 서비스를 적용한 제품의 경우 제외)</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>
			
			<div>
			  <button onclick="document.getElementById('id06').style.display='block'" class="mybtn"><h5>선물 포장</h5></button>
			  <div id="id06" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id06').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>선물 포장</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>루이 비통 공식 온라인 스토어의 선물 포장 서비스 혜택을 무료로 제공 받으세요. 모든 루이 비통 공식 온라인 스토어에서 주문하신 제품은 선물 상자에 담아 배송됩니다.</h5><br/>
			        <h5>패커(Packer)로 시작한 메종의 기원을 반영한 "임페리얼 사프란(Imperial Saffron)"색상의 루이 비통 메종 패키지로 배송됩니다.루이 비통의 시각적 상징(visual signature)으로 거듭날 매력적인 색상은 160년이 넘는 세월 동안 루이 비통의 역사 속에서 함께 해왔습니다. 파란색 리본은 1854년 루이 비통 창립 이래 초창기 맞춤제작 제품 디테일에 사용되었을 뿐 아니라 메종의 리본에 수십년간 쓰여진 색채로, 두 빛깔의 조화는 매우 현대적이면서도 동시에 마치 여행의 황금기를 연상시키는 클래식한 느낌도 전합니다. 평면 도형의 상자는 지속 가능한 환경 보호를 위해 설립된 FSC기관의 인증을 통해 40%의 재활용 섬유로 제작되었으며 이는 탄소 배출량 또한 줄이는 등 지속 가능한 환경의 보존 및 발전에 관심을 기울이고 있음을 엿볼 수 있습니다.</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>
			<div>
			  <button onclick="document.getElementById('id07').style.display='block'" class="mybtn"><h5>클라이언트 서비스 및 A/S</h5></button>
			  <div id="id07" class="w3-modal">
			    <div class="w3-modal-content w3-animate-zoom">
			    <div class="w3-container">
			      <header class="w3-containerl"> 
			        <span onclick="document.getElementById('id07').style.display='none'" 
			        class="w3-button w3-display-topright">&times;</span>
			        <h3><b>클라이언트 서비스 및 A/S</b></h3>
			      </header>
			      <hr/>
			      <div class="w3-container">
			        <h5>문의: 02-xxxx-xxxx운영 시간: 월요일 - 일요일: 오전 9시 30분 -오후 7시 30분</h5>
			      </div>
			    </div>
			    </div>
			  </div>
			</div>
			<hr/>