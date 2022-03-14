			//천단위 마다 쉼표 하는 함수
			function numberWithCommas(x) {
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			//결제수단 라디오버튼 클릭시
			function paymentChange() {
			  if($('input:radio[id=card]').is(':checked')){
			    $("#Card").show();
			    $("#Phone").hide();
			    $("#Minput").hide();
			  }
			  else if($('input:radio[id=phone]').is(':checked')){
			    $("#Phone").show();
			    $("#Card").hide();
			    $("#Minput").hide();
			  }
			  else if($('input:radio[id=mInput]').is(':checked')){
			    $("#Minput").show();
			    $("#Phone").hide();
			    $("#Card").hide();
			  }
			}
			function sample6_execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            var addr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                addr = data.roadAddress;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                addr = data.jibunAddress;
			            }
			            if(data.userSelectedType === 'R'){
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraAddr += data.bname;
			                }
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                if(extraAddr !== ''){
			                    extraAddr = ' (' + extraAddr + ')';
			                }
			                document.getElementById("sample6_extraAddress").value = extraAddr;
			            
			            } else {
			                document.getElementById("sample6_extraAddress").value = '';
			            }
			            document.getElementById('sample6_postcode').value = data.zonecode;
			            document.getElementById("sample6_address").value = addr;
			            document.getElementById("sample6_detailAddress").focus();
			        }
			    }).open();
			 }
			//결제하기 버튼 클릭시
			function order() {
				var name = myform.name.value;
				var address1 = myform.sample6_postcode.value;
				var address2 = myform.sample6_address.value;
				var address3 = myform.sample6_extraAddress.value;
				var address4 = myform.sample6_detailAddress.value;
				var address = address1+"/"+address2+"/"+address3+"/"+address4;
				if(address == "///") address ="";
				var getCode1 = myform.getCode1.value;
				var getCode2 = myform.getCode2.value;
				var getCode3 = myform.getCode3.value;
				var getCode = getCode1+"-"+getCode2+"-"+getCode3;
				var email = myform.email.value;
				var point = myform.point.value;
				var regExpTel = /^[0-9|_]*$/;  // 숫자만
				var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; // 이메일 체크
				
			  var paymentCard = document.getElementById("paymentCard").value;
	    	var payMethodCard = document.getElementById("payMethodCard").value;
			  var paymentBank = document.getElementById("paymentBank").value;
	    	var payMethodBank = document.getElementById("payMethodBank").value;
	    	var numberPay = document.getElementById("numberPay").value;
			    	
				if(name==""){
					alert("받는 사람을 입력하세요.");
					myform.name.focus();
					return false;
				}
				else if(address==""){
					alert("주소를 입력하세요.");
					myform.sample6_postcode.focus();
					return false;
				}
				else if(getCode1=="" || !regExpTel.test(getCode1)){
					alert("휴대전화를 입력하세요.");
					myform.getCode1.focus();
					return false;
				}
				else if(getCode2=="" || !regExpTel.test(getCode2)){
					alert("휴대전화를 입력하세요.");
					myform.getCode2.focus();
					return false;
				}
				else if(getCode3=="" || !regExpTel.test(getCode3)){
					alert("휴대전화를 입력하세요.");
					myform.getCode3.focus();
					return false;
				}
				else if(email=="" || !regExpEmail.test(email)){
					alert("이메일을 입력하세요.");
					myform.email.focus();
					return false;
				}
				else if(paymentCard != "" && payMethodCard == "") {
	    		alert("카드번호를 입력하세요.");
	    		document.getElementById("payMethodCard").focus();
	    		return false;
	    	}
	    	else if(paymentBank != "" && payMethodBank == "") {
	    		alert("입금자명을 입력하세요.");
	    		document.getElementById("paymentBank").focus();
	    		return false;
	    	}
	    	else if(numberPay == "" && paymentCard == "" && payMethodCard == "" && paymentBank == "" && payMethodBank == ""){
	    		alert("결제 방식을 입력해주세요.");
	    		return false;
	    	}
	    	var ans = confirm("결재하시겠습니까?");
	    	if (!ans){
		  		return false;
		  	}
	    	if(ans) {
	    		if(paymentCard != "" && payMethodCard != "") {
	    			document.getElementById("payment").value = "C"+paymentCard;
	    			document.getElementById("payMethod").value = payMethodCard;
	    		}
	    		else if(paymentBank != "" && payMethodBank != ""){
	    			document.getElementById("payment").value = "B"+paymentBank;
	    			document.getElementById("payMethod").value = payMethodBank;
	    		}
	    		else{
	    			document.getElementById("payment").value = "P휴대폰결제";
	    			document.getElementById("payMethod").value = numberPay;
	    		}
	    	}
				myform.address.value = address;
				myform.getCode.value = getCode;
				myform.email.value = email;
				if(point=="" || point == '0' || point==null){
					myform.point.value = 0;
				}
				var point = myform.point.value;
				pointWrite(point);
				myform.action = "../shop/orderInput";
				myform.submit();
			}