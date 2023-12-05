<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내정보</title>
		<script src="/resources/js/member.js" language="javascript"></script>
	</head>

	<body>
		<center>
		<h3>${dto.nic}님 페이지</h3>
		<img src="/resources/file/user/${dto.image}" width="200px" height="200px"/> <br />
			
			<c:if test="${sessionScope.memId == dto.id}">
			
			<form action="/member/uploadPro" method="post" enctype="multipart/form-data">
				<input type="file" name="image"/>
				<input type="submit" value="변경하기" />
			</form>
			
			<br />
			
			<table border="1px" style="text-align: center;">
				<tr>
					<td>아이디</td>
					<td>닉네임</td>
					<td>이름</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>번호</td>
					<td>주소</td>
					<td>이메일</td>
					<td>등급</td>
					<td>가입일</td>
				</tr>
				<tr>
					<td>${dto.id}
					<td>${dto.nic}
					<td>${dto.name}
					<td>${dto.birth}
					<td>${dto.gender}
					<td>${dto.phone}
					<td>${dto.address}
					<td>${dto.email}
					<td>${dto.grade}
					<td><fmt:formatDate value="${dto.reg_date}" dateStyle="short" type="date"/></td>
				</tr>
				</c:if>
			</table>
			<p>	
				<a href="/main/main">메인</a>
			</p>
			
			
			<table border="1" width="400">
			<c:forEach var="board" items="${boardList }">
				<td>[${board.writer}] : ${board.content}
				<td><fmt:formatDate value="${board.reg_date}" dateStyle="short" type="date"/>
				<tr>
			</c:forEach>
			</table>
		</center>
	</body>
</html>