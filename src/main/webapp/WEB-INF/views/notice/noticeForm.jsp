<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>공지 작성</title>
	<link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
</head>
<body>
<center>
	<form method="post" enctype="multipart/form-data" name="noticeform" action="/notice/formPro">
	<input type="hidden" value="${num}" name="boardnum" />
		<table>
			<tr>
				<td align="right">
					<a href="/notice/list">돌아가기</a>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" maxlength="50" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" id="writer" value="admin" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="13" cols="40"></textarea></td>
			</tr>
			<tr>
				<td>파일 첨부</td>
				<td><input type="file" name="files" multiple="multiple"></td>
			</tr>
			<tr>      
 				<td colspan="2"> 
  					<input type="submit" value="작성완료" >  
  				</td>
  			</tr>
		</table>
	</form>
</center>

</body>