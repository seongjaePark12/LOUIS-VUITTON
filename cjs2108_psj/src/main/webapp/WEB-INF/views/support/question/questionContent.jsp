<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q＆A내용</title>
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
	<script>
  	// 게시글 삭제
  	function delCheck(){
  		var ans = confirm("게시글을 삭제하시겠습니까?");
  		if(ans) location.href="${ctp}/support/questionDelete?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
  	}
  	// 댓글입력
  	function replyCheck(){
  		var questionIdx = "${vo.idx}";
  		var mid = "${sMid}";
  		var hostIp = "${pageContext.request.remoteAddr}";
  		var content = replyForm.content.value;
  		if(content == ""){
  			alert("댓글을 입력하세요");
  			replyForm.content.focus();
  			return false;
  		}
  		var query = {
  				questionIdx : questionIdx,
  				mid : mid,
  				hostIp : hostIp,
  				content : content
  		}
  		$.ajax({
  			type : "post",
  			url : "${ctp}/support/questionReplyInsert",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
	
  	// 답변글(부모댓글의 댓글)
  	function updateOpen(idx,pag,pageSize){
  		var insReply = "";
  		insReply += "<div class='w3-container' id='showcase'>";
  		insReply += "<table style='width:90%'>";
  		insReply += "<tr>";
  		insReply += "<td>";
  		insReply += "<div class='form-group'>";
  		insReply += "<label for='content'>수정폼:</label> &nbsp;";
  		insReply += "<textarea rows='3' class='form-control' name='content' id='content"+idx+"'></textarea>";
  		insReply += "</div>";
  		insReply += "</td>";
  		insReply += "<td>";
  		insReply += "<input type='button' value='수정하기' class='btn btn-outline-warning btn-sm' onclick='replyCheck2("+idx+","+pag+","+pageSize+")'/>";
  		insReply += "</td>";
  		insReply += "</tr>";
  		insReply += "</table>";
  		insReply += "<hr style='margin:0px'/>";
  		insReply += "</div>";
  		
  		$("#replyUpdateOpen"+idx).hide();
  		$("#replyUpdateClose"+idx).show();
  		$("#replyBox"+idx).slideDown(500);
  		$("#replyBox"+idx).html(insReply);
  	}
  	
  	// 대댓글 입력폼 닫기 처리(대댓글에 해당하는 가상 테이블을 보이지 않게 처리한다)
  	function updateClose(idx){
  		$("#replyUpdateOpen"+idx).show();
  		$("#replyUpdateClose"+idx).hide();
  		$("#replyBox"+idx).slideUp(500);
  	}
  	
  	// 수정하기
  	function replyCheck2(idx,pag,pageSize){
  		var boardIdx = "${vo.idx}";
  		var mid = "${sMid}";
  		var hostIp = "${pageContext.request.remoteAddr}";
  		var content = "content"+idx;
  		var contentVal = $("#"+content).val();
  		
  		if(content == ""){
  			alert("댓글을 입력하세요");
  			$("#"+content).focus();
  			return false;
  		}
  		var query = {
  				boardIdx : boardIdx,
  				mid : mid,
  				hostIp : hostIp,
  				content : contentVal,
  		}
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/support/questionReplyInsert2",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
  	
  	// 댓글 삭제하기
  	function replyDelCheck(replyIdx){
  		var ans = confirm("선택하신 댓글을 삭제 하시겠습니까?");
  		if(!ans) return false;
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/support/questionReplyDelete",
  			data : {replyIdx : replyIdx},
  			success:function(){
  				location.reload();
  			},
  			error : function(){
  				alert("전송오류");
  			}
  		});
  	}
  </script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
	<div class="text-center w3-padding-16" style="background-color: rgb(246,245, 243)"><h1 style="color: gray">Q＆A</h1></div>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-margin-left"><i class="fa fa-arrow-left w3-xlarge"></i></a>
		<a href="${ctp}/support/question" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">문의사항</a>
		<a href="${ctp}/support/notice" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">공지사항</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/support/notice" class="w3-bar-item w3-button w3-border-bottom">공지사항</a>
		<a href="${ctp}/support/question" class="w3-bar-item w3-button w3-border-bottom">문의사항</a>
	</div>
  <div class="w3-container" style="margin-top:80px" id="showcase">
		<h2 style="text-align:center; color: #626262;">
      <a href="${ctp}/support/question" style="text-decoration: none;font-size:30pt;">Q＆A</a>
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
	            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/support/question?pag=${pag}&pageSize=${pageSize}';"/>
	      			<c:if test="${sMid == vo.mid}">
	      				<input class="btn btn-outline-warning" type="button" value="수정" onclick="location.href='${ctp}/support/questionUpdate?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';"/>
		     			</c:if>
		     			<c:if test="${sMid == vo.mid || sLevel == 0}">
		     				<input class="btn btn-outline-warning" type="button" value="삭제" onclick="delCheck()"/>
	       			</c:if>
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
		<!-- 댓글 입력 -->
		<c:if test="${sLevel == 0}">
			<form name="replyForm" id="replyForm" method="post" action="${ctp}/userQuestionReplyInput.psj">
				<div class="w3-row-padding">
				  <div class="w3-col m12">
				    <div class="w3-round w3-white">
					    <div class="w3-container w3-padding">
					      <h6 class="w3-opacity"></h6>
					      <textarea rows="4" name="content" id="content" class="form-control"></textarea>
					      <br/>
					      <div>
						      <input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-outline-warning"/>
					   		</div>
					    </div>
					    <input type="hidden" name="questionIdx" value="${vo.idx}"/>
							<input type="hidden" name="mid" value="${sMid}"/>
							<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
							<input type="hidden" name="pag" value="${pag}"/>
							<input type="hidden" name="pagSize" value="${pagSize}"/>
				    </div>
			    </div>
		    </div>
	    </form>
    </c:if>
	</div>
 	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <script src="${ctp}/js/userNav.js"></script>
  <script src="${ctp}/js/menu.js"></script>
  <script src="${ctp}/js/menu2.js"></script>
  <script src="${ctp}/js/menu3.js"></script>
</body>
</html>