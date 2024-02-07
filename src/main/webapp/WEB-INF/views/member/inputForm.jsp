<%@ page contentType="text/html; charset=UTF-8"%>

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
		
		<div class="login-form">
		
		
		<form method="post" action="/member/inputPro" name="userinput" onSubmit="return inputCheckIt()">
			<table width="600" border="1" cellspacing="0" cellpadding="3" align="center" bgcolor="#F6F6F6">
				<tr> 
					<td colspan="2" height="39" align="center" >
						<font size="+1" ><b>회원가입</b></font>
					</td>
				</tr>

			    <tr> 
					<td width="200">아이디</td>
					<td width="400"> 
						<input type="text" name="id" size="10" maxlength="12" required="required">
						<input type="button" name="confirm_id" value="ID중복확인" 
											OnClick="openConfirmid(this.form)">
					</td>
				</tr>
				
			    <tr> 
					<td width="200">비밀번호</td>
					<td width="400" > 
						<input type="password" name="pw" size="15" maxlength="12" required="required">
					</td>
			    </tr>
			    
			    <tr> 
					<td width="200">닉네임</td>
					<td width="400"> 
						<input type="text" name="nic" size="15" maxlength="10" required="required">
					</td>
				</tr>
    
				<tr> 
					<td width="200">이름</td>
					<td width="400"> 
						<input type="text" name="name" size="7" maxlength="6" required="required">
					</td>
				</tr>

				<tr> 
					<td width="200">생년월일</td>
					<td width="400"> 
						<input type="text" name="birth" size="40" maxlength="30" required="required">
					</td>
				</tr>
				
				<tr> 
					<td width="200">성별</td>
					<td width="400"> 
						남<input type="radio" name="gender" size="60" value="남자" required="required">
						여<input type="radio" name="gender" size="60" value="여자" required="required">
					</td>
				</tr>
				
				<tr> 
					<td width="200">번호</td>
					<td width="400"> 
						<input type="text" name="phone" size="60" maxlength="15" required="required">
					</td>
				</tr>
				
				<tr> 
					<td width="200">주소</td>
					<td width="400"> 
						<input type="text" name="address" size="60" maxlength="100" required="required">
					</td>
				</tr>
				
				<tr> 
					<td width="200">이메일</td>
					<td width="400"> 
						<input type="email" name="email" size="60" maxlength="30" required="required">
					</td>
				</tr>
				
				<tr> 
					<td colspan="2" align="center"> 
						<input type="submit" name="confirm" value="가입하기" >
						<input type="reset" name="reset" value="다시입력">
						<input type="button" value="가입안함" onclick="javascript:window.location='/member/loginForm'">
					</td>
				</tr>
			</table>
		</form>
		
		
		</div>
		
		
		</header>
		
		
		<style>
			.login-form {
			  position: fixed;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  margin: 0 auto;
			  /* 추가적인 스타일링 원하는 대로 추가 */
			}
		</style>
					
		
	</body>
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
