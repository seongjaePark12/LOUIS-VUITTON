<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productVo.productName}</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/shopContent.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script src="${ctp}/js/shopContent.js"></script>
		<style>
		.heart{
			font-size:17px;
		}
		.heart:hover{
			cursor: pointer;
			color: gold;
		}
	</style>
	<script>
    var idxArray = new Array();
    $(function(){
    	$("#selectOption").change(function(){						
    		var selectOption = $(this).val();
    		var idx = selectOption.substring(0,selectOption.indexOf(":")); 															
    		var optionName = selectOption.substring(selectOption.indexOf(":")+1,selectOption.indexOf("_"));
    		var optionColor = selectOption.substring(selectOption.indexOf("_")+1); 	
    		var disPrice = ${productVo.disPrice};
    		var commaPrice = numberWithCommas(disPrice);																						
    		if($("#layer"+idx).length == 0 && selectOption != "") {
    		  idxArray[idx] = idx;
	    		var str = "";
	    		str += "<div class='layer row' id='layer"+idx+"'><div class='col'>"+optionName+optionColor+":"+"</div>";
	    		str += "<input type='number' class='numBox' id='numBox"+idx+"' name='optionNum' onchange='numChange("+idx+")' value='1' min='1'/>";
	    		str += "<input type='text' id='imsiPrice"+idx+"' class='price' value='"+commaPrice+"' readonly />";
	    		str += "<input type='hidden' id='price"+idx+"' class='price' value='"+disPrice+"'/> &nbsp;";
	    		str += "<input type='button' class='btn btn-outline-secondary btn-sm' onclick='remove("+idx+")' value='삭제'/>";
	    		str += "<input type='hidden' name='statePrice' id='statePrice"+idx+"' value='"+disPrice+"'/>";
	    		str += "<input type='hidden' name='optionIdx' value='"+idx+"'/>";
	    		str += "<input type='hidden' name='optionName' value='"+optionName+"'/>";
	    		str += "<input type='hidden' name='optionColor' value='"+optionColor+"'/>";
	    		str += "<input type='hidden' name='disPrice' value='"+disPrice+"'/>";
	    		str += "</div>";
	    		$("#product1").append(str);
	    		onTotal();
    	  }
    	  else {
    		  alert("이미 선택한 옵션입니다.");
    	  }
    	});
    });

	function heartCheckon1(){
		var ans = confirm("로그인 후 이용가능한 서비스입니다.\n로그인창으로 이동 하시겠습니까?");
		if(!ans) {
			return false;
		}
		else {
   		location.href = "../member/login";
		}
	}
    
	function heartCheckon(){
		var mid = wishForm.mid.value;
		var productIdx = wishForm.productIdx.value;
		var productName = wishForm.productName.value;
		var productCode = wishForm.productCode.value;
		var disPrice = wishForm.disPrice.value;
		var productMainImg = wishForm.productMainImg.value;
		var wish = wishForm.wish.value;
		var query = {
				mid : mid,
				productIdx : productIdx,
				productName : productName,
				productCode : productCode,
				disPrice : disPrice,
				productMainImg : productMainImg,
				wish : wish
		}
		$.ajax({
  			type  : "post",
  			url   : "${ctp}/shop/heartOn",
  			data  : query,
  			success : function(data) {
  				location.reload();
  			}
    	});
	}
	</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-container">
		<div class="row">
			<div class="col-lg-1 w3-margin-bottom">
			</div>
			<div class="col-lg-5 w3-margin-bottom">
				<div class="card border-0">
					<div class="card-header p-0">
						<img src="${ctp}/data/shop/product/${productVo.productMainImg}" class="card-img" alt="image">
					</div>
				</div>
			</div>
			<div class="col-lg-1 w3-margin-bottom">
			</div>
			<div class="col-lg-3 w3-margin-bottom w3-margin-top">
				<form name="wishForm" method="post">
				<h5>
					<b>${productVo.productCode}</b>
					<c:set var="mid" value="${sMid}"/>
					<c:if test="${mid == null}">
						<i class="fa fa-heart-o w3-display-topright w3-padding heart" onclick="heartCheckon1()"></i>
					</c:if>
 					<c:if test="${mid != null && wishVo.wish != '1'}">
						<i class="fa fa-heart-o w3-display-topright w3-padding heart" onclick="heartCheckon()"></i>
						<input type="hidden" name="wish" id="wish" value="1" />
					</c:if>
					<c:if test="${mid != null && wishVo.wish == '1'}">
						<i class="fa fa-heart w3-display-topright w3-padding heart" onclick="heartCheckon()"></i>
						<input type="hidden" name="wish" id="wish" value="0" />
					</c:if>
					<input type="hidden" name="mid" value="${sMid}"/>
			    <input type="hidden" name="productIdx" value="${productVo.idx}"/>
			    <input type="hidden" name="productName" value="${productVo.productName}"/>
			    <input type="hidden" name="productCode" value="${productVo.productCode}"/>
			    <input type="hidden" name="disPrice" value="${productVo.disPrice}"/>
			    <input type="hidden" name="productMainImg" value="${productVo.productMainImg}"/>
				</h5>
				</form>
				<h2><b>${productVo.productName}</b></h2>
				<hr/>
				<c:if test="${productVo.disPrice == productVo.mainPrice}"><h4>￦<fmt:formatNumber value="${productVo.disPrice}" pattern="#,###"/></h4></c:if>
				<c:if test="${productVo.disPrice != productVo.mainPrice}"><h4><b style="color:red">SALE</b><span style="text-decoration: line-through;">￦<fmt:formatNumber value="${productVo.mainPrice}" pattern="#,###"/></span></h4><h4>￦<fmt:formatNumber value="${productVo.disPrice}" pattern="#,###"/></h4></c:if>
				<hr/>
				<div class="form-group">
				  <form name="optionForm">
			      <select size="1" class="w3-select" id="selectOption">
			        <option value="" disabled selected>상품옵션선택</option>
			        <c:forEach var="vo" items="${optionVos}">
			        	<c:if test="${vo.optionNum == '0'}">
				          <option value="" disabled style="text-decoration: line-through;">${vo.optionName}-${vo.optionColor} : 품절</option>
			        	</c:if>
			        	<c:if test="${vo.optionNum != '0'}">
				          <option value="${vo.idx}:${vo.optionName}_${vo.optionColor}">${vo.optionName}-${vo.optionColor}</option>
			        	</c:if>
			        </c:forEach>
			      </select>
		    	</form>
				</div>
				<form name="myform" method="post">
			    <input type="hidden" name="mid" value="${sMid}"/>
			    <input type="hidden" name="productIdx" value="${productVo.idx}"/>
			    <input type="hidden" name="productName" value="${productVo.productName}"/>
			    <input type="hidden" name="productCode" value="${productVo.productCode}"/>
			    <input type="hidden" name="realPrice" value="${productVo.realPrice}"/>
			    <input type="hidden" name="mainPrice" value="${productVo.mainPrice}"/>
			    <input type="hidden" name="point" value="${productVo.point}"/>
			    <input type="hidden" name="disPrice" value="${productVo.disPrice}"/>
			    <input type="hidden" name="productMainImg" value="${productVo.productMainImg}"/>
			    <input type="hidden" name="totalPrice" id="totalPriceResult"/>
			    <div id="product1"></div>
			  </form>
			  <div class="product2">
			    <hr/>
			    <font size="4" color="black">총상품금액</font>
			    <p align="right">
		        <b><input type="text" class="totalPrice text-right" id="totalPrice" value="<fmt:formatNumber value='0'/>" readonly /></b>
			    </p>
			  </div>
				<hr/>
					<div class="buttongroup">
					<c:set var="mid" value="${sMid}"/>
					<c:if test="${mid == null}">
				    <button class="mybtn2" onclick="cart2()">장바구니</button> &nbsp;
					</c:if>
					<c:if test="${mid != null}">
				    <button class="mybtn2" onclick="cart()">장바구니</button> &nbsp;
					</c:if>
			    <button class="mybtn2" onclick="history.back()">계속쇼핑하기</button>
		 		</div>
		 		<hr/>
				<h5>${productVo.productContent}</h5>
		 		<br/><hr/>
				<h5>${fn:replace(productVo.productContent2,newLine,'<br/>')}</h5>
			</div>
			<div class="col-lg-13 w3-margin-bottom">
				${productVo.productSubImg}
			</div>
		</div>	
	</div>	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>