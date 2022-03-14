<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-light-grey w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;background: linear-gradient(120deg,#ADA996,#f2f2f2,#dbdbdb,#eaeaea);" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><a href="${ctp}/admin/admin" class="w3-button w3-hover-white"><b>LOUIS VUITTON<br/>관리자</b><br/>PSJ</a></h3>
  </div>
  <div class="w3-bar-block">
    <div class="w3-bar-item w3-text-red">⚜상품 및 주문관리⚜</div> 
    <a href="${ctp}/admin/adminOrderStatus?startJumun=0001-01-01&endJumun=9999-12-31&orderStatus=" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-주문내역</a> 
    <a href="${ctp}/product/productInput" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-상품등록</a> 
    <a href="${ctp}/product/productOption" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-옵션등록</a> 
    <a href="${ctp}/product/categoryMain" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-대분류설정</a> 
    <a href="${ctp}/product/categoryMiddle" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-중분류설정</a> 
    <a href="${ctp}/product/categorySub" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-소분류설정</a> 
    <a href="${ctp}/product/productList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-상품리스트</a> 
    <a href="${ctp}/admin/chart" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-판매차트</a> 
    <div class="w3-bar-item w3-text-red">⚜회원 관리⚜</div> 
    <a href="${ctp}/admin/memberList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-회원관리</a> 
    <a href="${ctp}/admin/question" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-문의사항</a> 
    <a href="${ctp}/admin/booking" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-회원예약</a> 
    <div class="w3-bar-item w3-text-red">⚜게시판 관리⚜</div> 
    <a href="${ctp}/notice/noticeAdmin" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-공지사항</a> 
    <a href="${ctp}/admin/simpleInput" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-자주묻는질문 등록</a> 
    <a href="${ctp}/admin/simpleAdmin" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">-자주묻는질문 삭제</a> 
  </div>
    <h3><a href="${ctp}/" class="w3-button w3-hover-white"><b>홈으로</b></a></h3>
    <h4><a href="${ctp}/member/logout" class="w3-button w3-hover-white">로그아웃</a></h4>
</nav>
<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-light-grey w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-light-grey w3-margin-right" onclick="w3_open()">☰</a>
  <span>LOUIS VUITTON</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>