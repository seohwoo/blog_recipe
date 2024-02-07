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
	<div class="login-form">
		<center>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br /> 
			<div class = "container">
        		<div class = "title">
			<h3>방명록(전체 글:${userCnt})</h3>
				</div>
				</div>
			<c:if test="${userCnt <= 0 }">
				<table width="350" border="1" cellpadding="0" cellspacing="0">
					<tr>
				   		<td align="center">
				    		방명록에 저장된 글이 없습니다.
				    	</td>
				    </tr>	
				</table>
			</c:if>
			
			<div class = "banner">
        	<div class = "container">
			<c:if test="${userCnt>0 }">
				<table border="1" width="350" cellpadding="0" cellspacing="0" align="center"> 
				    <tr height="30"> 
				<div class = "design-content">      
				<c:forEach var="article" items="${userList }">
				   <tr height="70">
					<td>
					<i class = "search-input">
					<a href="/member/myPage?id=${article.writer}">[${article.writer }]</a> : ${article.content } <br />
					<fmt:formatDate value="${article.reg_date}" dateStyle="short" type="date" /></td>
					</i>
				</tr>
				 </c:forEach>   
				</table>
			</c:if>
			</div>
			</div>
			
			<c:if test="${userCnt>0}">
				<c:if test="${startPage>10}"><a href="/guestbook/guestBookForm?pageNum=${startPage-10}">[이전]</a></c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/guestbook/guestBookForm?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}"><a href="/guestbook/guestBookForm?pageNum=${startPage+10}">[다음]</a></c:if>
			</c:if>
		</center>
		
		<form method="post" name="guestBookForm" action="guestBookPro">
			<table border="1" width="350" align="center">
				<tr>
					
				  	<td  width="70" align="center" >내용</td>
				  	<td  width="330" height="100">
				  		<input type="text" name="content" class = "search-input" rows="13" cols="40" maxlength="40" height="70">
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
		<style>
		    .login-form {
		      display: flex;
		      flex-direction: column;
		      align-items: center;
		      justify-content: center;
		      margin: 0 auto;
		      /* 추가적인 스타일링 원하는 대로 추가 */
		      position: fixed;
		      top: 50%;
		      left: 50%;
		      transform: translate(-50%, -50%);
		    }
		</style>
		
		<style>
				body {
  font-family: "Lato", sans-serif;
  font-size: 14px;
  line-height: 1.5;
  color: #333;
  background-color: #f5f5f5;
}

/* 제목 스타일 */

.title h3 {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

/* 내용 스타일 */

.design-content {
  padding: 10px;
  border: 1px solid #ccc;
}

/* 페이징 버튼 스타일 */

.btn {
  border-radius: 5px;
  background-color: #ccc;
  color: #333;
  padding: 5px 10px;
}

.btn:hover {
  background-color: #bbb;
}

/* 반응형 디자인 */

@media (max-width: 768px) {
  .login-form {
    width: 100%;
  }
}
		
		</style>
		
		
	</body>
</html>