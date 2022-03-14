<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<style>
		.pan{
				background: linear-gradient(120deg,#ADA996,#f2f2f2,#dbdbdb,#eaeaea);
		}
	</style>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	    <h1 class="w3-xxxlarge"><b>관리자 페이지</b></h1>
	    <h1 class="w3-large"><b>PSJ</b></h1>
	  </div>
   	<div class="w3-row-padding w3-grayscale">
    	<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-truck w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/adminOrderStatus?startJumun=0001-01-01&endJumun=9999-12-31&orderStatus=결제완료"><font color="red"><b>${newOrder}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>주문 내역</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-arrow-circle-down w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/product/productInput"><font color="red"><b>등록하기</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>상품등록</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-themeisle w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/product/productList"><font color="red"><b>리스트보기</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>상품리스트</h4>
	      </div>
    	</div>
    	<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-bar-chart-o w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/chart"><font color="red"><b>차트</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>판매차트</h4>
	      </div>
    	</div>
		</div>
		<div class="w3-row-padding w3-grayscale">
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-fort-awesome w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/product/categoryMain"><font color="red"><b>대분류 등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>대분류</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-dropbox w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/product/categoryMiddle"><font color="red"><b>중분류 등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>중분류</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-codepen w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/product/categorySub"><font color="red"><b>소분류 등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>소분류</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-chain w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/product/productOption"><font color="red"><b>옵션 등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>소분류</h4>
	      </div>
    	</div>
   	</div>
   	<div class="w3-row-padding w3-grayscale">
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-user w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/memberList?level=4"><font color="red"><b>${newMember}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>새로운 가입자</h4>
	      </div>
	    </div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-comments-o w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/question"><font color="red"><b>${newQuestion}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>새로운 문의</h4>
	      </div>
	    </div>
	    <div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-calendar-check-o w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/booking"><font color="red"><b>${newBooking}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>새로운 예약</h4>
	      </div>
    	</div>
   	</div>
   	<div class="w3-row-padding w3-grayscale">
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-bullhorn w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/notice/noticeInput"><font color="red"><b>공지등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>공지사항</h4>
	      </div>
	    </div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-question-circle-o w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/simpleInput"><font color="red"><b>질문등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>자주하는 질문</h4>
	      </div>
	    </div>
		</div> 
  </div> 
<script src="${ctp}/js/admin.js"></script>
</body>
</html>