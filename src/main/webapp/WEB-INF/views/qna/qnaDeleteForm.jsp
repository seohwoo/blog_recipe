<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 관리자 체크 
	c:if test="${sessionScope.grade == 10}" -->
<html>
	<head>
		<title>삭제하기</title>
			<link rel="stylesheet" href="https://unpkg.com/mvp.css">
	</head>
	<body bgcolor="${bodyback_c}">
	<center><b>글삭제</b>
	<br>
		<form method="POST" name="qnaDeleteForm"  action="/blog/qnaDeletePro"> 
			<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
				<tr height="30">
					<td align=center > 삭제하시겠습니까?   
						<input type="submit" value="글삭제" >
						<input type="button" value="글목록" onclick="document.location.href='/blog/qnaList?pageNum=${pageNum}'"> 
						<input type="hidden" name="num" value="${num}">
						<input type="hidden" name="pageNum" value="${pageNum}">
					</td>
				</tr>
			</table> 
		</form>
	</body>
