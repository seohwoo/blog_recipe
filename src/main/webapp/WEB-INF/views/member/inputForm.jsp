<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Our.Recipe Blog</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- Font awesome icon -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/views/main/nav.jsp" />
		<header>
		<div class="container-login">
      	<div class="login-page" style="margin-top: 300px;">
		  <div class="form">
		    <form method="post" action="/member/inputPro" name="userinput" onSubmit="return inputCheckIt()">
		      <div>
			      <input type="text" name="id" size="10" maxlength="12" required="required" placeholder="ID">
				  <input type="button" name="confirm_id" value="ID중복확인" OnClick="openConfirmid(this.form)">
			  </div>
		      <input type="password" name="pw" size="15" maxlength="12" required="required" placeholder="PW">
		      <input type="text" name="nic" size="15" maxlength="10" required="required" placeholder="nickname">
		      <input type="text" name="name" size="7" maxlength="6" required="required" placeholder="name">
		      <input type="text" name="birth" size="40" maxlength="30" required="required" placeholder="birth">
		      <div style="display: flex; margin: 0 10 15px;">
			      <p>남</p><input type="radio" name="gender" size="60" value="남자" required="required" style="margin: 0;">
				  <p>여</p><input type="radio" name="gender" size="60" value="여자" required="required" style="margin: 0;">
			  </div>
			  <input type="text" name="phone" size="60" maxlength="15" required="required" placeholder="phone">
			  <input type="text" name="address" size="60" maxlength="100" required="required" placeholder="address">
		      <button type = "submit" >CREATE</button>
		      <p class="message">이미 계정이 있나요? <a href="/member/loginForm">Login</a></p>
		    </form>
		  </div>
		</div>
      	</div>
		</header>
	</body>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</html>

<script>
function openConfirmid(userinput) {
    // 아이디를 입력했는지 검사
    if (userinput.id.value == "") {
        alert("아이디를 입력하세요");
        return;
    }
    // url과 사용자 입력 id를 조합합니다.
    url = "/member/confirmId?id="+userinput.id.value ;
    
    // 새로운 윈도우를 엽니다.
    open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
</script>
