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
			<td>작성일</td>
			<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.reg_date}" /></td>
			<td>조회수</td>
			<td>${dto.readcount}</td>
		</tr>
		<tr>
			<td colspan="8">${dto.content}</td>
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
				<td><textarea rows="10" cols="30"></textarea></td>
				<td><input type="submit" value="댓글 등록" /></td>
			</tr>
		</table>
	</form>
	<c:if test="${count != 0}">
	<table>
		<c:forEach var="reply" items="${reply}">
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td>작성자 이름 들어갈 곳</td>
				<td>${reply.content}</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${count == 0}">
		<d>등록된 댓글이 없습니다.</d>
	</c:if>
	<%-- admin이면 삭제 기능 추가 --%>
	<input type="button" value="글삭제" onclick="document.location.href='/notice/delete?num=${dto.num}&pageNum=${pageNum}'">

</body>