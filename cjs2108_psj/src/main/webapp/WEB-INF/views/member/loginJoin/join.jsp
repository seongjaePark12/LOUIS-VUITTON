<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String sToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script src="${ctp}/js/cilckNo.js"></script>
<script src="${ctp}/js/join.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${ctp}/css/join.css">
<link rel="stylesheet" href="${ctp}/css/font.css">
<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
<link rel="icon" href="${ctp}/images/title.ico">
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="container" id="container">
    <div class="bg-white" style=" text-align: center; width: 100%">
			<form name="myform"  style="display: inline-block; border: none;" method="post" class="was-validated bg-white" >
	      <br><br>
	      <h1 class="font-weight-bold" ><a href="${ctp}/member/join" id="jojo">REGISTRATION</a></h1><br/>
	      <br/>
	        <div>
	          <label for="mid"><b>아이디</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="text" class="form-control" name="mid" id="mid" onkeyup="idReset()" placeholder="아이디를 입력해주세요" min="4" maxlength="20" autofocus required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback"  style="text-align: left;">아이디는 영문 또는 숫자를 포함하여 4 ~ 20자로 작성해주세요</div>
	        </div>
	        <div class="text-left" style="padding-top: 3px; padding-right: 3px;">
	          <input type="button" class="bubu" name="btnIdCheck" value="중복체크" onclick="idCheck()" />
	        </div>
	        <br/>
	        <div>
	          <label for="pwd"><b>비밀번호</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" min="4" maxlength="20" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">비밀번호는 영문, 숫자, 특수문자를 포함하여 6 ~ 20자로 작성해주세요</div>
	        </div>
	       	<br/>
	        <div style="padding-top: 6px;">
	          <label for="pwdTest"><b>비밀번호 확인</b><font size="2px" color="#AF4034"> *</font></label>
	        </div> 
	        <div>
	          <input type="password" class="form-control" name="pwdTest" id="pwdTest" placeholder="비밀번호를 확인해주세요" min="8" maxlength="20" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">입력하신 비밀번호와 일치하게 입력해주세요</div>
	       	</div>
	        <br/>
	        <div>
	          <label for="name"><b>이름</b><font size="2px" color="#AF4034"> *</font></label>
	        </div>   
	        <div>
	          <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" min="1" maxlength="20" required />
	        </div>
	        <br/>
	        <div>
            <label for="birth"><b>생년월일</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	          <input type="date" name="birth" id="birth" value="<%=sToday %>" class="form-control"/>
	        </div>
	        <br/>
	         <div>
	          <label for="email"><b>이메일</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="text" class="form-control" name="email" id="email" onkeyup="emailReset()" placeholder="예) name@example.com" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">이메일은 비밀번호 찾기에 사용됩니다</div>
	        </div>
	        <div class="text-left" style="padding-top: 3px; padding-right: 3px;">
	          <input type="button" class="bubu" name="btnIdCheck" value="중복체크" onclick="emailCheck()" />
	        </div>
	        <br/>
	        <div>
	          <label for="getCode"><b>휴대 전화</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div class="input-group mb-3">
	          <input class="form-control" type="text" name="getCode1" id="getCode1" required  min="2" maxlength="3" />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode2" id="getCode2" required  min="2" maxlength="4" />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode3" id="getCode3" required  min="3" maxlength="4" />
	        </div>
	        <br/>
	        <div>
	          <label for="address"><b>주소</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	        	<input type="hidden" class="form-control" name="address"/>
	          <input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호" readonly />
	          <input type="button" class="bubu" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
	          <br/>
	        </div>
	        <div> 
	          <input type="text" name="sample6_address" id="sample6_address" placeholder="도로명주소" readonly />
	          <input type="text"  name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목" readonly>
	        </div>   
	        <div>
	        <input type="text" name ="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소" />
	        </div>
	        <br/>
	        <div>
	          <label for="infoopen"><b>이메일 수신</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="radio" name="emailInfor" value="Y" checked >수신
	          <input type="radio" name="emailInfor" value="N">비수신 <br/><br/>
	        </div>
	        <br/>
	        <div>
	          <input style="text-align:center;" type="button" id="joinbtn" value="가입하기" onclick="joinCheck()">
	        </div>
	        <br/>
	        <div>
	          <a href="${ctp}/member/main"><input type="button" value="메인화면"></a>
	        </div>
 					<input type="hidden" name="getCode"/>
			</form>
    </div> 
  </div> 
</body>
</html>