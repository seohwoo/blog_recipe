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
	<form id="noticeReply" method="post" action="/notice/replyPro?num=${dto.num}">
		
		<table>
			<tr><td>댓글 작성</td></tr>
			<tr>
				<td>제목</td>
				<td>이름</td>
				<td>내용</td>
			</tr>
			<tr>
				<td><input type="text" name="title" vaule="공지 댓글" /></td>
				<td><input type="text" name="writer" /></td>
				<td><textarea name="content" rows="5" cols="30"></textarea></td>
				<td><input type="submit" value="댓글 등록" /></td>
			</tr>
		</table>
	</form>
	<c:if test="${count != 0}">
	<table>
		<c:forEach var="reply" items="${reply}">
			<tr>
				<td>이름</td>
				<td>내용</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>${reply.writer}</td>
				<td>${reply.content}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${reply.reg_date}" /></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${count == 0}">
		<d>등록된 댓글이 없습니다.</d>
	</c:if>
<c:if test="${check == 10}"> 
		<input type="button" value="글삭제" onclick="document.location.href='/notice/delete?num=${dto.num}&pageNum=${pageNum}'">
		<input type="button" value="글수정" onclick="document.location.href='/notice/update?num=${dto.num}&pageNum=${pageNum}'">
	</c:if>
</body>