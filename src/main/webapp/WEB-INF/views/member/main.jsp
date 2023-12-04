<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
		<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
		<script src="/resources/js/member.js" language="javascript"></script>
	</head>

	<c:if test = "${sessionScope.memId == null}">
		<body>
			<form name="inform" method="post" action="/member/loginPro"  onSubmit="return checkIt();">
				<table width=500 cellpadding="0" cellspacing="0"  align="center" border="1" >
					<tr>
	       				<td width="300" height="20">&nbsp;</td> 
	        			<td width="100" align="right">아이디</td>
	        			<td width="100">  
	            			<input id="aa" class="bb" type="text" name="id" size="15" maxlength="10"></td>
	      			</tr>
      			
	      			<tr> 
	         			<td rowspan="2" width="300" >메인입니다.</td>
	         			<td width="100" align="right">패스워드</td>
	         			<td width="100">
	            			<input type="password" name="pw" size="15" maxlength="10">
	            		</td>
	       			</tr>
       			
       				<tr>
	          			<td colspan="3" align="center">
				            <input type="submit" name="Submit" value="로그인">
				            <input type="button"  value="회원가입" onclick="javascript:window.location='/member/inputForm'"> 
	          			</td>
          			</tr>
				</table>
			</form>
		</c:if>
		
		<c:if test = "${sessionScope.memId != null}">
     		<table width=500 cellpadding="0" cellspacing="0"  align="center" border="1" >
         		<tr>
           			<td width="300" height="20">v</td>
          			<td rowspan="3" align="center">${sessionScope.memId} 님이 <br> 방문하셨습니다
             			<form method="post" action="/member/logout">  
             				<input type="submit"  value="로그아웃">
             				<input type="button" value="내정보" onclick="javascript:window.location='/member/myPage?id=${id}'">
            	 			<input type="button" value="방명록" onclick="javascript:window.location='/guestbook/guestBookForm'">
            	 		</form>
					</td>
				</tr>
				<tr>
         			<td rowspan="2" width="300" >메인입니다.</td>
       			</tr>
			</table>
			<br>
		</c:if>
	</body>
</html>
