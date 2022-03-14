<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
	var msg = "${msg}";
	var url = "${ctp}/${url}";

	alert(msg);
	if(url != "")location.href = url;
</script>
</head>
<body>
</body>
</html>