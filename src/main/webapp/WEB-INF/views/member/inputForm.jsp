<%@ page contentType="text/html; charset=UTF-8"%>

<html>
	<head>
		<title>회원가입</title>
		<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
		<script src="/resources/js/member.js" language="javascript"></script>
	</head>
	
	<body>
		<form method="post" action="/member/inputPro" name="userinput" onSubmit="return inputCheckIt()">
			<table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
				<tr> 
					<td colspan="2" height="39" align="center" >
						<font size="+1" ><b>회원가입</b></font>
					</td>
				</tr>

			    <tr> 
					<td width="200">아이디</td>
					<td width="400"> 
						<input type="text" name="id" size="10" maxlength="12">
						<input type="button" name="confirm_id" value="ID중복확인" 
											OnClick="openConfirmid(this.form)">
					</td>
				</tr>
				
			    <tr> 
					<td width="200">비밀번호</td>
					<td width="400" > 
						<input type="password" name="pw" size="15" maxlength="12">
					</td>
			    </tr>
			    
			    <tr> 
					<td width="200">닉네임</td>
					<td width="400"> 
						<input type="text" name="nic" size="15" maxlength="10">
					</td>
				</tr>
    
				<tr> 
					<td width="200">이름</td>
					<td width="400"> 
						<input type="text" name="name" size="7" maxlength="6">
					</td>
				</tr>

				<tr> 
					<td width="200">생년월일</td>
					<td width="400"> 
						<input type="text" name="birth" size="40" maxlength="30">
					</td>
				</tr>
				
				<tr> 
					<td width="200">성별</td>
					<td width="400"> 
						<input type="text" name="gender" size="60" maxlength="50">
					</td>
				</tr>
				
				<tr> 
					<td width="200">번호</td>
					<td width="400"> 
						<input type="text" name="phone" size="60" maxlength="50">
					</td>
				</tr>
				
				<tr> 
					<td width="200">주소</td>
					<td width="400"> 
						<input type="text" name="address" size="60" maxlength="50">
					</td>
				</tr>
				
				<tr> 
					<td width="200">이메일</td>
					<td width="400"> 
						<input type="text" name="email" size="60" maxlength="50">
					</td>
				</tr>
				
				<tr> 
					<td colspan="2" align="center"> 
						<input type="submit" name="confirm" value="등   록" >
						<input type="reset" name="reset" value="다시입력">
						<input type="button" value="가입안함" onclick="javascript:window.location='/member/main'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
