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
	<script src="${ctp}/js/cilckNo.js"></script>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="stylesheet" href="${ctp}/css/notice.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">공지사항</h1></div>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/support/notice" class="btn w3-bar-item w3-margin-left"><i class="fa fa-arrow-left w3-xlarge"></i></a>
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">문의사항</a>
		<a href="${ctp}/support/notice" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">공지사항</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/support/notice" class="w3-bar-item w3-button w3-border-bottom">공지사항</a>
		<a href="${ctp}/support/question" class="w3-bar-item w3-button w3-border-bottom">문의사항</a>
	</div>
  <div class="w3-container" style="margin-top:80px" id="showcase">
		<h2 style="text-align:center; color: #626262;">
      <a href="${ctp}/support/notice" style="text-decoration: none;font-size:30pt;">NOTICE</a>
    </h2>
    <br>
    <p style="text-align:center; color: #626262;font-size:15pt;">LOUIS VUITTON 공지사항입니다.</p>
    <p><br/></p>
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
	            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/support/notice?pag=${pag}&pageSize=${pageSize}';"/>
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
							<a href="${ctp}/support/noticeContent?idx=${pnVos[1].idx}&pag=${pag}&pageSize=${pageSize}">${pnVos[1].title}</a><br/>
						</c:if>
		  		</td>
		  	</tr>
		  	<tr>
		  		<th class="con1">이전글</th>
		  		<td class="con2" align="left" style="padding-left: 30px;">
		  			<c:if test="${!empty pnVos[0]}">
							<a href="${ctp}/support/noticeContent?idx=${pnVos[0].idx}&pag=${pag}&pageSize=${pageSize}">${pnVos[0].title}</a><br/>
						</c:if>
		  		</td>
		  	</tr>
  		</tbody>
  	</table>
  	<%-- </c:if> --%>
 	</div>
 	<br/><br/>
 	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>