<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Our.Recipe Blog</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- Font awesome icon -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	
	<body>
	<jsp:include page="/WEB-INF/views/main/nav.jsp" />
		<center>
			<h2>방명록(전체 글:${userCnt})</h2>
			<table width="350">
				<tr>
	    			<td align="right"><a href="/main/main">메인</a></td>
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
					<td>
					
					<a href="/member/myPage?id=${article.writer}">[${article.writer }]</a> : ${article.content } <br />
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
				
				<input type="hidden" name="title" value="방명록">
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