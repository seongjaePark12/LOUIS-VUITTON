	  function levelCheck(obj) {
		  	var ans = confirm("답변을 변경 하시겠습니까?");
		  	if(!ans) {
		  		return false;
		  	}
		  	var str = $(obj).val();
		  	var query = {
		  			idx : str.substring(1),
		  			anser : str.substring(0,1)
		  	}
		  	$.ajax({
		  		type : "post",
		  		url  : "../admin/adminQuestionAnser",
		  		data : query,
		  		error:function() {
		  			alert("처리 실패!!");
		  		}
		  	});
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
		// 선택항목 삭제하기(ajax)
		function selectDelCheck(){
			var ans = confirm("선택된 문의를 삭제 하시겠습니까?");
			if(!ans) return false;
			var delItems = "";
			
			for(var i=0; i<myform.chk.length; i++){
				if(myform.chk[i].checked == true) delItems += myform.chk[i].value + "/";
			}
			
			$.ajax({
				type : "post",
				url : "../admin/questionListDel",
				data:{delItems:delItems},
				success:function(){
					location.reload();
				},
				error:function(){
					alert("전송오류");
				}
			});			
		}
		// 선택항목 답변수정(ajax)
		function selectLevelCheck(){
			var ans = confirm("답변을 변경 하시겠습니까?");
			if(!ans) return false;
			var anserItems = "";
			var anser = myform.anser2.value;
			
			for(var i=0; i<myform.chk.length; i++){
				if(myform.chk[i].checked == true) anserItems += myform.chk[i].value + "/";
			}
			$.ajax({
				type : "get",
				url : "../admin/questionListAnser",
				data:{
					anserItems:anserItems,
					anser : anser
					},
				success:function(){
					location.reload();
				},
				error:function(){
					alert("전송오류");
				}
			});			
		}