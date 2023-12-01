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
	
		<center><h2>방명록</h2></center>
		<table width="350"  border="1" align="center">
			<c:forEach var="list" items="${list }">
				<tr height="50">
					<td>${list.writer } : ${list.content }</td>
					<td width="70"><fmt:formatDate value="${list.reg_date}" dateStyle="short" type="date"/></td>
				</tr>
			</c:forEach>
		</table>
		
		<br /><br /><br /><br /><br />
		<form method="post" name="guestBookForm" action="guestBookPro">
			<table border="1" align="center">
				<tr>
				  	<td  width="70" align="center" >내용</td>
				  	<td  width="330" height="100">
				  		<textarea type="text" name="content" rows="13" cols="40"></textarea>>
				   <!--		<input type="text" name="content" rows="13" cols="40">-->
				  	</td>
				</tr>
				
				<input type="hidden" name="title" value="타이틀">
				<input type="hidden" name="tablenum" value="30">
				<input type="hidden" name="writer" value="${member.nic}">
				
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="방명록쓰기" >
						<input type="button" value="메인" onclick="javascript:window.location='/member/main'">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>
