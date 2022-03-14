<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/userOrder.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/userOrder.js"></script>
		<script>
			$(function() {
				//포인트 5000미만인 경우 readonly
				var point = "${memberVo.point}";
				if(point<5000){
					document.getElementById("point").readOnly = true;
					$("#point").attr("style","background-color:#D5D5D5");
					$("#point").attr("placeholder","");
				}
			});
			
			//배송지 정보 라디오버튼 선택시
			function bsChange() {
				if($('input:radio[id=oribs]').is(':checked')){
					document.getElementById("name").value = "${memberVo.name}";
					document.getElementById("sample6_postcode").value = "${fn:split(memberVo.address,'/')[0]}";
					document.getElementById("sample6_address").value = "${fn:split(memberVo.address,'/')[1]}";
					document.getElementById("sample6_extraAddress").value = "${fn:split(memberVo.address,'/')[2]}";
					document.getElementById("sample6_detailAddress").value = "${fn:split(memberVo.address,'/')[3]}";
					document.getElementById("getCode1").value = "${fn:split(memberVo.getCode,'-')[0]}";
					document.getElementById("getCode2").value = "${fn:split(memberVo.getCode,'-')[1]}";
					document.getElementById("getCode3").value = "${fn:split(memberVo.getCode,'-')[2]}";
					document.getElementById("email").value = "${memberVo.email}";
				}
				else if($('input:radio[id=newbs]').is(':checked')){
					document.getElementById("name").value = "";
					document.getElementById("sample6_postcode").value = "";
					document.getElementById("sample6_address").value = "";
					document.getElementById("sample6_extraAddress").value = "";
					document.getElementById("sample6_detailAddress").value = "";
					document.getElementById("getCode1").value = "";
					document.getElementById("getCode2").value = "";
					document.getElementById("getCode3").value = "";
					document.getElementById("email").value = "";
				}
			}
			
			//포인트 전액사용버튼 클릭시
			function pointAll() {
				var point = ${memberVo.point};
				var total = document.getElementById("orderTotalPrice1").value;
				
				if(point<5000){
					alert("Point는 5,000원 이상일 때 사용가능합니다.");
					return false;
				}
				else if(point > total){
					alert("Point는 주문금액보다 많을 수 없습니다");
					return false;
				}
				else{
					document.getElementById("point").value = point;
					document.getElementById("tdprice").value = "- "+numberWithCommas(point)+"원";
					var tprice = document.getElementById("tprice").value;
					var tlastprice = tprice - point;
					document.getElementById("tlastprice").value = "= "+numberWithCommas(tlastprice)+"원";
					document.getElementById("lastprice1").value = tlastprice;
				}
			}
			//point input 클릭시
			function pointClick() {
				var point = ${memberVo.point};
				
				if(point<5000){
					alert("Point는 5,000원 이상일 때 사용가능합니다.");
					return false;
				}
			}
			//point input 값이 들어올 경우
			function pointWrite(val) {
				var point = parseInt(val);
				var oriPoint = "${memberVo.point}";
				
				//사용가능 point 숫자인지 chk
				if(point>oriPoint){
					alert("사용가능 최대 Point는 "+numberWithCommas(oriPoint)+"원 입니다.");
					document.getElementById("point").value = "";
					$("#point").focus();
					return false;
				}
				else if(isNaN(point)){
					point = 0;
				}
				
				document.getElementById("tdprice").value = "- "+numberWithCommas(point)+"원";
				var tprice = document.getElementById("tprice").value;
				var tlastprice = tprice - point;
				document.getElementById("tlastprice").value = "= "+numberWithCommas(tlastprice)+"원";
				document.getElementById("lastprice1").value = tlastprice;
		}
</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="row" style="margin:50px 50px;">
		<div class="col-lg-8 text-left w3-margin-right w3-margin-bottom">
			<form name="myform" method="post">
			<h5 class="text-left">주문번호 : ${orderIdx}</h5><hr/><br/>
				<div>
					<div id="tableName">배송 정보</div>
					<div>
						<table class="table table-bordered" style="font-size: 0.95em;">
							<tbody>
								<tr>
									<th id="ttth">배송지 선택</th>
									<td id="tdtd">
										<input type="radio" name="bs" id="oribs" onchange="bsChange()" checked > 회원 정보와 동일 &nbsp;&nbsp;
										<input type="radio" name="bs" id="newbs" onchange="bsChange()"> 새로운 배송지
									</td>
								</tr>
								<tr>
									<th id="ttth">받는사람 <font color="#6799FF">*</font></th>
									<td id="tdtd"><input type="text" name="name" id="name" value="${memberVo.name}" required ></td>
								</tr>
								<tr>
									<th id="ttth">주소 <font color="#6799FF">*</font></th>
									<td id="tdtd">
										<input type="text" id="sample6_postcode" name="sample6_postcode" size="6" value="${fn:split(memberVo.address,'/')[0]}" readonly required >&nbsp;
										<input type="button" class="btn pbtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="font-size: 0.8em;"><br><br>
										<input type="text" id="sample6_address" name="sample6_address" size="50" value="${fn:split(memberVo.address,'/')[1]}" readonly  required >
										<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" size="50" value="${fn:split(memberVo.address,'/')[3]}" readonly ><br><br>
										<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" size="50" value="${fn:split(memberVo.address,'/')[2]}" >
									</td>
								</tr>
								<tr>
									<th id="ttth">휴대전화 <font color="#6799FF">*</font></th>
									<td id="tdtd">
										<input type="text" name="getCode1" id="getCode1" size="3" maxlength="3" value="${fn:split(memberVo.getCode,'-')[0]}">
										-
										<input type="text" name="getCode2" id="getCode2" size="4" maxlength="4" value="${fn:split(memberVo.getCode,'-')[1]}">
										-
										<input type="text" name="getCode3" id="getCode3" size="4" maxlength="4" value="${fn:split(memberVo.getCode,'-')[2]}">
									</td>
								</tr>
								<tr>
									<th id="ttth">이메일 <font color="#6799FF">*</font></th>
									<td id="tdtd">
										<input type="text" name="email" id="email" value="${memberVo.email}" style="width:300px;"><br>
										<span style="font-size: 0.9em;color:#747474;">이메일로 주문 처리 과정을 보내드립니다.<br>
										수신 가능한 이메일 주소를 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<th id="ttth">배송메시지</th>
									<td id="tdtd">
										<!-- <textarea name="message" id="message" style="width:100%;"></textarea> -->
										<select name="message" id="message" class="w3-select">
		                  <option value="">배송 시 요청사항을 선택해주세요</option>
		                  <option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
		                  <option value="부재시 택배함에 넣어주세요">부재시 택배함에 넣어주세요</option>
		                  <option value="부재시 집 앞에 놔주세요">부재시 집 앞에 놔주세요</option>
		                  <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
		                  <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요">파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
		                  <option value="문앞에 놓으시고 초인종을 눌러주세요">문앞에 놓으시고 초인종을 눌러주세요</option>
		                  <option value="문앞에 놓으시고 문을 두드려주세요">문앞에 놓으시고 문을 두드려주세요</option>
		                </select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br><br>
				<div>
					<div id="tableName">할인 정보</div>
					<div>
						<table class="list table-bordered" style="font-size: 0.95em;">
							<tbody>
								<tr>
									<th id="ttth">Point</th>
									<td id="tdtd">
										<input type="text" name="point" id="point" placeholder="사용하실 적립금을 입력해주세요" onclick="pointClick()" onkeyup="pointWrite(this.value)" style="width:250px;text-align: center;">&nbsp;
										<input type="button" onclick="pointAll()" value="전액 사용" class="btn pbtn" style="font-size: 0.8em;"><br>
										<span style="font-size: 0.9em;color:#747474;">(사용 가능 ${memberVo.point}P)&nbsp;&nbsp;
										최소 Point 5,000원 이상일 때 사용 가능합니다.</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<!-- 결제정보 -->
				<div>
					<div id="tableName">결제 예정 금액</div>
					<div>
						<table class="list table-bordered" style="font-size: 0.95em;">
							<tbody>
									<tr>
										<th id="ttth">총 주문 금액</th>
										<th id="ttth">총 할인 금액</th>
										<th id="ttth">총 결제 예정 금액</th>
										<th id="ttth">총 적립 예정 금액</th>
									</tr>
									<c:set var="orderTotalPrice" value="0"/>
									<c:set var="savePoint" value="0"/>
									<c:set var="optionNum" value="0"/>
						  		<c:forEach var="vo" items="${orderVos}">
						  			<c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
										<input class="text-center" type="hidden" value="${vo.totalPrice}"/>
										<input class="text-center" type="hidden" value="${vo.point}"/>
										<input class="text-center" type="hidden" value="${fn:length(optionNames)}"/>
									<c:set var="orderTotalPrice" value="${orderTotalPrice + vo.totalPrice}"/>
									<input type="hidden" id="orderTotalPrice1" value="${orderTotalPrice}"/>
									<c:set var="savePoint" value="${savePoint + vo.point}"/>
									<c:set var="optionNum" value="${optionNum + fn:length(optionNames)}"/>
									</c:forEach>
									<tr>
										<td id="tdtd" style="text-align: center;">
											<input type="text" id="showTprice" class="cal2" value="<fmt:formatNumber value="${orderTotalPrice}" pattern='#,###원'/>" readonly >
											<input type="hidden" id="tprice" class="cal2" value="${orderTotalPrice}" readonly >
										</td>
										<td id="tdtd" style="text-align: center;">
											<input type="text" id="tdprice" class="cal2" value="- 0" readonly >
											<input type="hidden" id="tdprice1" class="cal2">
										</td>
										<td id="tdtd" style="text-align: center;">
											<input type="text" id="tlastprice" class="cal2" value="<fmt:formatNumber value="${orderTotalPrice}" pattern='#,###원'/>" readonly >
											<input type="hidden" id="lastprice1" name="lastprice" value="">
										</td>
										<td id="tdtd" style="text-align: center;">
											<input type="text" id="ppoint" class="cal2" value="<fmt:formatNumber value="${savePoint}" pattern='#,###P'/>" readonly >
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<!-- 결제수단 -->
					<div>
						<div id="tableName">결제 수단</div>
						<div>
							<table class="list table-bordered" style="font-size: 0.95em;">
								<tbody>
									<tr>
	            <th id="ttth">결제수단 선택</th>
	          </tr>
	          <tr>
	            <td id="tttd" style="text-align: center;">
		            <input type="radio" name="payMethod1" id="card" onchange="paymentChange()" checked  >
		            <label for="card">신용/체크카드</label> &nbsp;
		            <input type="radio" name="payMethod1" id="phone" onchange="paymentChange()" >
		            <label for="phone">휴대폰</label> &nbsp;
		            <input type="radio" name="payMethod1" id="mInput" onchange="paymentChange()" >
		            <label for="mInput">무통장입금(가상계좌)</label>
	            </td>
	          </tr>
	          <tr>
	            <td id="tttd" style="height: 120px;">
	              <div id="Card" class="pp">
	                카드선택 &nbsp;&nbsp;&nbsp;
	                <select id="paymentCard" name="paymentCard">
	                  <option value="" selected>선택해주세요.</option>
	                  <option value="신한">신한카드</option>
	                  <option value="비씨">비씨카드</option>
	                  <option value="국민">국민카드</option>
	                  <option value="하나">하나카드</option>
	                  <option value="롯데">롯데카드</option>
	                  <option value="우리">우리카드</option>
	                  <option value="농협">농협카드</option>
	                </select>
	                <p>카드번호 : <input type="text" name="payMethodCard" id="payMethodCard"/></p>
	              </div>
	              <div id="Phone" class="pp" style="display:none;">
	                * 결제금액이 통신사 휴대폰 요금에 청구됩니다.<br>
	                * 월 결제 한도는 최대 50만원입니다.
	                <p>휴대폰 번호 : <input type="text" name="numberPay" id="numberPay"/></p>
	              </div>
	              <div id="Minput" class="pp" style="display:none;">
	                입금은행 &nbsp;&nbsp;&nbsp;
	                <select id="paymentBank" name="paymentBank">
	                  <option value="" selected>선택해주세요.</option>
	                  <option value="기업">기업은행</option>
	                  <option value="신한">신한은행</option>
	                  <option value="국민">국민은행</option>
	                  <option value="하나">하나은행</option>
	                  <option value="우리">우리은행</option>
	                  <option value="농협">농협은행</option>
	                  <option value="카카오">카카오뱅크</option>
	                </select><br>
	                입금자명 &nbsp;&nbsp;&nbsp;
	                <input type="text" id="payMethodBank" name="payMethodBank" style="height: 25px;margin-top: 8px;" placeholder="입금자명을 입력하세요.">
	              </div>
	            </td>
	          </tr>
							</tbody>
						</table>
						<div style="text-align: center;padding-top: 20px;padding-bottom: 10px;">
							<input type="button" value="결제하기" onClick="order()" class="mybtn3"/>
						</div>
					</div>
				</div>
				<input type="hidden" name="orderVos" value="${orderVos}"/>
			  <input type="hidden" name="orderIdx" value="${orderIdx}"/>  <!-- 주문번호 -->
			  <input type="hidden" name="orderTotalPrice" id="orderTotalPrice" value="${orderTotalPrice}"/>
			  <input type="hidden" name="mid" value="${sMid}"/>
			  <input type="hidden" name="getCode"/>
			  <input type="hidden" name="address"/>
			  <input type="hidden" id="savePoint" name="savePoint" value="${savePoint}">
			  <input type="hidden" name="payment" id="payment"/>
			  <input type="hidden" name="payMethod" id="payMethod"/>
			  <input type="hidden" name="optionNum" id="optionNum"/>
			</form>
		</div>	
		<div class="col-lg-3 w3-margin-bottom w3-margin-top inalTot">
			<div class="row">
			<div class="col-lg-6 text-left w3-margin-bottom"><h3>나의 쇼핑 백</h3></div>
			<div class="col-lg-6 text-right w3-margin-bottom"><h4><a href="${ctp}/shop/userBag">쇼핑백으로 돌아가기</a></h4></div>
			</div>
			<br/>
			<div class="row">
				<br/><br/>
				<c:set var="orderTotalPrice" value="0"/>
	  		<c:forEach var="vo" items="${orderVos}"> 
				<div class="col-lg-5"><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="mx-auto d-block" width="150px"/></div>
				<div class="col-lg-6">
					<c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
					<h5 class="text-center">${vo.productName}</h5>
					<h5 class="text-center">￦${vo.totalPrice}</h5>
					<h5 class="text-center">${fn:length(optionNames)}개</h5>
				</div>
				<c:set var="orderTotalPrice" value="${orderTotalPrice + vo.totalPrice}"/>
				</c:forEach>
			</div>
			<br/><hr/>
			<div class="row">
				<div class="col-lg-6 text-left"><h5>합계 :</h5></div>
				<div class="col-lg-6 text-right"><h5><fmt:formatNumber value="${orderTotalPrice}" pattern='#,###원'/></h5></div>
			</div>
			<div class="row">
				<div class="col-lg-6 text-left"><h5>배송 :</h5></div>
				<div class="col-lg-6 text-right"><h5><fmt:formatNumber value="0" pattern='#,###원'/></h5></div>
			</div>
			<div class="row">
				<div class="col-lg-6 text-left"><h5>할인금액 :</h5></div>
				<div class="col-lg-6 text-right"><h5><fmt:formatNumber value="0" pattern='#,###원'/></h5></div>
			</div>
			<div class="row">
				<div class="col-lg-6 text-left"><h4>총액 :</h4></div>
				<div class="col-lg-6 text-right"><h5><fmt:formatNumber value="${orderTotalPrice}" pattern='#,###원'/></h5></div>
			</div>
			<hr/>
		<jsp:include page="/WEB-INF/views/include/userBagModal.jsp"/>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>