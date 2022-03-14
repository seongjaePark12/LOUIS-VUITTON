<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>배송정보</title>
</head>
<body>
<div class="container">
  <h2>배송조회</h2>
  <hr/>
  <p>주문자 : ${vo.name}</p>
  <p>연락처 : ${vo.getCode}</p>
  <p>주소 : ${vo.address}</p>
  <p>배송메세지 : ${vo.message}</p>
  <c:if test="${fn:substring(vo.payment,0,1) == 'C'}"><c:set var="payMethod" value="CARD"/></c:if>
  <c:if test="${fn:substring(vo.payment,0,1) == 'B'}"><c:set var="payMethod" value="은행"/></c:if>
  <p>결재수단 : ${payMethod}</p>
  <p>결재은행/카드 : ${fn:substring(vo.payment,1,fn:length(vo.payment))}</p>
  <p>주문번호 : ${vo.orderIdx}</p>
  <hr/>
  <p><input type="button" value="창닫기" onclick="window.close()"/></p>
</div>
</body>
</html>