<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script>
  	function pageCheck(){
  		var pageSize = document.getElementById("pageSize").value;
  		location.href= "${ctp}/notice/noticeAdmin?page=${pag}&pageSize="+pageSize;
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
			url : "../notice/noticeListDel",
			data:{delItems:delItems},
			success:function(){
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});			
	}
	// 선택항목 공지수정(ajax)
	function selectLevelCheck(){
		var ans = confirm("선택항목의 공지를 변경 하시겠습니까?");
		if(!ans) return false;
		var anserItems = "";
		var notice = myform.notice.value;
		
		for(var i=0; i<myform.chk.length; i++){
			if(myform.chk[i].checked == true) anserItems += myform.chk[i].value + "/";
		}
		$.ajax({
			type : "get",
			url : "../notice/noticeListAnser",
			data:{
				anserItems:anserItems,
				notice : notice
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
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  <form name="myform" method="post">
			<table class="table table-borderless">
		    <tr>
		      <td colspan="2" class="p-0 text-center"><h2>NOTICE</h2></td>
		    </tr>
		    <tr>
		      <td class="text-left p-0">
		        <a href="${ctp}/notice/noticeInput" class="btn btn-outline-warning w3-border w3-round-xxlarge font6">글쓰기</a>
		      </td>
		      <td class="text-right p-0">
						<select class="w3-panel w3-border w3-round-xxlarge font6" name="pageSize" id="pageSize" onchange="pageCheck()">
							<option value="5" ${pageSize==5 ? 'selected' : ''}>5건</option>
							<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
							<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
							<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
							<option value="50" ${pageSize==50 ? 'selected' : ''}>50건</option>
						</select>
		      </td>
		    </tr>
		    <tr>
					<td>
						<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp;
						<input type="button" value="선택항목 삭제" onclick="selectDelCheck()" class="btn btn-warning btn-sm"/>
						<select name="notice" onchange="selectLevelCheck()">
								<option value="">공지변경</option>
								<option value="1">Main공지</option>
								<option value="0">비공지</option>
						</select>					
					</td>
				</tr>
	  	</table>
		  <table class="table table-hover text-center">
		    <tr class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
		    	<th style="width:3%">공지</th>
		    	<th style="width:5%">선택</th>
		      <th style="width:5%">번호</th>
		      <th style="width:50%">제목</th>
		      <th style="width:12%">작성자</th>
		      <th style="width:10%">작성일</th>
		    </tr>
		    <c:forEach var="vo" items="${vos}">
			    <tr>
			    	<td><c:if test="${vo.notice == 1}"><font color="red"><b>공지</b></font></c:if></td>
		   			<td><input type="checkbox" name="chk" class="chk" value="${vo.idx}"/></td>
			    		<td>${curScrStartNo}</td>
			      <td>
			      	<a href="${ctp}/notice/noticeContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
			      	<c:if test="${vo.diffTime <= 24}"><img src="${ctp}/images/new.png" width="40px" height="20px"/></c:if>
			      </td>
			      <td>${vo.name}</td>
			      <td>
			      	<c:if test="${vo.diffTime <= 24}">${fn:substring(vo.dateNow,11,16)}</c:if>
			      	<c:if test="${vo.diffTime > 24}">${fn:substring(vo.dateNow,0,10)}</c:if>
			      </td>
			    </tr>
			    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		    </c:forEach>
		  </table>
		  </form>
   	</div>
  </div> 
 <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/notice/noticeAdmin?pag=1&pageSize=${pageSize}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/notice/noticeAdmin?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='${ctp}/notice/noticeAdmin?pag=${i}&pageSize=${pageSize}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/notice/noticeAdmin?pag=${i}&pageSize=${pageSize}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/notice/noticeAdmin?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/notice/noticeAdmin?pag=${totPage}&pageSize=${pageSize}" class="page-link" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); color:black;" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>