
    
    // 등록(추가)시킨 옵션 상품 삭제하기
    function remove(idx) {
  	  $("div").remove("#layer"+idx);
  	  onTotal();
  	  /*location.reload();*/
    }
    
    // 상품의 총 금액 (재)계산하기
    function onTotal() {
  	  var total = 0;
  	  for(var i=0; i<idxArray.length; i++) {
  		  if($("#layer"+idxArray[i]).length != 0) {
  		  	total +=  parseInt(document.getElementById("price"+idxArray[i]).value);
  		  	document.getElementById("totalPriceResult").value = total;
  		  }
  	  }
  	  document.getElementById("totalPrice").value = numberWithCommas(total);
    }
    
    // 수량 변경시 처리하는 함수
    function numChange(idx) {
    	var price = document.getElementById("statePrice"+idx).value * document.getElementById("numBox"+idx).value;
    	document.getElementById("imsiPrice"+idx).value = numberWithCommas(price);
    	document.getElementById("price"+idx).value = price;
    	onTotal();
    }
    
    // 장바구니 호출시 수행함수
    function cart() {
    	if(document.getElementById("totalPrice").value==0) {
    		alert("상품을 선택해주세요");
    		return false;
    	}
    	else {
    		var ans = confirm("장바구니에 담으시겠습니까?");
    		if(!ans) {
    			return false;
    		}
    		else {
	    		document.myform.submit();
    		}
    	}
    }
    // 장바구니 호출시 수행함수
    function cart2() {
    	var ans = confirm("로그인 후 이용가능한 서비스입니다.\n로그인창으로 이동 하시겠습니까?");
			if(!ans) {
				return false;
			}
			else {
	   		location.href = "../member/login";
			}
    }
    
    // 천단위마다 콤마를 표시해 주는 함수
    function numberWithCommas(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
    }