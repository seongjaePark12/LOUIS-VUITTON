  	var idCheckOn = 0;
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
  		// 아이디 중복체크(aJax처리)
    function idCheck() {
    	var mid = $("#mid").val();
    	if(mid=="" || $("#mid").val().length<4 || $("#mid").val().length>20) {
    		alert("아이디를 체크하세요!(아이디는 4~20자 이내로 사용하세요.)");
    		myform.mid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "../member/idCheck",
    		data : {mid : mid},
    		success:function(data) {
    			if(data == "1") {
    				alert("이미 사용중인 아이디 입니다.");
    				$("#mid").focus();
    			}
    			else {
    				alert("사용 가능한 아이디 입니다.");
    				idCheckOn = 1;	// 아이디 검색버튼을 클릭한경우는 idCheckOn값이 1이 된다.
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
  	// 이메일 중복체크
    function emailCheck() {
    	var invaidEmail =/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
    	var email = $("#email").val();
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
  	
  	function idReset() {
  		idCheckOn = 0;
  	}
  	
  	function emailReset() {
  		nickCheckOn = 0;
  	}
    
  	// 회원가입폼 체크
    function joinCheck() {
    	var mid = myform.mid.value;
    	var pwd = myform.pwd.value;
    	var pwdTest = myform.pwdTest.value;
    	var name = myform.name.value;
    	var birth = myform.birth.value;
    	var email = myform.email.value;
    	var getCode =  myform.getCode1.value +"-"+ myform.getCode2.value + "-" + myform.getCode3.value;
    	
	  	var idPattern = /[A-Za-z0-9]$/g;
	  	var invaidName = /[a-zA-Z]/g;
	  	var regExp = /^[가-힣a-zA-Z]+$/;
	  	var invaidEmail =/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	  	var invaidNum = /(\d{3}).*(\d{3}).*(\d{4})/;

    	if(mid == "") {
    		alert("아이디를 입력하세요");
    		myform.mid.focus();
    	}else	if(mid.length < 4 || mid.length > 16){
    		alert("아이디는 4~16자리까지 입력가능합니다");
    		myform.mid.focus();
    	}else if(!idPattern.test(mid)){
   			alert("아이디는 영어와 숫자만 입력가능합니다");
   			myform.mid.value = "";
   			myform.mid.focus();
    	}else if(pwd == mid){
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
   		}else if(pwdTest == ""){
    		myform.pwdTest.focus();
   		}else if(pwd != pwdTest) {
    		alert("비밀번호가 서로 다릅니다");
    		myform.pwd.value = "";
    		myform.pwdTest.value = "";
    		myform.pwd.focus();
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
				if(idCheckOn == 1 && nickCheckOn == 1) {
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
    			if(idCheckOn == 0) {
    				alert("아이디 중복체크버튼을 눌러주세요!");
    			}
    			else {
    				alert("이메일, 중복체크버튼을 눌러주세요!");
    			}
    		}
    	}
    }