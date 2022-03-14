    function fCheck() {
    	var title = myform.title.value;
    	var content = myform.content.value;
    	var what = myform.what.value;
    	
    	if(title.trim() == "") {
    		alert("게시글 제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(what == "") {
    		alert("문의유형을 선택하세요");
    		myform.what.focus();
    	}
    	else {
    		myform.oriContent.value = document.getElementById("oriContent").innerHTML;
    		myform.submit();
    	}
    }