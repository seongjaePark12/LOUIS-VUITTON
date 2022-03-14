<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
  <script>
    $(document).ready(function() {
<%
      String startJumun = request.getParameter("startJumun")==null ? "" : request.getParameter("startJumun");
      String endJumun = request.getParameter("endJumun")==null ? "" : request.getParameter("endJumun");
%>
<%		if(startJumun.equals("")) { %>
		    document.getElementById("startJumun").value = new Date().toISOString().substring(0,10);
		    document.getElementById("endJumun").value = new Date().toISOString().substring(0,10);
<%    } else { %>
		    document.getElementById("startJumun").value = new Date('<%=startJumun%>').toISOString().substring(0,10);
		    document.getElementById("endJumun").value = new Date('<%=endJumun%>').toISOString().substring(0,10);
<%    } %>
    });
  
    function nWin(orderIdx) {
    	var url = "${ctp}/mypage/dbOrderBaesong?orderIdx="+orderIdx;
    	window.open(url,"dbOrderBaesong","width=350px,height=400px");
    }
    
    $(document).ready(function() {
    	// 주문/배송일자 조회
    	$("#orderStatus").change(function() {
	    	var startJumun = document.getElementById("startJumun").value;
	    	var endJumun = document.getElementById("endJumun").value;
	    	var orderStatus = $(this).val();
	    	location.href="${ctp}/admin/adminOrderStatus?startJumun="+startJumun+"&endJumun="+endJumun+"&orderStatus="+orderStatus;
    	});
    	
    	// 주문상태조회
    	$("#orderDateSearch").click(function() {
	    	var startJumun = document.getElementById("startJumun").value;
	    	var endJumun = document.getElementById("endJumun").value;
	    	var orderStatus = $(this).val();
	    	location.href="${ctp}/admin/adminOrderStatus?startJumun="+startJumun+"&endJumun="+endJumun+"&orderStatus="+orderStatus;
    	});
    });
    /* 개별 주문상태 변경 */
    function orderProcess(orderIdx) {
    	var ans = confirm("주문상태를 변경하시겠습니까?");
    	if(!ans) return false;
    	var orderStatus = document.getElementById("orderStatus3"+orderIdx).value;
  		var query = {
  				orderStatus : orderStatus,
  				orderIdx : orderIdx
  		};
  		$.ajax({
  			type  : "post",
  			url   : "${ctp}/admin/goodsStatus",
  			data  : query,
  			success : function(data) {
  				location.reload();
  			}
    	});
    }
    /* 운송장번호 입력 */
		function baesongNumIn(orderIdx){
			var ans = confirm("운송장 번호를 등록 하시겠습니까?");
	    	if(!ans) return false;
	    	var baesongNum = document.getElementById("baesongNum"+orderIdx).value;
	    	var bb = /^[0-9]+$/;
	    	if(baesongNum == ""){
	    		alert("운송장 번호를 입력해주세요");
	    		return false;
	    	}
	    	else if(!bb.test(baesongNum)){
	    		alert("숫자만 입력해주세요");
	    		return false;
	    	}
	  		var query = {
	  				orderIdx : orderIdx,
	  				baesongNum : baesongNum
	  		};
	  		$.ajax({
	  			type  : "post",
	  			url   : "${ctp}/admin/baesongNumUpdate",
	  			data  : query,
	  			success : function(data) {
	  				location.reload();
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
			// 선택항목 등급수정(ajax)
			function selectLevelCheck(){
				var ans = confirm("주문정보를 바꾸시겠습니까?");
				if(!ans) return false;
				var orderItems = "";
				var orderStatus = document.getElementById("orderStatus2").value;
				
				for(var i=0; i<myform.chk.length; i++){
					if(myform.chk[i].checked == true) orderItems += myform.chk[i].value + "/";
				}
				$.ajax({
					type : "post",
					url : "../admin/orderChange",
					data:{
						orderItems:orderItems,
						orderStatus : orderStatus
						},
					success:function(){
						location.reload();
					},
					error:function(){
						alert("전송오류");
					}
				});			
			}
  </script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<c:set var="orderStatus" value="${orderStatus}"/>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
			<form name="myform" method="post">
			<table class="table table-borderless">
		    <tr>
		      <td colspan="2" class="p-0 text-center"><h2>주문/배송 확인</h2>
		        <input type="date" name="startJumun" id="startJumun"/> ~<input type="date" name="endJumun" id="endJumun"/>
       			<button type="button" id="orderDateSearch" class="btn btn-outline-warning m-0 p-1">조회</button>
		      </td>
		    </tr>
		    <tr>
		       <td align="left">주문상태변경 :
		    		<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp;
		        <select name="orderStatus2" id="orderStatus2" onchange="selectLevelCheck()">
		          <option value="결제완료">결제완료</option>
		          <option value="배송중">배송중</option>
		          <option value="배송완료">배송완료</option>
		          <option value="구매확정">구매확정</option>
		          <option value="반품처리">반품처리</option>
		        </select>
		      </td>
		       <td align="right">주문상태조회 :
		        <select name="orderStatus" id="orderStatus">
		          <option value="전체"    ${orderStatus == '전체'    ? 'selected' : ''}>전체</option>
		          <option value="결제완료" ${orderStatus == '결제완료' ? 'selected' : ''}>결제완료</option>
		          <option value="배송중"  ${orderStatus == '배송중'   ? 'selected' : ''}>배송중</option>
		          <option value="배송완료" ${orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
		          <option value="구매확정" ${orderStatus == '구매확정' ? 'selected' : ''}>구매확정</option>
		          <option value="반품처리" ${orderStatus == '반품처리' ? 'selected' : ''}>반품처리</option>
		        </select>
		      </td>
		    </tr>
	  	</table>
		  <table class="table table-hover text-center">
		    <tr class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;">
		    	<th style="width:5%">선택</th>
		      <th style="width:15%">주문정보</th>
		      <th style="width:30%">상품</th>
		      <th style="width:20%">주문내역</th>
		      <th style="width:20%">주문일시</th>
		    </tr>
				 <c:forEach var="vo" items="${orderVos}">
		     <tr>
		     	<td><input type="checkbox" name="chk" class="chk" value="${vo.orderIdx}"/></td>
	        <td style="text-align:center;">
	          <p>주문번호 : ${vo.orderIdx}</p>
	          <p>총 주문액 : <fmt:formatNumber value="${vo.totalPrice}"/>원</p>
	          <p><input type="button" class="btn btn-outline-warning" value="배송지정보" onclick="nWin('${vo.orderIdx}')"></p>
	          <c:if test="${vo.baesongNum == null}">
	          	<p><input type="text" name="baesongNum" id="baesongNum${vo.orderIdx}" placeholder="운송장 번호 입력"></p>
	          	<p><input type="button" class="btn btn-outline-warning" value="운송장입력" onclick="baesongNumIn('${vo.orderIdx}')"></p>
	          </c:if>
	          <c:if test="${vo.baesongNum != null}">
	          	<p>${vo.baesongNum}</p>
	          </c:if>
	        </td>
	        <td style="text-align:center;"><br/><img src="${ctp}/data/shop/product/${vo.productMainImg}" class="thumb" width="100px"/></td>
	        <td align="left">
		        <p>모델명<br/><span style="font-weight:bold;">${vo.productName}</span><br/> &nbsp; &nbsp; <fmt:formatNumber value="${vo.mainPrice}"/>원</p>
		        <c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
		        <c:set var="optionColors" value="${fn:split(vo.optionColor,',')}"/>
		        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
		        <p>
		          주문 내역
		          <c:if test="${fn:length(optionNames) > 1}"></c:if><br/>
		          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
		            ${optionNames[i-1]} / ${optionColors[i-1]} / ${optionNums[i-1]}개<br/>
		          </c:forEach>
		        </p>
		      </td>
	        <td style="text-align:center;"><br/>
	          주문일자 : ${fn:substring(vo.orderDate,0,10)}<br/><br/>
	          	<select name="orderStatus3" id="orderStatus3${vo.orderIdx}" onchange="orderProcess(${vo.orderIdx})">
			          <option value="결제완료" ${vo.orderStatus == '결제완료' ? 'selected' : ''}>결제완료</option>
			          <option value="배송중"  ${vo.orderStatus == '배송중'   ? 'selected' : ''}>배송중</option>
			          <option value="배송완료" ${vo.orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
			          <option value="구매확정" ${vo.orderStatus == '구매확정' ? 'selected' : ''}>구매확정</option>
			          <option value="반품처리" ${vo.orderStatus == '반품처리' ? 'selected' : ''}>반품처리</option>
							</select>		
	        </td>
	      </tr>
   			<input type="hidden" name="idx" value="${vo.idx}" />
   			<input type="hidden" name="orderIdx" value="${vo.orderIdx}" />
   		</c:forEach>
		  </table>
		  </form>
		  <!-- 블록 페이징처리 시작(BS4 스타일적용) -->
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
					<c:if test="${totPage != 0}">
					  <c:if test="${pag != 1}">
					    <li class="page-item"><a href="${ctp}/admin/orderAdmin?pag=1" title="첫페이지" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;">◁◁</a></li>
					  </c:if>
					  <c:if test="${curBlock > 0}">
					    <li class="page-item"><a href="${ctp}/admin/orderAdmin?pag=${(curBlock-1)*blockSize + 1}" title="이전블록" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;">◀</a></li>
					  </c:if>
					  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					    <c:if test="${i == pag && i <= totPage}">
					      <li class="page-item active"><a href='${ctp}/admin/orderAdmin?pag=${i}' class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;">${i}</a></li>
					    </c:if>
					    <c:if test="${i != pag && i <= totPage}">
					      <li class="page-item"><a href='${ctp}/admin/orderAdmin?pag=${i}' class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;">${i}</a></li>
					    </c:if>
					  </c:forEach>
					  <c:if test="${curBlock < lastBlock}">
					    <li class="page-item"><a href="${ctp}/admin/orderAdmin?pag=${(curBlock+1)*blockSize + 1}" title="다음블록" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" class="page-link">▶</a>
					  </c:if>
					  <c:if test="${pag != totPage}">
					    <li class="page-item"><a href="${ctp}/admin/orderAdmin?pag=${totPage}" title="마지막페이지" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" style="color:#555">▷▷</a>
					  </c:if>
					</c:if>
				</ul>
			</div>
   	</div>
  </div> 
<script src="${ctp}/js/admin.js"></script>
</body>
</html>