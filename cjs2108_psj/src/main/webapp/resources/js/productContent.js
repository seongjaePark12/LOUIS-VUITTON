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
    
    function OCheck(idx) {
    	var optionName = $("#optionName"+idx).val();
    	var optionColor = $("#optionColor"+idx).val();
    	var optionNum = $("#optionNum"+idx).val();
    	
    	if(optionName=="") {
    		alert("상품 옵션이름을 등록하세요");
    		return false;
    	}
    	else if(optionColor=="") {
    		alert("상품 옵션색상을 등록하세요");
    		return false;
    	}
    	else if(optionNum=="") {
    		alert("상품 옵션재고를 등록하세요");
    		return false;
    	}
    	else {
				$.ajax({
					type : "post",
					url : "../product/optionContent",
					data : {
						idx : idx,
						optionName : optionName,
						optionColor : optionColor,
						optionNum : optionNum
						},
					success:function(){
						location.reload();
					},
				});
    	}
    }
    function ODel(idx) {
    	var ans = confirm("삭제 하시겠습니까?");
  		if(!ans) return;
  		
				$.ajax({
					type : "post",
					url : "../product/optionDel",
					data : {idx : idx},
					success:function(){
						location.reload();
					},
				});
    }