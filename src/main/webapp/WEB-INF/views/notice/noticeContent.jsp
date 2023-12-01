<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<head>
	<title>공지 상세</title>
	<link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
</head>
<body>
<center><b></b></center>
	<table id="noticeContent">
		<tr>
			<td>글번호</td>
			<td>${dto.num}</td>
			<td>제목</td>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<td>${dto.content}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<c:forEach var="filelist" items="${filelist}">
			<td>${filelist.filename}</td>
			</c:forEach>
		</tr>
	</table>
	<form id="noticeReply" method="post" action="/content/replyPro">
		<table>
			<tr><td>댓글</td></tr>
			<tr>
				<td><textarea rows="30" cols="60"></textarea></td>
				<td><input type="submit" value="댓글 등록" /></td>
			</tr>
		</table>
	</form>
	<table>
		<c:forEach var="reply" items="${reply}">
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td>${reply.writer}</td>
				<td>${reply.content}</td>
			</tr>
		</c:forEach>
	</table>

</body>