<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지 상세</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="/resources/css/tablestyle.css">
</head>
<body>
 <jsp:include page="/WEB-INF/views/main/nav.jsp" />
<section class="notice"></section>
	  <div id="board-list">
        <div class="container">
            <table class="board-table">
               <tbody>
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
		</tbody>
		</table>
		<table class="board-table">
		<tbody>
		<tr>
			<td colspan="8">${dto.content}</td>
		</tr>
		</tbody>
		<tr>
			<td>첨부파일</td>
			<c:forEach var="filelist" items="${filelist}">
			<td>${filelist.filename}</td>
			</c:forEach>
		</tr>
	</table>
	<form id="noticeReply" method="post" action="/notice/replyPro?num=${dto.num}">
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<table class="board-table">
			
			<thead align="center">
			<tr><td>댓글 작성</td></tr>
			<tr>
				<td>제목</td>
				<td>이름</td>
				<td>내용</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><input type="text" name="title" vaule="공지 댓글" /></td>
				<td><input type="text" name="writer" /></td>
				<td><textarea name="content" rows="1" cols="30"></textarea></td>
				<td><input type="submit" value="댓글 등록" class="btn" /></td>
			</tr>
			</tbody>
		</table>
	</form>
	<c:if test="${count != 0}">
	<table class="board-table">
		
		<thead align="center">
			<tr>
				<td>이름</td>
				<td>내용</td>
				<td>작성일</td>
			</tr>
			</thead>
			<c:forEach var="reply" items="${reply}">
			<tbody>
			<tr>
				<td>${reply.writer}</td>
				<td>${reply.content}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${reply.reg_date}" /></td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${count == 0}">
	<table class="board-table">
		<tbody>
			<tr>
				<td>
					<d>등록된 댓글이 없습니다.</d>
				</td>
			</tr>
		</tbody>
	</table>
	</c:if>
	<c:if test="${check == 10}"> 
	<table class="board-table">
	<tbody>
			<tr>		
		<td><input type="button" class="btn" value="글삭제" onclick="document.location.href='/notice/delete?num=${dto.num}&pageNum=${pageNum}'"></td>
		<td><input type="button" class="btn" value="글수정" onclick="document.location.href='/notice/update?num=${dto.num}&pageNum=${pageNum}'"></td>
		</tr>
	</tbody>
	</table>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>