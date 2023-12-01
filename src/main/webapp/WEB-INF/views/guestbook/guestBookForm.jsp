<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
	<head>
		<title>게시판</title>
		<link rel="stylesheet" href="https://unpkg.com/mvp.css">
	</head>
	
	<body>
		<center>
			<h2>방명록(전체 글:${userCnt})</h2>
			<table width="350">
				<tr>
	    			<td align="right"><a href="/member/main">메인</a></td>
	    		</tr>
			</table>
			
			<c:if test="${userCnt <= 0 }">
				<table width="350" border="1" cellpadding="0" cellspacing="0">
					<tr>
				   		<td align="center">
				    		방명록에 저장된 글이 없습니다.
				    	</td>
				    </tr>	
				</table>
			</c:if>
			<c:if test="${userCnt>0 }">
				<table border="1" width="350" cellpadding="0" cellspacing="0" align="center"> 
				    <tr height="30"> 
				      
				<c:forEach var="article" items="${userList }">
				   <tr height="70">
					<td>[${article.writer }] : ${article.content } <br />
					<fmt:formatDate value="${article.reg_date}" dateStyle="short" type="date" /></td>
				</tr>
				 </c:forEach>   
				</table>
			</c:if>
			
			<br />
			<c:if test="${userCnt>0}">
				<c:if test="${startPage>10}"><a href="/guestbook/guestBookForm?pageNum=${startPage-10}">[이전]</a></c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/guestbook/guestBookForm?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}"><a href="/guestbook/guestBookForm?pageNum=${startPage+10}">[다음]</a></c:if>
			</c:if>
		</center>
		
		<br /><br /><br />
		<form method="post" name="guestBookForm" action="guestBookPro">
			<table border="1" width="350" align="center">
				<tr>
				  	<td  width="70" align="center" >내용</td>
				  	<td  width="330" height="100">
				  		<input type="text" name="content" rows="13" cols="40" maxlength="40" height="70">
				  	</td>
				</tr>
				
				<input type="hidden" name="title" value="타이틀">
				<input type="hidden" name="tablenum" value="30">
				<input type="hidden" name="writer" value="${member.nic}">
				
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="글쓰기" >
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>