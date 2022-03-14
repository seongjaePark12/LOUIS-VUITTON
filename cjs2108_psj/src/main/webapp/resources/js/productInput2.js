    function categoryMainChange() {
    	var categoryMainCode = myform.categoryMainCode.value;
			$.ajax({
				type : "post",
				url  : "../product/categoryMiddleName",
				data : {categoryMainCode : categoryMainCode},
				success:function(data) {
					var str = "";
					str += "<option value=''>중분류</option>";
					for(var i=0; i<data.length; i++) {
						str += "<option value='"+data[i].categoryMiddleCode+"'>"+data[i].categoryMiddleName+"</option>";
					}
					$("#categoryMiddleCode").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}
    
    // 상품 입력창에서 중분류 선택(Change)시 소분류가져와서 소분류 선택박스에 뿌리기
    function categoryMiddleChange() {
    	var categoryMainCode = myform.categoryMainCode.value;
    	var categoryMiddleCode = myform.categoryMiddleCode.value;
			$.ajax({
				type : "post",
				url  : "../product/categorySubName",
				data : {
					categoryMainCode : categoryMainCode,
					categoryMiddleCode : categoryMiddleCode
				},
				success:function(data) {
					var str = "";
					str += "<option value=''>소분류</option>";
					for(var i=0; i<data.length; i++) {
						str += "<option value='"+data[i].categorySubCode+"'>"+data[i].categorySubName+"</option>";
					}
					$("#categorySubCode").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}

 		//상품코드 중복확인 버튼 클릭시
		function productCodeCheck() {
			var productCode = myform.productCode.value;
			if(productCode==""){
				alert("상품코드를 입력하세요.");
			}
			else{
				$.ajax({
					type : "post",
					url : "../product/productCodeCheck",
					data : {productCode : productCode},
					success:function(data){
						if(data=="0")alert("사용가능한 상품코드입니다."); 
						else {
							alert("이미 사용중인 상품코드입니다.");
							myform.productCode.focus();
						}
					}
				});
			}
		}