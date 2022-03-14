     function onTotal(){
        var total = 0;
        var maxIdx = document.getElementById("maxIdx").value;
        for(var i=1;i<=maxIdx;i++){
          if($("#totalPrice"+i).length != 0 && document.getElementById("idx"+i).checked){  
            total = total + parseInt(document.getElementById("totalPrice"+i).value); 
          }
        }
        document.getElementById("total").value=numberWithCommas(total);
        
        if(total>=50000||total==0){
          document.getElementById("baesong").value=0;
        } else {
          document.getElementById("baesong").value=2500;
        }
        var lastPrice=parseInt(document.getElementById("baesong").value)+total;
        document.getElementById("lastPrice").value = numberWithCommas(lastPrice);  // 화면에 보여주는 주문 총금액
        document.getElementById("orderTotalPrice").value = numberWithCommas(lastPrice);  // 값을 넘겨주는 '주문 총 금액 필드'
      }
      
    function onCheck(){
      var maxIdx = document.getElementById("maxIdx").value;

      var cnt=0;
      for(var i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked==false){
          cnt++;
          break;
        }
      }
      if(cnt!=0){
        document.getElementById("allcheck").checked=false;
      } 
      else {
        document.getElementById("allcheck").checked=true;
      }
      onTotal();
    }
    
    function allCheck(){
      var maxIdx = document.getElementById("maxIdx").value;
      if(document.getElementById("allcheck").checked){
        for(var i=1;i<=maxIdx;i++){
          if($("#idx"+i).length != 0){
            document.getElementById("idx"+i).checked=true;
          }
        }
      }
      else {
        for(var i=1;i<=maxIdx;i++){
          if($("#idx"+i).length != 0){
            document.getElementById("idx"+i).checked=false;
          }
        }
      }
      onTotal();
    }
    
    // cart에 들어있는 품목 삭제하기
    function cartDel(idx){
      var ans = confirm("선택하신 현재상품을 장바구니에서 삭제하시겠습니까?");
      if(!ans) return false;
      
      $.ajax({
        type : "post",
        url  : "../shop/shopCartDel",
        data : {idx : idx},
        success:function() {
          location.reload();
        },
        error : function() {
        	alert("전송에러!");
        }
      });
    }
    
    function order(){
      //구매하기위해 체크한 장바구니에만 아이디가 check인 필드의 값을 1로 셋팅. 체크하지 않은것은 check아이디필드의 기본값은 0이다.
      var maxIdx = document.getElementById("maxIdx").value;
      for(var i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked){
          document.getElementById("checkItem"+i).value="1";
        }
      }
      
      if(document.getElementById("lastPrice").value==0){
        alert("장바구니에서 상품을 선택해주세요!");
        return false;
      } 
      else {
        document.myform.submit();
      }
    }
    
    // 천단위마다 쉼표 표시하는 함수
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }