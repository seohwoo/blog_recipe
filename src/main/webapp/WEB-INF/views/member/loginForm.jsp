<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body onload="begin()">
		<form name="myform" action="/member/loginPro" method="post" onSubmit="return checkIt()">
			<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
				<tr height="30">
					<td colspan="2" align="middle">
						<STRONG>회원로그인</STRONG>
					</td>
				</tr>
				  
				<tr height="30">
					<td width="110" align=center>아이디</td>
					<td width="150" align=center>
						<input type="text" name="id" size="15" maxlength="12">
					</td>
				</tr>
				
				<tr height="30">
					<td width="110" align=center>비밀번호</td>
					<td width="150" align=center>
						<input type=password name="pw"  size="15" maxlength="12">
					</td>
				</tr>
				
				<tr height="30">
					<td colspan="2" align="middle">
						<input type=submit value="로그인"> 
						<input type=reset value="다시입력">
						<input type="button" value="회원가입" onclick="javascript:window.location='/member/inputForm'">
					</td>
				</tr>
			</TABLE>
		</form>		
	</body>
</html>
