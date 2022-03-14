    function categoryMiddleCheck() {
    	var categoryMainCode = categoryMiddleForm.categoryMainCode.value;
    	var categoryMiddleCode = categoryMiddleForm.categoryMiddleCode.value;
    	var categoryMiddleName = categoryMiddleForm.categoryMiddleName.value;
    	if(categoryMainCode == "") {
    		alert("대분류명을 선택하세요");
    		return false;
    	}
    	if(categoryMiddleCode == "") {
    		alert("중분류코드를 입력하세요");
    		categoryMiddleForm.categoryMiddleCode.focus();
    		return false;
    	}
    	if(categoryMiddleName == "") {
    		alert("중분류명을 입력하세요");
    		categoryMiddleForm.categoryMiddleName.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "../product/categoryMiddleInput",
    		data : {
    			categoryMainCode   : categoryMainCode,
    			categoryMiddleCode : categoryMiddleCode,
    			categoryMiddleName : categoryMiddleName
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
    
    function delCategoryMiddle(categoryMiddleCode) {
    	var ans = confirm("중분류항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	$.ajax({
    		type : "post",
    		url  : "../product/delCategoryMiddle",
    		data : {categoryMiddleCode : categoryMiddleCode},
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