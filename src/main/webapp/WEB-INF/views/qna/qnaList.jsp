<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<title>QnA 목록 </title>
		<link rel="stylesheet" href="https://unpkg.com/mvp.css">
	</head>
	
	<!-- 로그인 후 이용 가능하게 
	<"${sessionScope.memId == null}">
	<center>
	  <table width=500 cellpadding="0" cellspacing="0"  align="center" border="1" >
	       <form name="noLogin" method="post" action="/member/로그인페이지"  >
				<b> 로그인 후 이용해주세요!
					<input type="submit" value="로그인 하기" >
					<input type="button" value="회원가입 하기" OnClick="window.location='/member/inputForm'">		
	       </form>
	      </table>
	     </center> 	
	< test="${sessionScope.memId != null}"> -->
	<body >
		<center>
			<b>Q&A 목록</b>
			<table width="700">
				<tr>
    				<td align="right" >
    					<a href="/blog/qnaForm">글쓰기</a>
    				</td>
    			</tr>
			</table>
			<c:if test="${count == 0}">
				<table width="700" border="1" cellpadding="0" cellspacing="0">
					<tr>
				    	<td align="center">
				    		작성 된 QnA가 없습니다. 
				    	</td>
				    </tr>
				</table>
			</c:if>
			<c:if test="${count > 0}">
				<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
				    <tr height="30" > 
						<td align="center"  width="50"  >번 호</td> 
						<td align="center"  width="250" >제   목</td> 
						<td align="center"  width="100" >작성자</td>
						<td align="center"  width="150" >작성일</td> 
						<td align="center"  width="50" >조 회</td> 
				    </tr> 
				    <c:forEach var="article" items="${list}">
					    <tr height="30">
					    	<td align="center"  width="50" >${article.num}</td>
					    	<td  width="250" >
					    	<!--  관리자면 앞에 답글 이미지 
					    	<test="${sessionScope.grade == 10}">
					    		 <img src="/resources/file/qna/heart.gif" border="0"  height="16">
							-->
								<a href="qnaView?num=${article.num}&pageNum=${pageNum}">
						           ${article.title}
								</a> 
								<c:if test="${article.files > 0}">
									<img src="/resources/file/qna/chumboo.png" border="0"  height="16">
								</c:if>
							</td>
						    <td align="center"  width="100"> ${article.writer}</td>
						    <td align="center"  width="150"><fmt:formatDate value="${article.reg_date}" type="date" dateStyle="short" /></td>
						    <td align="center"  width="50">${article.readcount}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${count > 0 }">
				<c:if test="${startPage > 10}">
					<a href="/blog/qnaList?pageNum=${startPage-10}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/blog/qnaList?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="/blog/qnaList?pageNum=${startPage+10}">[다음]</a>
				</c:if>
			</c:if>
		</center>
	</body>
</html>














