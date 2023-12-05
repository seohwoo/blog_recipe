<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="/resources/css/tablestyle.css">
</head>
<body>
 <jsp:include page="/WEB-INF/views/main/nav.jsp" />
<br />
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>

<c:if test="${check==10}">
<div class="container">
	<table class="board-table">
		<thead>
		<tr>
			<td align="right"><a href="/notice/form">글쓰기</a></td>
		</tr>
		</thead>
	</table>
</div>
	<br />
</c:if>
	<c:if test="${count == 0}">
	<table class="board-table">
		<thead>
			<tr>
				<td align="center">등록된 공지사항이 없습니다.</td>
			</tr>
		</thead>
	</table>
	</c:if>
	<c:if test="${count > 0 }">
	 <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead align="center">
		<tr>
		 <td>번호</td>
		 <td>제목</td>
		 <td>작성자</td>
		 <td>작성일</td>
		 <td>조회수</td>
		</tr>
		</thead>
		<c:forEach var="notice" items="#{list}">
		<tbody>
			<tr>
				<td>${notice.num}</td>
		 		<td><a href="/notice/content?num=${notice.num}&pageNum=${pageNum}">${notice.title}</a></td>
				<td>${notice.writer}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.reg_date}" /></td>
		 		<td>${notice.readcount}</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	</c:if>
	<br />
	
	<c:if test="${count > 0}">
	 <center><div class="container">
		<c:if test="${startPage > 10}"><a href="/free/list?pageNum=${startPage-10}">[이전]</a></c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/free/list?pageNum=${i}">[${i}]</a>
			</c:forEach>
		<c:if test="${endPage < pageCount}"><a href="/free/list?pageNum=${startPage+10}">[다음]</a></c:if>
		</div></center>
	</c:if>
	<br />

	</div>
</div>
<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>