<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<meta charset="UTF-8" />
        <title>이미지게시판</title>
        <link rel="stylesheet" href="https://unpkg.com/mvp.css">
	</head>
	<body>  
		<center>
			<h3>💌글수정💌</h3>
			<br>
			<form method="post" action="/img/updatePro">
				<table>
					<tr>
					  <td>이 름</td>
					  <td>
					    <input type="text" maxlength="10" name="writer" value="${dto.writer}">
					  	<input type="hidden" name="num" value="${dto.num}">
					   	<input type="hidden" name="pageNum" value="${pageNum}">
					  </td>
					</tr>
					<tr>
					  <td>제 목</td>
					  <td>
					     <input type="text" size="40" maxlength="50" name="title" value="${dto.title}"></td>
					</tr>
					<tr>
					  <td>내 용</td>
					  <td>
					  	<textarea name="content" rows="13" cols="40">${dto.content}</textarea>
					  </td>
					</tr>
					<tr>      
					 <td> 
					   <input type="submit" value="글수정" >  
					   <input type="reset" value="다시작성">
					   <input type="button" value="목록보기" 
					     onclick="document.location.href='/img/list.jsp?pageNum=${pageNum}'">
					 </td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>       
