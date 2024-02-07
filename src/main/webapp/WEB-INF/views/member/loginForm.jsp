<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Our.Recipe Blog</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- Font awesome icon -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	<body align-items="center" justify-content="center">
		<!-- 
		<jsp:include page="/WEB-INF/views/main/nav.jsp" />
		<header>
		
		<div class="login-form">
		 -->
		
		
      <header>
      <div class="container-login">
      	<div class="login-page" style="margin-top: 300px;">
		  <div class="form">
		    <form name="myform" action="/member/loginPro" method="post" onSubmit="return checkIt()" class="login-form">
		      <input type="text" name="id" placeholder="username"/>
		      <input type="password" name="pw" placeholder="password"/>
		      <button type = "submit" >LOG IN</button>
		      <p class="message">아직 회원이 아니신가요? <a href="/member/inputForm">Create an account</a></p>
		    </form>
		  </div>
		</div>
      </div>
      </header>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
		
		
		
		
		
		
		
		
		
		<!-- 
		<form name="myform" action="/member/loginPro" method="post" onSubmit="return checkIt()">
			<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" bgcolor="#F6F6F6" >
				<tr height="30" align="center">
					<td colspan="2" align="center">
						<STRONG>회원로그인</STRONG>
					</td>
				</tr>
				  
				<tr height="30" align="center">
					<td width="110" align="center">아이디</td>
					<td width="150" align="center">
						<input type="text" name="id" size="15" maxlength="12">
					</td>
				</tr>
				
				<tr height="30" align="center">
					<td width="110" align="center">비밀번호</td>
					<td width="150" align="center">
						<input type=password name="pw"  size="15" maxlength="12">
					</td>
				</tr>
				
				<tr height="30" align="center">
					<td colspan="2" align="center">
						<input type=submit value="로그인"> 
						<input type=reset value="다시입력">
						<input type="button" value="회원가입" onclick="javascript:window.location='/member/inputForm'">
					</td>
				</tr>
			</TABLE>
		</form>
		
		
		</div>
			
		</header>
		
		
		<style>
		    .login-form {
		      display: flex;
		      flex-direction: column;
		      align-items: center;
		      justify-content: center;
		      margin: 0 auto;
		      /* 추가적인 스타일링 원하는 대로 추가 */
		      position: fixed;
		      top: 50%;
		      left: 50%;
		      transform: translate(-50%, -50%);
		    }
		</style>
		 -->
		
			
	</body>
</html>