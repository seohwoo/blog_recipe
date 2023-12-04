<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<center><b>방명록</b></center>
		<table width="400" border=1 align="center">
			
		<c:forEach var="random" items="${list}">
			<tr>
				<td>${dto.id } - ${random.content} - ${random.reg_date}</td>
			</tr>
			
			
		</c:forEach>
		</table>
		
		
		
		
		<br>
		<form method="post" name="writeForm" action="/guestbook/writePro" onsubmit="return writeSave()">
			<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
				<!--  
				<tr>
					<td width="70" align="center"> 제 목</td>
					<td width="330">
						<input type="text" size="40" maxlength="50" name="subject">
				</tr>
				-->
				<tr>
				  	<td  width="70" align="center" >${dto.id }</td>
				  	<td  width="330" >
				   		<input type="text" name="content" rows="13" cols="40"> 
				  	</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="방명록쓰기" >
						<input type="reset" value="다시작성" >
						<input type="button" value="메인" onclick="javascript:window.location='/member/main'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>