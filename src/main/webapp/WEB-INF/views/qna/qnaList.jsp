<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title> QnA 목록 </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    	<link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/main/nav.jsp" />
	<br />
	<br />
	<br />
	<div>
	<c:if test="${sessionScope.memId == null}">
    <div class = "container">
    	<div class = "title">
	       	<br /><br />
	        <h2>QnA List</h2>
	        <p>로그인 후 이용해주세요!</p>
	        <p>
	        	<a href="/member/loginForm">💌 Login 💌</a>
	        </p>
	        <p>
	        	<a href="/member/inputForm">💌 Join 💌</a>
	        </p>
        </div>
      </div>    
   </c:if>
   </div>
	<div class = "container">
		<section class = "blog" id = "blog">
   <c:if test="${sessionScope.memId != null}">
		<c:if test="${count == 0}">
			<div class = "title">
	       		<br /><br />
	        	<p>작성된 글이 없습니다..!!</p>
	        	<p>
	        		<a href="/blog/qnaForm">👀 글쓰기 👀</a>
	        	</p>
        	</div>
		</c:if>
			<c:if test="${count > 0}">
			<div class = "title">
	       		<br /><br />
	        	<p>
	        		<a href="/blog/qnaForm">👀 글쓰기 👀</a>
	        	</p>
        	</div>
			<c:forEach var="article" items="${list}">
		        <div class = "title">
		          <a href="qnaView?num=${article.num}&pageNum=${pageNum}"><h2>${article.title}</h2></a>
		           <div class = "blog-text">
              <span>${article.writer}님</span>
              <h3><p><fmt:formatDate value="${article.reg_date}" type="date" dateStyle="short" /></p></h3>
              <p>조회수 ${article.readcount}</p>
            </div> 	
       		 </div>
			</c:forEach>
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
			</c:if>
		</section>
		</div>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</body>
</html>














