 		   	// 개별재품검색
  	function midSearch() {
			var productName = myform.productName.value;
			if(productName == ""){
				alert("상품명 입력하세요");
				myform.productName.focus();
			}else{
				location.href="../product/productList?productName="+productName;
			}
		}
  	
		// 전체선택
		$(function(){
			$("#checkAll").click(function(){
				if($("#checkAll").prop("checked")){
					$(".chk").prop("checked", true);
				}
				else{
					$(".chk").prop("checked", false);
				}
			});
		});
		// 선택항목 상품 삭제하기(ajax)
		function selectDelCheck(){
			var ans = confirm("선택된 상품을 삭제 하시겠습니까?");
			if(!ans) return false;
			var delItems = "";
			
			for(var i=0; i<myform.chk.length; i++){
				if(myform.chk[i].checked == true) delItems += myform.chk[i].value + "/";
			}
			
			$.ajax({
				type : "post",
				url : "../product/productListDel",
				data:{delItems:delItems},
				success:function(){
					alert("삭제되었습니다");
					location.reload();
				},
				error:function(){
					alert("상품의 옵션을 먼저 삭제해주세요");
				}
			});			
		}
 		//판매금액 입력시 자동으로 적립금 계산(0.01%)하여 나타내기
		function pointCalc(val) {
			var mainPrice = parseInt(val);
			var point = mainPrice*(1/100);
			var pointval = myform.point.value;
			var disPrice = myform.disPrice.value;
			var pointhand = document.getElementById("pointhand").checked;
			
			if(disPrice != ""){
				point = parseInt(disPrice)*(1/100);
			}
			
			if(val == "" || pointhand == true){
				if(pointval != ""){
					document.getElementById("point").value = parseInt(pointval);
					document.getElementById("point").readOnly = false;
				}
				else{
					document.getElementById("point").value = "";
					document.getElementById("point").readOnly = false;
				}
			}
			else{
				document.getElementById("point").value = parseInt(point);
				document.getElementById("point").readOnly = true;
			}
		}

 		//적립금 직접입력 체크시
		function pointchk() {
			var mainPrice = parseInt(myform.mainPrice.value);
			var point = mainPrice*(1/100);
			var disPrice = myform.disPrice.value;
			var pointhand = document.getElementById("pointhand").checked;
			
			if(disPrice != ""){
				point = parseInt(disPrice)*(1/100);
			}
			
			if(pointhand == true || myform.mainPrice.value == ""){
				document.getElementById("point").value = "";
				document.getElementById("point").readOnly = false;
			}
			else{
				document.getElementById("point").value = parseInt(point);
				document.getElementById("point").readOnly = true;
			}
		}
	
 		//할인가격 라디오버튼 선택시
		function inputhalin(val) {
			var mainPrice = parseInt(myform.mainPrice.value);
			var halin = val;
			var disPrice = "";
			var pointhand = document.getElementById("pointhand").checked;
			
			if(halin == "없음"){
				document.getElementById("disPrice").value = "";
				document.getElementById("disPrice").readOnly = true;
				
				if(pointhand == false){
					document.getElementById("point").value = parseInt(mainPrice*0.01);
					document.getElementById("point").readOnly = true;
				}
			}
			else if(halin == "직접입력"){
				document.getElementById("disPrice").value="";
				document.getElementById("disPrice").readOnly = false;
				
				var disPriceImsi = myform.disPrice.value;
				
				if(pointhand == false && disPriceImsi == ""){
					document.getElementById("point").value = parseInt(mainPrice*0.01);
					document.getElementById("point").readOnly = true;
				}
			}
			else{
				if(mainPrice == "" || isNaN(mainPrice)){
					alert("판매가격을 먼저 입력하여주세요.");
					$("#disno").prop("checked",true);
					document.getElementById("disPrice").value = "";
					document.getElementById("disPrice").readOnly = true;
					myform.mainPrice.focus();
					return false;
				}
			
				var suhalin = parseFloat(halin);
				disPrice = mainPrice - (mainPrice * suhalin);
				document.getElementById("disPrice").value = parseInt(disPrice);
				document.getElementById("disPrice").readOnly = true;
				
				if(pointhand == false){
					document.getElementById("point").value = parseInt(disPrice*0.01);
					document.getElementById("point").readOnly = true;
				}
			}
		}
    
 		//상품등록 버튼 클릭시
		function fCheck(){
			var categoryMainCode = myform.categoryMainCode.value;
			var categoryMiddleCode = myform.categoryMiddleCode.value;
			var categorySubCode = myform.categorySubCode.value;
			var productCode = myform.productCode.value;
			var productName = myform.productName.value;
			var realPrice = myform.realPrice.value;
			var mainPrice = myform.mainPrice.value;
			var point = myform.point.value;
			var disPrice = myform.disPrice.value;
			var file  = myform.file.value;   // 파일명
			var productContent = myform.productContent.value;
			var productContent2 = myform.productContent2.value;
			var productSubImg = myform.productSubImg.value;
			var ext  = file.substring(file.lastIndexOf(".")+1) //확장자 구하기
			var uExt = ext.toUpperCase();    
			var regExpPrice = /^[0-9|_]*$/;  // 가격은 숫자만
			
	    	if(categoryMainCode==""){
					alert("대분류를 선택하세요!");      
					myform.categoryMainCode.focus();
						return false;
				}
				else if(categoryMiddleCode==""){
					alert("중분류를 선택하세요!");      
					myform.categoryMiddleCode.focus();
						return false;
				}
				else if(categorySubCode==""){
					alert("소분류를 선택하세요!");        
						return false;
				}
				else if(productCode==""){
						alert("상품 코드를 입력하세요!");     
						myform.productCode.focus();
						return false;
				}
				else if(productName==""){
						alert("상품명을 입력하세요!");  
						myform.productName.focus();
						return false;
				}
				else if(realPrice=="" || !regExpPrice.test(realPrice)){
						alert("상품원가를 숫자로 입력하세요!"); 
						myform.realPrice.focus();
						return false;
				}
				else if(mainPrice=="" || !regExpPrice.test(mainPrice)){
						alert("판매금액을 숫자로 입력하세요!");    
						myform.mainPrice.focus();
						return false;
				}
				else if(disPrice!="" && !regExpPrice.test(disPrice)){
						alert("할인금액을 숫자로 입력하세요!");        
						myform.disPrice.focus();
						return false;
				}
				else if(point=="" && !regExpPrice.test(point)){
						alert("적립금을 숫자로 입력하세요!");     
						myform.point.focus();
						return false;
				}
				else if(productContent==""){
					alert("상품상세설명을 입력하세요!");  
					myform.productContent.focus();
						return false;
				}
				else if(productContent2==""){
					alert("상품상세설명을 입력하세요!");  
					myform.productContent2.focus();
						return false;
				}
				else if(CKEDITOR.instances.CKEDITOR.getData()==""){
					alert("상품상세사진을 입력하세요!");
					CKEDITOR.instances.CKEDITOR.focus();
					return false;
				}
				else if(file == "") {
						alert("메인 이미지를 선택하세요!");
						return false;
				}
				else if(uExt != "JPG" && uExt != "JPEG" && uExt != "PNG" && uExt != "GIF") {
						alert("업로드 가능한 파일이 아닙니다.");
						return false;
				}
				else if(document.getElementById("file").value!=""){
						var maxSize = 10 * 1024 * 1024; //10MB
						var fileSize = document.getElementById("file").files[0].size;
						if(fileSize > maxSize){
							 alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
							 return false;
						}
						else{
							myform.submit();
						}
				}    
		}