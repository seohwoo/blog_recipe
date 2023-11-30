<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>이미지게시판</title>
        <link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
    </head>
    <body>
    	<center>
    		<br /><br />
		   	<h2>💌게시글작성💌</h2>
		   	<br /><br />
			<form action="/img/writePro?pageNum=${pageNum }" method="post" enctype="multipart/form-data">
		   		<label>작성자</label>
		   		<input type="text" name="writer"/>
			   	<c:if test="${boardnum==0 }">
			   		<label>제목</label>
			   		<input type="text" name="title" />
			   		<label>파일</label>
			   		<input type="file" name="filelist" multiple="multiple" />
			   	</c:if>
			   	<label>내용</label>
			   	<textarea rows="5" cols="60" name="content"></textarea>
			   	<br />
		   		<input type="hidden" name="boardnum" value="${boardnum }"/>
		   		<c:if test="${boardnum!=0 }">
			   		<input type="hidden" name="title" value=""/>
			   		<input type="hidden" name="files" value="0"/>
			   	</c:if>
			   	<input type="submit" value="글쓰기"/>
			</form>
		</center>
    </body>
</html>
