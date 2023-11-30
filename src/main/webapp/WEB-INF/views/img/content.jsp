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
				    <td>글번호</td>
				    <td>${dto.num}</td>
				    <td>조회수</td>
				    <td>${dto.readcount}</td>
				  </tr>
				  <tr>
				    <td>작성자</td>
				    <td>${dto.writer}</td>
				    <td>작성일</td>
				    <td>
					     <fmt:formatDate value="${dto.reg_date}" dateStyle="short" type="date"/> </td>
				  </tr>
				  <tr>
				    <td>글제목</td>
				    <td>${dto.title}</td>
				  </tr>
				  <c:if test="${dto.files>0 }">
				  	<tr>
				    	<td>첨부파일</td>
				    	<td>
				    		<c:forEach var="file" items="${fileList }">
				    			<img src="/resources/file/board/${file.filename}" width="100px" height="100px"/>
				    		</c:forEach>
				    	</td>
				  	</tr>
				  </c:if>
				  <tr>
				    <td>글내용</td>
				    <td><pre>${dto.content}</pre></td>
				  </tr>
				  <tr height="30">      
				    <td>
						<input type="button" value="글수정" 
						onclick="document.location.href='/free/updateForm?num=${article.num}&pageNum=${pageNum}'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글삭제" 
						onclick="document.location.href='/free/deleteForm?num=${article.num}&pageNum=${pageNum}'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="댓글쓰기" 
						onclick="document.location.href='/free/writeForm?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
						&nbsp;&nbsp;&nbsp;&nbsp;
				       <input type="button" value="글목록" 
				       onclick="document.location.href='/img/list?pageNum=${pageNum}'">
				    </td>
				  </tr>
				</table>
			</form>
			<br />
		</center>     
	</body>
</html>
    	
</html>
