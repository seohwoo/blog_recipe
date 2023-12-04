<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>방명록</title>
	</head>

	<body>
	<taple>
		<center>
		<tr>
			<td>제목</td>
			<td>내용</td>
		</tr>
		
		<c:forEach var="random" items="${list}">
			<tr>
				<td>${random.content}</td>
				<td>${random.subject}</td>
			</tr>
		</c:forEach>
	</taple>		
	</body>
</html>