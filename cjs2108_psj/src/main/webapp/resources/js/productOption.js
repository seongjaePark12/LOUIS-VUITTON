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
    
    function categorySubChange() {
    	var categoryMainCode = myform.categoryMainCode.value;
    	var categoryMiddleCode = myform.categoryMiddleCode.value;
    	var categorySubCode = myform.categorySubCode.value;
			$.ajax({
				type : "post",
				url  : "../product/categoryProuctName",
				data : {
					categoryMainCode : categoryMainCode,
					categoryMiddleCode : categoryMiddleCode,
					categorySubCode : categorySubCode
				},
				success:function(data) {
					var str = "";
					str += "<option value=''>상품명</option>";
					for(var i=0; i<data.length; i++) {
						str += "<option value='"+data[i].idx+"/"+data[i].productCode+"'>"+data[i].productName+"</option>";
					}
					$("#productCode").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}

		//옵션삭제 버튼 클릭시
		var remove_div = function(test){
			$("#"+test.id).remove();
		}
		//옵션추가버튼클릭시
		var cnt = 1;
		var add_div = function(){
			var strMenu = "";
			var test = "t" + cnt;
			strMenu += '<div id="'+test+'" class="form-group" style="float:left;width:100%;W"><hr size="5px"/>'
			         + '<font size="4"><b>상품옵션등록</b></font>&nbsp;&nbsp;'
			         + '<input type="button" id="test'+test+'" class="btn btn-outline-secondary btn-sm" value="옵션삭제" onclick="remove_div('+test+')"><br/>'
			         + '<br/><div class="form-group" style="float:left;width:21%;margin:10px;"><label for="optionName"><b>상품옵션이름</b></label>'
			         + '<select name="optionName" id="optionName'+cnt+'" class="form-control">'
			         + '<option value="Free">Free</option>'
			         + '<option value="S">S</option>'
			         + '<option value="M">M</option>'
			         + '<option value="L">L</option>'
			         + '<option value="XL">XL</option>'
			         + '<option value="XXL">XXL</option>'
			         + '</select></div>'
			         + '<div class="form-group" style="float:left;width:27%;margin:10px;">'
			         + '<label for="optionColor"><b>색상</b></label>'
			         + '<input type="text" class="form-control" id="optionColor'+cnt+'" placeholder="색상을 입력해주세요" name="optionColor" required >'
			         + '</div><div class="form-group" style="float:left;width:27%;margin:10px;"><label for="optionNum"><b>재고</b></label>&nbsp;&nbsp;'
			         + '<input type="text" name="optionNum" id="optionNum'+cnt+'" placeholder="재고를 입력하세요" class="form-control" required />'
			         + '</div></div>';       
			$("#optionType").append(strMenu);
			cnt ++;
		}
    
    // 옵션체크후 등록전송
    function fCheck() {
    	for(var i=1; i<=cnt; i++) {
    		if($("#t"+i).length != 0 && document.getElementById("optionName"+i).value=="") {
    			alert("빈칸 없이 상품 옵션명을 모두 등록하셔야 합니다");
    			return false;
    		}
    		else if($("#t"+i).length != 0 && document.getElementById("optionNum"+i).value=="") {
    			alert("빈칸 없이 상품 옵션재고를 모두 등록하셔야 합니다");
    			return false;
    		}
    		else if($("#t"+i).length != 0 && document.getElementById("optionColor"+i).value=="") {
    			alert("빈칸 없이 상품 옵션색상을 모두 등록하셔야 합니다");
    			return false;
    		}
    	}
    	if(document.getElementById("optionName").value=="") {
    		alert("상품 옵션이름을 등록하세요");
    		return false;
    	}
    	else if(document.getElementById("optionColor").value=="") {
    		alert("상품 옵션색상을 등록하세요");
    		return false;
    	}
    	else if(document.getElementById("optionNum").value=="") {
    		alert("상품 옵션재고를 등록하세요");
    		return false;
    	}
    	else if(document.getElementById("productCode").value=="") {
    		alert("상품명을 선택하세요");
    		return false;
    	}
    	else {
    		myform.submit();
    	}
    }