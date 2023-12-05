<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title> QnA 목록 </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://unpkg.com/mvp.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    	<link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	<body>
	<div>
	<c:if test="${sessionScope.memId == null}">
   <center>
     <table width=500 cellpadding="0" cellspacing="0"  align="center" border="1" >
          <form name="noLogin" method="post" action="/member/loginForm"  >
            <b> 로그인 후 이용해주세요!</b><br />
          <div>
               <input type="submit" value="로그인하기" >
               <input type="button" value="회원가입 하기" OnClick="window.location='/member/inputForm'">      
         </div>
          </form>
         </table>
        </center> 
   </c:if>
   </div>
   <c:if test="${sessionScope.memId != null}">
		<c:if test="${count == 0}">
		  <div class = "container">
		        <div class = "title">	
			<div class = "blog-item">
				작성된 글이 없습니다. 
  				<button class="btn"><input type="button" value="글쓰기" onclick="window.location='/blog/qnaForm'"></button>
			 </div>
		  </div>
		</div>
		</c:if>
			<c:if test="${count > 0}">
			<section class = "blog" id = "blog">
			<div class = "blog-item">
  				<button class="btn"><input type="button" value="글쓰기" onclick="window.location='/blog/qnaForm'"></button>
			</div>
			<c:forEach var="article" items="${list}">
		      <div class = "container">
		        <div class = "title">
		          <a href="qnaView?num=${article.num}&pageNum=${pageNum}"><h2>${article.title}</h2></a>
		           <div class = "blog-text">
              <span>${article.writer}</span>
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
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</body>
</html>














