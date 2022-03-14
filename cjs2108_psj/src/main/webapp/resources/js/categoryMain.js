    function categoryMainCheck() {
    	var categoryMainCode = categoryMainForm.categoryMainCode.value;
    	var categoryMainName = categoryMainForm.categoryMainName.value;
    	if(categoryMainCode == "") {
    		alert("대분류 코드를 입력하세요");
    		categoryMainForm.categoryMainCode.focus();
    		return false;
    	}
    	if(categoryMainName == "") {
    		alert("대분류명을 입력하세요");
    		categoryMainForm.categoryMainName.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "../product/categoryMainInput",
    		data : {
    			categoryMainCode : categoryMainCode,
    			categoryMainName : categoryMainName
    		},
    		success:function(data) {
    			if(data == "0") alert("같은 상품이 등록되어 있습니다.");
    			else location.reload();
    		},
    		error : function() {
    			alert('전송오류!');
    		}
    	});
    }
    
    function delCategoryMain(categoryMainCode) {
    	var ans = confirm("대분류항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	$.ajax({
    		type : "post",
    		url  : "../product/delCategoryMain",
    		data : {categoryMainCode : categoryMainCode},
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