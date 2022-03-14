	  function levelCheck(obj) {
		  	var ans = confirm("회원등급을 변경하시겠습니까?");
		  	if(!ans) {
		  		return false;
		  	}
		  	var str = $(obj).val();
		  	var query = {
		  			idx : str.substring(1),
		  			level : str.substring(0,1)
		  	}
		  	
			  	$.ajax({
			  		type : "post",
			  		url  : "../admin/adminMemberLevel",
			  		data : query,
			  		error:function() {
			  			alert("처리 실패!!");
			  		}
			  	});
			  }
		  
	  	//등급별 검색
	  	function levelSearch() {
				var level = myform.levelel.value;
				location.href="../admin/memberList?level="+level;
			}
	  	
	  	// 개별회원검색
	  	function midSearch() {
				var mid = myform.mid.value;
				if(mid == ""){
					alert("아이디를 입력하세요");
					myform.mid.focus();
				}else{
					location.href="../admin/memberList?mid="+mid;
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
			// 선택항목 삭제하기(ajax)
			function selectDelCheck(){
				var ans = confirm("선택된 회원을 삭제 하시겠습니까?");
				if(!ans) return false;
				var delItems = "";
				
				for(var i=0; i<myform.chk.length; i++){
					if(myform.chk[i].checked == true) delItems += myform.chk[i].value + "/";
				}
				
				$.ajax({
					type : "post",
					url : "../admin/memberListDel",
					data:{delItems:delItems},
					success:function(){
						location.reload();
					},
					error:function(){
						alert("전송오류");
					}
				});			
			}
			// 선택항목 등급수정(ajax)
			function selectLevelCheck(){
				var ans = confirm("등급을 바꾸시겠습니까?");
				if(!ans) return false;
				var levelItems = "";
				var level = myform.level2.value;
				
				for(var i=0; i<myform.chk.length; i++){
					if(myform.chk[i].checked == true) levelItems += myform.chk[i].value + "/";
				}
				$.ajax({
					type : "get",
					url : "../admin/memberListLevel",
					data:{
						levelItems:levelItems,
						level : level
						},
					success:function(){
						location.reload();
					},
					error:function(){
						alert("전송오류");
					}
				});			
			}