<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>이미지게시판</title>
        <link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
    </head>
    <body>  	
		<center>
			<h3>💌글내용 보기💌</h3>
			<form>
				<table>  
				  <tr>
				    <td>작성자</td>
				    <td>글제목</td>
				    <c:if test="${dto.files>0 }">
				    	<td>첨부파일</td>
				    </c:if>
				    <td>글내용</td>
				    <td>조회수</td>
				    <td>별점수</td>
				    <td>좋아요</td>
				    <td>작성일</td>
				  </tr>
				  <tr>
				    <td>${dto.writer}</td>
				    <td>${dto.title}</td>
				  	<c:if test="${dto.files>0 }">
				    	<td>
				    		<c:forEach var="filename" items="${fileList }">
				    			<img src="/resources/file/board/${filename}" width="100px" height="100px"/>
				    		</c:forEach>
				    	</td>
				  	</c:if>
				    <td><pre>${dto.content}</pre></td>
				    <td>${dto.readcount}</td>
				    <td>${formatavgStars}</td>
				    <td>${dto.likes}</td>
				    <td>
					     <fmt:formatDate value="${dto.reg_date}" dateStyle="long" type="both"/> 
					</td>
				  <tr height="30">
				    <td>
						<input type="button" value="글수정" 
						onclick="document.location.href='/img/update?num=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
				    </td>
				    <td>
						<input type="button" value="글삭제" 
						onclick="document.location.href='/img/delete?num=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
					</td>	
				    <td>
						<input type="button" value="댓글쓰기" 
						onclick="document.location.href='/img/write?boardnum=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
					</td>
					<td>
				       <input type="button" value="글목록" 
				       onclick="document.location.href='/img/list?pageNum=${pageNum}'" style="cursor: pointer;">
				    </td>
				    <td>
				       <input type="button" value="👍" 
				       onclick="document.location.href='/img/likes?num=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
				    </td>   
				  </tr>
				</table>
			</form>
			<br />
			<table>
				<c:if test="${check == 0 }">
					<tr>
						<td>댓글이 없습니다...😪😪😪😪</td>
					</tr>
				</c:if>
				<c:if test="${check > 0 }">
					<tr>
						<td>작성자</td>
						<td>내용</td>
						<td>별점</td>
						<td>좋아요</td>
						<td>작성일</td>
						<td></td>
					</tr>
					<c:forEach var="replyDTO" items="${replyList}">
						<tr>
							<td>${replyDTO.writer}</td>
							<td>${replyDTO.content}</td>
							<td>${replyDTO.stars}</td>
							<td>${replyDTO.likes}</td>
							<td><fmt:formatDate value="${replyDTO.reg_date}" dateStyle="long" type="both"/></td>
							<td><button onclick="document.location.href='/img/likes?num=${replyDTO.num}&pageNum=${pageNum}&boardnum=${replyDTO.boardnum}'">👍</button></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</center>     
	</body>
</html>
    	
</html>
