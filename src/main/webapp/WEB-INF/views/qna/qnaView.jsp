<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<title>QnA 보기</title>
		<link rel="stylesheet" href="https://unpkg.com/mvp.css">
	</head>
	<body >  
	<center>
		<b>QnA</b>
		<br />
			<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">  
				<tr height="30">
					<td align="center" width="125" >글번호</td>
					<td align="center" width="125" align="center">${article.num}</td>
					<td align="center" width="125" >조회수</td>
					<td align="center" width="125" align="center">${article.readcount}</td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >작성자</td>
					<td align="center" width="125" align="center">${article.writer}</td>
					<td align="center" width="125" >작성일</td>
					<td align="center" width="125" align="center"><fmt:formatDate value="${article.reg_date}" type="date" dateStyle="short" /></td>
				</tr>
		 		<tr height="30">
					<td align="center" width="125" >글제목</td>
					<td align="center" width="375" align="center" colspan="3">${article.title}</td>
				</tr>
				
				<c:if test="${fileList!=null}">
					<tr height="30">
						<td align="center" width="125" >첨부파일</td>
						<td align="center" width="375" align="center" colspan="3">
						<c:forEach var="filesDTO" items="${fileList}">
						 	<img src="/resources/file/qna/${filesDTO.filename}" border="0"  height="16">   
						</c:forEach>
						</td>
					</tr>
				</c:if>
				
				<tr>
					<td align="center" width="125">글내용</td>
					<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
		 		</tr>
				<tr height="30">      
					<td colspan="4"  align="right" > 
					<!--  관리자만 삭제, 답글 가능하게 
					<c:if test="${sessionScope.grade == 10}">
						<input type="button" value="글삭제" 
						onclick="document.location.href='/blog/qnaDeleteForm?num=${article.num}&pageNum=${pageNum}'">
						&nbsp;&nbsp;&nbsp;&nbsp;=
						<input type="button" value="답글쓰기"
						onclick="document.location.href='/blog/qnaForm?num=${article.num}}'">
						&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if> -->
						<input type="button" value="글목록"  onclick="document.location.href='/blog/qnaList?pageNum=${pageNum}'">
					</td>
		 		</tr>
		 	</table>    
		<br />    
	</body>
</html>      





