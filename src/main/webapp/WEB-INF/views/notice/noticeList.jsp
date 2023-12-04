<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<head>
	<title>공지 게시판</title>
	<link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
</head>
<body>
<center>

<c:if test="${check==10}">
	<table>
		<tr>
			<td align="right"><a href="/notice/form">글쓰기</a></td>
		</tr>
	</table>
	<br />
</c:if>
	<c:if test="${count == 0}">
	<table>
		<tr>
			<td align="center">등록된 공지사항이 없습니다.</td>
		</tr>
	</table>
	</c:if>
	<c:if test="${count > 0 }">
	<table>
		<tr>
		 <td>번호</td>
		 <td>제목</td>
		 <td>작성자</td>
		 <td>작성일</td>
		 <td>조회수</td>
		</tr>
		<c:forEach var="notice" items="#{list}">
		<c:forEach var="i" step="1" begin="1" end="${listNum}">
			<tr>
				<td>${i}</td>
		 		<td><a href="/notice/content?num=${notice.num}&pageNum=${pageNum}">${notice.title}</a></td>
				<td>${notice.writer}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.reg_date}" /></td>
		 		<td>${notice.readcount}</td>
			</tr>
		</c:forEach>
		</c:forEach>
	</table>
	</c:if>
	<br />
	<c:if test="${count > 0}">
		<c:if test="${startPage > 10}"><a href="/free/list?pageNum=${startPage-10}">[이전]</a></c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/free/list?pageNum=${i}">[${i}]</a>
			</c:forEach>
		<c:if test="${endPage < pageCount}"><a href="/free/list?pageNum=${startPage+10}">[다음]</a></c:if>
	</c:if>
	
</center>
</body>