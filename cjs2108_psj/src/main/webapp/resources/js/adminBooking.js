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
			var ans = confirm("선택된 예약을 삭제 하시겠습니까?");
			if(!ans) return false;
			var delItems = "";
			
			for(var i=0; i<myform.chk.length; i++){
				if(myform.chk[i].checked == true) delItems += myform.chk[i].value + "/";
			}
			
			$.ajax({
				type : "post",
				url : "../admin/bookingListDel",
				data:{delItems:delItems},
				success:function(){
					location.reload();
				},
				error:function(){
					alert("전송오류");
				}
			});			
		}
		// 개별회원검색
		function nameSearch() {
			var name = myform.name.value;
			if(name == ""){
				alert("이름을 입력하세요");
				myform.name.focus();
			}else{
				location.href="../admin/booking?name="+name;
			}
		}