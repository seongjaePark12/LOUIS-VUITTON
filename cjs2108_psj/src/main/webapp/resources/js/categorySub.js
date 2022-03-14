    function categorySubCheck() {
    	var categoryMainCode = categorySubForm.categoryMainCode.value;
    	var categoryMiddleCode = categorySubForm.categoryMiddleCode.value;
    	var categorySubCode = categorySubForm.categorySubCode.value;
    	var categorySubName = categorySubForm.categorySubName.value;
    	if(categoryMainCode == "") {
    		alert("대분류명을 선택하세요");
    		return false;
    	}
    	if(categoryMiddleCode == "") {
    		alert("중분류명을 선택하세요");
    		return false;
    	}
    	if(categorySubCode == "") {
    		alert("소분류코드를 입력하세요");
    		categorySubForm.categorySubCode.focus();
    		return false;
    	}
    	if(categorySubName == "") {
    		alert("소분류명을 입력하세요");
    		categorySubForm.categorySubName.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "../product/categorySubInput",
    		data : {
    			categoryMainCode   : categoryMainCode,
    			categoryMiddleCode : categoryMiddleCode,
    			categorySubCode : categorySubCode,
    			categorySubName : categorySubName
    		},
    		success:function(data) {
    			if(data == "0") {
    				alert("같은 상품이 등록되어 있습니다.");
    			}
    			else {
    				location.reload();
    			}
    		},
    		error : function() {
    			alert('전송오류!');
    		}
    	});
    }
    
    // 소분류 삭제
    function delCategorySub(categorySubCode) {
    	var ans = confirm("소분류항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	$.ajax({
    		type : "post",
    		url  : "../product/delCategorySub",
    		data : {categorySubCode : categorySubCode},
    		success:function(data) {
    			if(data == 0) {
    				alert("하위항목이 있기에 삭제할 수 없습니다.\n 상품-소분류-중분류-대분류 순으로 삭제하세요.");
    			}
    			else {
    				location.reload();
    			}
    		}
    	});
    }
    
    // 소분류 입력창에서 대분류 선택(Change)시 수행
    function categoryMainChange() {
    	var categoryMainCode = categorySubForm.categoryMainCode.value;
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