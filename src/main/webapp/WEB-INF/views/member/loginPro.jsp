<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<c:if test = "${check == 1}">
			<c:set var="memId" value = "${memberDTO.id}" scope = "session" />
			<c:redirect url = "/main/main"/>
		</c:if>

		<c:if test = "${check == 0}">
			<script> 
				alert("아이디 / 비밀번호를 확인하세요");
				history.go(-1);
			</script>
		</c:if>
	</body>
</html>