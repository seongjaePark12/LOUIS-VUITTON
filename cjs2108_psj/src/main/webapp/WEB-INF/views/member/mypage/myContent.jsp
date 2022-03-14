<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/menu.css">
	<link rel="stylesheet" href="${ctp}/css/nav.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/userPage.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item"><img src="${ctp}/images/user/마이페이지 로고.png" width="100%"/></a>
				<a href="${ctp}/mypage/myBooking" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left ">나의 방문 예약</a>
		<a href="${ctp}/mypage/myQuestion" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myWish" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 위시리스트</a>
		<a href="${ctp}/mypage/myOrder" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/mypage/myInfor" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">나의계정</a>
		<a href="${ctp}/mypage/myPage" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">My LV에 오신 것을 환영합니다</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/mypage/myPage" class="w3-bar-item w3-button w3-border-bottom">My LV에 오신 것을 환영합니다</a>
		<a href="${ctp}/mypage/myInfor" class="w3-bar-item w3-button w3-border-bottom">나의계정</a>
		<a href="${ctp}/mypage/myOrder" class="w3-bar-item w3-button w3-border-bottom">나의 주문제품</a>
		<a href="${ctp}/mypage/myWish" class="w3-bar-item w3-button w3-border-bottom">나의 위시리스트</a>
		<a href="${ctp}/mypage/myQuestion" class="w3-bar-item w3-button">나의 케어 서비스</a>
		<a href="${ctp}/mypage/myBooking" class="w3-bar-item w3-button">나의 방문 예약</a>
	</div>
  <div class="w3-container" style="margin-top:80px" id="showcase">
		<h2 style="text-align:center; color: #626262;">
      <a href="${ctp}/mypage/myQuestion" style="text-decoration: none;font-size:30pt;">나의 문의 내용</a>
    </h2>
    <br>
    <p style="text-align:center; color: #626262;font-size:15pt;">LOUIS VUITTON Q＆A입니다.</p>
    <p><br/></p>
    <table class="table">
      <tbody>
	      <tr class="text-center">
	        <th class="con1" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">제목</th>
	        <td class="con2">${vo.title}</td>
	      </tr>
	      <tr class="text-center">
	        <th class="con1" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">문의유형</th>
	        <td class="con2">${vo.what}</td>
	      </tr>
	      <tr class="text-center">
	        <th class="con1" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">작성자</th>
	        <td class="con2">${fn:substring(vo.mid,0,3)}**</td>
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
	            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/mypage/myQuestion';"/>
	        </td>
	      </tr>
   		</tbody>
    </table>
	  <!-- 댓글 출력/입력 처리부분 -->
    <!-- 댓글 출력 -->
    <c:forEach var="rVo" items="${rVos}">
	    <table class="table">
		    <tbody>
		    	<tr>
		        <th style="text-align:center; background-image: linear-gradient(120deg, #9C7521, #FFDF73);color:black;">관리자 답변</th>
		        <td>
			        <c:if test="${sMid == rVo.mid}">
			        	<input type="button" value="수정" id="replyUpdateOpen${rVo.idx}" onclick="updateOpen('${rVo.idx}','${pag}','${pageSize}')" class="btn btn-outline-warning btn-sm"/> 
								<input type="button" value="닫기" id="replyUpdateClose${rVo.idx}" onclick="updateClose(${rVo.idx})" class="replyBoxClose btn btn-outline-warning btn-sm" style="display:none;" /> 
					  	</c:if>
							<c:if test="${sMid == rVo.mid}">
							  <a href="javascript:replyDelCheck(${rVo.idx})" class="btn btn-outline-warning btn-sm">삭제</a>
					  	</c:if>
		        </td>
		        <th style="text-align:center;width:15%;">작성일</th>
		        <td style="width:28%;">${rVo.dateNow}</td>
		      </tr>
		      <tr style="border-bottom: 1px solid #EAEAEA; text-align:left;">
		        <td colspan="4">${fn:replace(rVo.content,newLine,'<br/>')}</td>
		      </tr>
		      <tr>
						<td colspan="5"><div id="replyBox${rVo.idx}"></div></td>
					</tr>
		 	 </tbody>
	   </table>
 	 </c:forEach>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>