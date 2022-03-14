<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 계정 수정</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var nickCheckOn = 0;
		function sample6_execDaumPostcode() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	              var addr = ''; // 주소 변수
	              var extraAddr = ''; // 참고항목 변수
	
	              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                  addr = data.roadAddress;
	              } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                  addr = data.jibunAddress;
	              }
	
	              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	              if(data.userSelectedType === 'R'){
	                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                      extraAddr += data.bname;
	                  }
	                  // 건물명이 있고, 공동주택일 경우 추가한다.
	                  if(data.buildingName !== '' && data.apartment === 'Y'){
	                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                  }
	                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                  if(extraAddr !== ''){
	                      extraAddr = ' (' + extraAddr + ')';
	                  }
	                  // 조합된 참고항목을 해당 필드에 넣는다.
	                  document.getElementById("sample6_extraAddress").value = extraAddr;
	              
	              } else {
	                  document.getElementById("sample6_extraAddress").value = '';
	              }
	
	              // 우편번호와 주소 정보를 해당 필드에 넣는다.
	              document.getElementById('sample6_postcode').value = data.zonecode;
	              document.getElementById("sample6_address").value = addr;
	              // 커서를 상세주소 필드로 이동한다.
	              document.getElementById("sample6_detailAddress").focus();
	          }
	      }).open();
	   }
		// 이메일 중복체크
		function emailCheck() {
			var invaidEmail =/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
			var email = $("#email").val();
			if(email == '${sEmail}'){
				alert("이메일을 수정안함");
				nickCheckOn = 1;
				return false;
			}
			if(email=="" || !invaidEmail.test(email)) {
				alert("이메일을 체크하세요");
				myform.email.focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url  : "../member/emailCheck",
				data : {email : email},
				success:function(data) {
					if(data == "1") {
						alert("이미 사용중인 이메일 입니다.");
						$("#email").focus();
					}
					else {
						alert("사용 가능한 이메일 입니다.");
						nickCheckOn = 1;	// 이메일 검색버튼을 클릭한경우는 nickCheckOn값이 1이 된다.
					}
				},
				error : function() {
					alert("전송오류!");
				}
			});
		}
			function emailReset() {
				nickCheckOn = 0;
			}

			// 회원가입폼 체크
		function joinCheck() {
			var mid = myform.mid.value;
			var pwd = myform.pwd.value;
			var name = myform.name.value;
			var birth = myform.birth.value;
			var email = myform.email.value;
			var getCode =  myform.getCode1.value +"-"+ myform.getCode2.value + "-" + myform.getCode3.value;
			
		  	var idPattern = /[A-Za-z0-9]$/g;
		  	var invaidName = /[a-zA-Z]/g;
		  	var regExp = /^[가-힣a-zA-Z]+$/;
		  	var invaidEmail =/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		  	var invaidNum = /(\d{3}).*(\d{3}).*(\d{4})/;
		
			if(pwd == mid){
				alert("아이디와 비밀번호는 같을 수 없습니다.");
				myform.pwd.value = "";
				myform.pwdTest.value = "";
				myform.pwd.focus();
			}else if(pwd == "") {
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			}else if(pwd.length < 6 || pwd.length > 16){
					alert("비밀번호는 6~16자까지 입력가능합니다");
					myform.pwd.value = "";
			}else if(name == "") {
				alert("성명을 입력하세요");
				myform.name.focus();
			}else if(!regExp.test(name)){
		      alert("이름은 한글/영어로만 구성되어야 합니다.");
		   		myform.name.value = "";
						myform.name.focus();
			}else if(email == "") {
				alert("이메일을 입력하세요");
				myform.email.focus();
			}else if(!invaidEmail.test(email)) {
					alert("이메일은 영문 숫자조합만 가능합니다");
					myform.email.value= "";
					myform.email.focus();
			}else if (getCode == ""){
				alert("전화번호를 입력하세요");
				myform.getCode1.focus();
			}else if (!invaidNum.test(getCode)) {
			    	alert("전화번호는 숫자로만 입력해주세요");
			    	myform.getCode1.value = "";
			    	myform.getCode1.focus();
			}
			else {
					if(nickCheckOn == 1) {
					var sample6_postcode = myform.sample6_postcode.value;
					var sample6_address = myform.sample6_address.value;
					var sample6_detailAddress = myform.sample6_detailAddress.value;
					var sample6_extraAddress = myform.sample6_extraAddress.value;
					address = sample6_postcode + "/" + sample6_address + "/" + sample6_extraAddress + "/" + sample6_detailAddress
					if(address == "///") address ="";
					myform.address.value = address;
					myform.getCode.value = getCode;
					myform.submit();
				}
				else {
					if(nickCheckOn == 0) {
						alert("이메일, 중복체크버튼을 눌러주세요!");
					}
				}
			}
		}
	</script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/myUpdate.css">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item"><img src="${ctp}/images/user/마이페이지 로고.png" width="100%"/></a>
				<a href="${ctp}/mypage/myBooking" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left ">나의 방문 예약</a>
		<a href="${ctp}/mypage/myQuestion" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myWish" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 위시리스트</a>
		<a href="${ctp}/mypage/myOrder" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/mypage/myInfor" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">나의계정</a>
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">My LV에 오신 것을 환영합니다</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/mypage/myPage" class="w3-bar-item w3-button w3-border-bottom">My LV에 오신 것을 환영합니다</a>
		<a href="${ctp}/mypage/myInfor" class="w3-bar-item w3-button w3-border-bottom">나의계정</a>
		<a href="${ctp}/mypage/myOrder" class="w3-bar-item w3-button w3-border-bottom">나의 주문제품</a>
		<a href="${ctp}/mypage/myWish" class="w3-bar-item w3-button w3-border-bottom">나의 위시리스트</a>
		<a href="${ctp}/mypage/myQuestion" class="w3-bar-item w3-button">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myBooking" class="w3-bar-item w3-button">나의 방문 예약</a>
	</div>
	<div id="mmm">
		<div class="container" id="container">
    <div class="bg-white" style=" text-align: center; width: 100%">
			<form name="myform"  style="display: inline-block; border: none;" method="post" class="was-validated bg-white" >
	      <br><br>
	      <h1 class="font-weight-bold" ><span id="jojo">회원 정보 수정</span></h1><br/>
	      <br/>
	        <div>
	          <label for="mid"><b>아이디</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="text" class="form-control" name="mid" id="mid" value="${sMid}" readonly />
	        </div>
	        <br/>
	        <div>
	          <label for="pwd"><b>비밀번호</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="password" class="form-control" name="pwd" id="pwd" value="${sPwd}" placeholder="비밀번호를 입력해주세요" min="4" maxlength="20" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">비밀번호는 영문, 숫자, 특수문자를 포함하여 6 ~ 20자로 작성해주세요</div>
	        </div>
	       	<br/>
	        <div>
	          <label for="name"><b>이름</b><font size="2px" color="#AF4034"> *</font></label>
	        </div>   
	        <div>
	          <input type="text" class="form-control" name="name" id="name" value="${vo.name}" placeholder="이름을 입력해주세요" min="1" maxlength="20" required />
	        </div>
	        <br/>
	        <div>
            <label for="birth"><b>생년월일</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	          <input type="date" name="birth" id="birth" value="${vo.birth.substring(0, 10)}" class="form-control"/>
	        </div>
	        <br/>
	         <div>
	          <label for="email"><b>이메일</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="text" class="form-control" name="email" id="email" value="${vo.email}" onkeyup="emailReset()" placeholder="예) name@example.com" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">이메일은 비밀번호 찾기에 사용됩니다</div>
	        </div>
	        <div class="text-left" style="padding-top: 3px; padding-right: 3px;">
	          <input type="button" class="bubu" name="btnIdCheck" value="중복체크" onclick="emailCheck()" />
	        </div>
	        <br/>
	        <div>
	          <label for="getCode"><b>휴대 전화</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div class="input-group mb-3">
	          <input class="form-control" type="text" name="getCode1" id="getCode1" value="${fn:split(vo.getCode,'-')[0]}" required  min="2" maxlength="3" />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode2" id="getCode2" value="${fn:split(vo.getCode,'-')[1]}" required  min="2" maxlength="4" />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode3" id="getCode3" value="${fn:split(vo.getCode,'-')[2]}" required  min="3" maxlength="4" />
	        </div>
	        <br/>
	        <div>
	          <label for="address"><b>주소</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	        	<input type="hidden" class="form-control" name="address"/>
	          <input type="text" name="sample6_postcode" id="sample6_postcode" value="${fn:split(vo.address,'/')[0]}" placeholder="우편번호" readonly />
	          <input type="button" class="bubu" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
	          <br/>
	        </div>
	        <div> 
	          <input type="text" name="sample6_address" id="sample6_address" value="${fn:split(vo.address,'/')[1]}" placeholder="도로명주소" readonly />
	          <input type="text"  name="sample6_extraAddress" id="sample6_extraAddress" value="${fn:split(vo.address,'/')[2]}" placeholder="참고항목" readonly>
	        </div>   
	        <div>
	        <input type="text" name ="sample6_detailAddress" id="sample6_detailAddress" value="${fn:split(vo.address,'/')[3]}" placeholder="상세주소" />
	        </div>
	        <br/>
	        <div>
	          <label for="infoopen"><b>이메일 수신</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="radio" name="emailInfor" value="Y" <c:if test="${fn:contains(vo.emailInfor,'Y')}">checked</c:if>>수신
	          <input type="radio" name="emailInfor" value="N" <c:if test="${fn:contains(vo.emailInfor,'N')}">checked</c:if>>비수신 <br/><br/>
	        </div>
	        <br/>
	        <div>
	          <input style="text-align:center;" type="button" id="joinbtn" value="수정하기" onclick="joinCheck()">
	        </div>
	        <br/>
	        <div>
	          <a href="${ctp}/member/main"><input type="button" value="메인화면"></a>
	        </div>
 					<input type="hidden" name="getCode"/>
			</form>
    </div> 
  </div> 
 </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>