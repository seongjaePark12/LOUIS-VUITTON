<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="${ctp}/js/cilckNo.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${ctp}/css/login.css">
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script>
		function myFunction() {
			  var x = document.getElementById("pwd");
			  if (x.type === "password") {
			    x.type = "text";
			  } else {
			    x.type = "password";
			  }
			}
		</script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<div class="w3-top" style="background-color: white;">
	<div style="background-color: white;">
		<a href="${ctp}/member/main" class="btn w3-bar-item" style="font-size:20px; font-weight: bold;">LOUIS VUITTON</a>
		| MYLV 로그인
	</div>
</div>
<p><br/><br/></p>
 <div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-5">
          <div id="demo" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner img1">
              <div class="carousel-item active">
                <img src="${ctp}/images/login/5551.jpg" alt="Los Angeles" width="550" height="1000">
                <div class="carousel-caption">
                  <h3>LOUIS VUITTON</h3>
                  <p>NEW 컬렉션을 지금 만나보세요</p>
                </div>   
              </div>
              <div class="carousel-item">
                <img src="${ctp}/images/login/6661.jpg" alt="New York" width="550" height="1000">
                <div class="carousel-caption">
                  <h3>LOUIS VUITTON</h3>
                  <p>NEW 컬렉션을 지금 만나보세요</p>
                </div>   
              </div>
              <div class="carousel-item">
                <img src="${ctp}/images/login/3331.jpg" alt="Chicago" width="550" height="1000">
                <div class="carousel-caption">
                  <h3>LOUIS VUITTON</h3>
                  <p>NEW 컬렉션을 지금 만나보세요</p>
                </div>   
              </div>
              <div class="carousel-item">
                <img src="${ctp}/images/login/4441.jpg" alt="New York" width="550" height="1000">
                <div class="carousel-caption">
                  <h3>LOUIS VUITTON</h3>
                  <p>NEW 컬렉션을 지금 만나보세요</p>
                </div>   
              </div>
            </div>
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          </div>
        </div>
        <div class="col-lg-7 px-5 pt-5 mt-5">
          <div align="center"><img src="${ctp}/images/login/Daco_4575367.png" id="imgimg"></div>
          <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo"> L O G I N</h1>
          <br/><br/>
          <form name="myform" class="needs-validation" method="post" novalidate>
            <div class="col-lg-12">
              <div class="txtb">
                <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력해주세요" value="${mid}" maxlength="20" autofocus required />
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">영문 또는 숫자를 포함하여 6 ~ 20자로 작성해주세요</div>
              </div>
              <div class="txtb ">
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" maxlength="20" required />
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">영문, 숫자, 특수문자를 포함하여 8 ~ 20자로 입력해주세요</div>
              </div>
              <div class="form-group form-check">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="remember" /> 아이디저장 &nbsp;&nbsp;&nbsp;
	            		<input type="checkbox" onclick="myFunction()">비밀번호 표시
                </label>
              </div>
              <div class="col-lg-12" align="center">
                <input type="submit" class="logbtn" onclick="loginCheck()" value="로그인">
              </div>
              <br/><br/>
            </div>
            <br/><br/>
            <div align="center">
              <a href="${ctp}/member/pwdConfirm" style="font-size:16px">비밀번호를 잊으셨나요?</a> 
            </div>
            <div align="center">
              계정이 없으신가요? <a href="${ctp}/member/join" id="jojo">회원가입</a>
            </div>
            <br/>
          </form>
      </div>
    </div>
  </div>
 </div> 
  <script>
  // Disable form submissions if there are invalid fields
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Get the forms we want to add validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  })();
  </script>
</body>
</html>