<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<c:if test="${what == 'FAQ'}">
<div class="w3-bar w3-padding-16 w3-large">
	<%-- <a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item">자주하는질문</a> --%>
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">COVID-19안내사항</a>
	<a href="${ctp}/support/simple?what=제품관련" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">제품관련</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">교환및환불</a>
	<a href="${ctp}/support/simple?what=배송관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">배송관리</a>
	<a href="${ctp}/support/simple?what=회원관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">회원관리</a>
	<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">사이트관련</a>
	<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>
</c:if>
<c:if test="${what == '회원관리'}">
<div class="w3-bar w3-padding-16 w3-large">
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">COVID-19안내사항</a>
	<a href="${ctp}/support/simple?what=제품관련" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">제품관련</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">교환및환불</a>
	<a href="${ctp}/support/simple?what=배송관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">배송관리</a>
	<a href="${ctp}/support/simple?what=회원관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left w3-bottombar w3-border-black">회원관리</a>
	<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">사이트관련</a>
	<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>
</c:if>
<c:if test="${what == '배송관리'}">
<div class="w3-bar w3-padding-16 w3-large">
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">COVID-19안내사항</a>
	<a href="${ctp}/support/simple?what=제품관련" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">제품관련</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">교환및환불</a>
	<a href="${ctp}/support/simple?what=배송관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left w3-bottombar w3-border-black">배송관리</a>
	<a href="${ctp}/support/simple?what=회원관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">회원관리</a>
	<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">사이트관련</a>
	<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>
</c:if>
<c:if test="${what == '교환및환불'}">
<div class="w3-bar w3-padding-16 w3-large">
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">COVID-19안내사항</a>
	<a href="${ctp}/support/simple?what=제품관련" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">제품관련</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left w3-bottombar w3-border-black">교환및환불</a>
	<a href="${ctp}/support/simple?what=배송관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">배송관리</a>
	<a href="${ctp}/support/simple?what=회원관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">회원관리</a>
	<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">사이트관련</a>
	<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>
</c:if>
<c:if test="${what == '제품관련'}">
<div class="w3-bar w3-padding-16 w3-large">
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">COVID-19안내사항</a>
	<a href="${ctp}/support/simple?what=제품관련" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left w3-bottombar w3-border-black">제품관련</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">교환및환불</a>
	<a href="${ctp}/support/simple?what=배송관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">배송관리</a>
	<a href="${ctp}/support/simple?what=회원관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">회원관리</a>
	<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">사이트관련</a>
	<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>
</c:if>
<c:if test="${what == 'COVID-19안내사항'}">
<div class="w3-bar w3-padding-16 w3-large">
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-black">COVID-19안내사항</a>
	<a href="${ctp}/support/simple?what=제품관련" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">제품관련</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">교환및환불</a>
	<a href="${ctp}/support/simple?what=배송관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">배송관리</a>
	<a href="${ctp}/support/simple?what=회원관리" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">회원관리</a>
	<a href="${ctp}/support/simple?what=FAQ" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">사이트관련</a>
	<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>
</c:if>

<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
	<a href="${ctp}/support/simple?what=FAQ" class="w3-bar-item w3-button w3-border-bottom">사이트관련</a>
	<a href="${ctp}/support/simple?what=회원관리" class="w3-bar-item w3-button w3-border-bottom">회원관리</a>
	<a href="${ctp}/support/simple?what=배송관리" class="w3-bar-item w3-button w3-border-bottom">배송관리</a>
	<a href="${ctp}/support/simple?what=교환및환불" class="w3-bar-item w3-button w3-border-bottom">교환및환불</a>
	<a href="${ctp}/support/simple?what=제품관련" class="w3-bar-item w3-button w3-border-bottom">제품관련</a>
	<a href="${ctp}/support/simple?what=COVID-19안내사항" class="w3-bar-item w3-button">COVID-19안내사항</a>
</div>