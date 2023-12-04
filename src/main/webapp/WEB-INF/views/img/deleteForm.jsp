<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>이미지게시판</title>
        <link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
	</head>
	<body>
		<center>
			<br /><br />
			<b>💌글삭제💌</b>
			<br /><br />
			<form action="/img/deletePro" method="post">
				<h1>❌정말삭제하시겠습니까??❌</h1>
				<input type="hidden" name="num" value=${num }>
				<input type="hidden" name="pageNum" value=${pageNum }>
				<input type="submit" class="btn btn-danger" value="삭제"/>
			</form>
		</center>
	</body>
</html> 