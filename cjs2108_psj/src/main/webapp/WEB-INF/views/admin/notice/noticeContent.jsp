<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항내용</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/notice.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script>
  	// 게시글 삭제
  	function delCheck(){
  		var ans = confirm("게시글을 삭제하시겠습니까?");
  		if(ans) location.href="${ctp}/notice/noticeDelete?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
  	}
  </script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
				    <h2 style="text-align:center; color: #626262;">
	      <a href="${ctp}/notice/noticeAdmin" style="text-decoration: none;">NOTICE</a>
	    </h2>
	    <br>
	    <p style="text-align:center; color: #626262;">LOUIS VUITTON 공지사항입니다.</p>
	    <p><br></p>
	    <table class="table">
	      <tbody>
		      <tr class="text-center">
		        <th class="con1" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">제목</th>
		        <td class="con2">${vo.title}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">작성자</th>
		        <td class="con2">${vo.name}</td>
		      </tr>
		      <tr>
		        <td colspan="2" align="right" style="color:#818381;">
		          작성일 &nbsp;<span class="bb">${fn:substring(vo.dateNow,0,19)}</span>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="2" style="height:200px;">
		          <br><br>
		          ${fn:replace(vo.content,newLine,'<br/>')}
		          <br><br>
		        </td>
		      </tr>
		      <tr class="text-center">
		        <td class="con2" colspan="2">
		          <br>
		            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/notice/noticeAdmin?pag=${pag}&pageSize=${pageSize}';"/>
		        		<input class="btn btn-outline-warning" type="button" value="수정" onclick="location.href='${ctp}/notice/noticeUpdate?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';"/>
		     				<input class="btn btn-outline-warning" type="button" value="삭제" onclick="delCheck()"/>
		        </td>
		      </tr>
	   		</tbody>
	    </table>
	    <br/>
	    <%-- <c:if test="${sw != 'search'}"> --%>
	    <table class="table">
		  	<tbody>
			  	<tr style="border-bottom: 1px solid #E2E2E2;">
			  		<th class="con1">다음글</th>
			  		<td class="con2" align="left" style="padding-left: 30px;">
			  			<c:if test="${!empty pnVos[1]}">
								<a href="${ctp}/notice/noticeContent?idx=${pnVos[1].idx}&pag=${pag}&pageSize=${pageSize}">${pnVos[1].title}</a><br/>
							</c:if>
			  		</td>
			  	</tr>
			  	<tr>
			  		<th class="con1">이전글</th>
			  		<td class="con2" align="left" style="padding-left: 30px;">
			  			<c:if test="${!empty pnVos[0]}">
								<a href="${ctp}/notice/noticeContent?idx=${pnVos[0].idx}&pag=${pag}&pageSize=${pageSize}">${pnVos[0].title}</a><br/>
							</c:if>
			  		</td>
			  	</tr>
	  		</tbody>
	  	</table>
	  	<%-- </c:if> --%>
 	 </div>
 	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>