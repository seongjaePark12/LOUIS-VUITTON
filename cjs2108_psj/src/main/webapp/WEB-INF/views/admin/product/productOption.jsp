<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품옵션</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/productOption.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
<br/><br/><br/><br/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  	<h2 style="text-align:center; color: #626262;">옵션등록</h2>
		  <br/>
	     <form name="myform" method="post">
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
		        <select id="categorySubCode" name="categorySubCode" class="form-control" onchange="categorySubChange()">
		      	  <option value="">소분류를 선택하세요</option>
		      	  <c:forEach var="subVo" items="${subVos}">
				  	    <option value=""></option>
				  	  </c:forEach>
		        </select>
			    </div>  
			    <br/><br/><br/><br/>
			    <div class="form-group">
		        <label for="productCode"><b>상품명</b></label>
		        <select id="productCode" name="productCode" class="form-control">
		      	  <option value="">상품명 선택하세요</option>
		      	  <c:forEach var="vo" items="${vos}">
				  	    <option value=""></option>
				  	  </c:forEach>
		        </select>
			    </div>  
			    <br/><br/><br/><br/>
	 				<div class="form-group" id="po"><br/>
					<font size="4"><b>상품옵션등록</b></font>&nbsp;&nbsp;
    				<input type="button" class="btn btn-outline-warning btn-sm" value="옵션추가" onclick="add_div()">
		     		<br/><br/>
		        <div class="form-group" style="float:left;width:21%;margin:10px;">
		          <label for="optionName"><b>상품사이즈</b></label>
		       	  <select name="optionName" id="optionName" class="form-control">
	       	  	 	 <option value="" selected>사이즈를 선택하세요.</option>
       	  	  	 <option value="Free">Free</option>
       	  	  	 <option value="S">S</option>
       	  	  	 <option value="M">M</option>
       	  	  	 <option value="L">L</option>
       	  	  	 <option value="XL">XL</option>
       	  	  	 <option value="XXL">XXL</option>
		          </select>
      			</div>  
      			<div class="form-group" style="float:left;width:27%;margin:10px;">
			        <label for="optionColor"><b>색상</b></label>
			        <input type="text" class="form-control" id="optionColor" placeholder="색상을 입력해주세요" name="optionColor" required >
				  	</div> 
		        <div class="form-group" style="float:left;width:27%;margin:10px;">
			        <label for="optionNum"><b>재고</b></label>&nbsp;&nbsp;
			        <input type="number" name="optionNum" id="optionNum" placeholder="재고를 입력하세요" class="form-control" required >
	 					</div>
	 					<div id="optionType" style="float:left;width:100%;"> </div>
				    <br/>
   				</div><br/><br/><br/><br/>
			    <div style="text-align: center;"><br/>
			    	<button type="button" class="btn btn-warning" onclick="fCheck()" style="width:120px;">옵션등록</button> &nbsp;
			  	</div>
		  	</form>  
		  </div>
		</div>
		<br/><br/>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>