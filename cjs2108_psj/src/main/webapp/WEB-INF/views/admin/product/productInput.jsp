<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/productInput2.js"></script>
	<script src="${ctp}/js/productInput.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
<br/><br/><br/><br/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  	<h2 style="text-align:center; color: #626262;">상품등록</h2>
		  <br/>
	     <form name="myform" method="post" enctype="multipart/form-data">
			  	<div class="form-group" style="float:left;width: 31%; margin-right: 35px;">
			  		<label for="categoryMainCode"><b>대분류</b></label>
						<select name="categoryMainCode" id="categoryMainCode" class="form-control" onchange="categoryMainChange()">
							<option value="">대분류선택</option>
							<c:forEach var="mainVo" items="${mainVos}">
			  	    <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
			  	 		</c:forEach>
						</select>
			    </div>
			    <div class="form-group" style="float:left;width: 31%; margin-right: 35px;">
		        <label for="categoryMiddleCode"><b>중분류</b></label>
		        <select id="categoryMiddleCode" name="categoryMiddleCode" class="form-control" onchange="categoryMiddleChange()">
			        <option value="">중분류를 선택하세요</option>
			        <c:forEach var="middleVo" items="${middleVos}">
				  	    <option value=""></option>
				  	  </c:forEach>
		        </select>
			    </div>              
			    <div class="form-group" style="float:left;width: 31%;">
		        <label for="categorySubCode"><b>소분류</b></label>
		        <select id="categorySubCode" name="categorySubCode" class="form-control">
		      	  <option value="">소분류를 선택하세요</option>
		      	  <c:forEach var="subVo" items="${subVos}">
				  	    <option value=""></option>
				  	  </c:forEach>
		        </select>
			    </div>  
 				  <div class="form-group">
		        <label for="productCode"><b>상품코드</b></label>
		    		<input type="button" class="btn btn-outline-warning btn-sm" value="상품코드 중복확인" style="width:130px;" onclick="productCodeCheck()">
		        <input type="text" name="productCode" class="form-control" id="productCode" placeholder="상품 코드를 입력하세요" required >
			    </div>  
					<div class="form-group">
		        <label for="productName"><b>상품명</b></label>
		        <input type="text" name="productName" class="form-control" id="productName" placeholder="상품명을 입력하세요" required >
			    </div>
				  <div class="form-group">
		        <label for="realPrice"><b>상품원가</b></label>
		        <input type="text" class="form-control" id="realPrice" placeholder="원가 입력" name="realPrice" maxlength="10" required >
				  </div> 
			    <div class="form-group">
		        <label for="mainPrice"><b>판매가격</b></label>
		        <input type="text" class="form-control" id="mainPrice" placeholder="판매가격 입력" name="mainPrice" maxlength="10" onkeyup="pointCalc(this.value)" required >
				  </div>
 				  <div class="form-group">
		        <label for="point">
		        	<b>적립금</b>&nbsp;&nbsp;&nbsp;&nbsp;
		        	<input type="checkbox" value="직접입력" id="pointhand" onclick="pointchk()"> 직접입력
		        </label>
		        <input type="text" class="form-control" id="point" placeholder="적립금 입력" name="point" maxlength="10" readonly >
				  </div>
 				  <div class="form-group">
		        <label for="disPrice"><b>할인가격</b> </label> <br>
		        <input type="radio" name="dis" value="0" onclick="inputhalin(this.value)" id="disno" > 없음 &nbsp;&nbsp;
		        <input type="radio" name="dis" value="0.03" onclick="inputhalin(this.value)"> 3% &nbsp;&nbsp;
		        <input type="radio" name="dis" value="0.05" onclick="inputhalin(this.value)"> 5% &nbsp;&nbsp;
		        <input type="radio" name="dis" value="0.1" onclick="inputhalin(this.value)"> 10% &nbsp;&nbsp;
		        <input type="radio" name="dis" value="0.15" onclick="inputhalin(this.value)"> 15% &nbsp;&nbsp;
		        <input type="radio" name="dis" value="0.2" onclick="inputhalin(this.value)"> 20% &nbsp;&nbsp;
		        <input type="radio" name="dis" value="직접입력" onclick="inputhalin(this.value)"> 직접입력 
		        <input type="text" class="form-control" id="disPrice" placeholder="할인가격 입력" name="disPrice" maxlength="10" style="width: 46%;" onkeyup="pointCalc(this.value)" readonly >
				  </div>
 				  <div class="form-group">
		        <label for="file"><b>메인이미지</b></label>
		        <input type="file" name="file" id="file" class="form-control-file border" accept=".jpg,.png,.jpeg,.gif" required >
		        (업로드 가능파일 : jpg , jpeg , png, gif )
			    </div>
	 				<div class="form-group">
		        <label for="productContent"><b>상품상세설명</b></label>
		        <textarea rows="6" cols="120" class="form-control" id="productContent" placeholder="상품 상세 설명" name="productContent" required ></textarea>
			    </div>  
	 				<div class="form-group">
		        <label for="productContent2"><b>상품 세부정보</b></label>
		        <textarea rows="6" cols="120" class="form-control" id="productContent2" placeholder="상품 세부 정보" name="productContent2" required ></textarea>
			    </div>  
				    <div class="form-group">
			        <label for="productSubImg"><b>상품상세사진</b></label>
			        <textarea class="form-control" rows="5" id="CKEDITOR" name="productSubImg" ></textarea>
			    </div>
			    <div style="text-align: center;"><br/>
			    	<button type="button" class="btn btn-warning" onclick="fCheck()" style="width:120px;">상품등록</button> &nbsp;
			  	</div>
 			  	<input type="hidden" name="point">
			  	<input type="hidden" name="disPrice">
		  	</form>  
		  </div>
		</div>
		<br/><br/>
 <script>
	CKEDITOR.replace("productSubImg", {
		uploadUrl:"${ctp}/product/imageUpload",		/* 여러개의 그림파일을 드래그&드롭으로 처리 */
		filebrowserUploadUrl : "${ctp}/product/imageUpload", /* 파일(이미지) 업로드시 처리 */
		height:400
	});
</script>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>