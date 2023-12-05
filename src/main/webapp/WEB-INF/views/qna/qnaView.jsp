<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title> QnA 보기</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- Font awesome icon -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	<body >  	
<section class = "about" id = "about">
      <div class = "container">
        <div class = "about-content">
          <div class = "about-text">
            <div class = "title">
              <h2>${article.title}</h2>
              <p>작성자 ${sessionScope.memId}님</p>
              <p>조회수 ${article.readcount}</p>
            </div>
            <div>
	            <c:if test="${fileList!=null}">				
					<c:forEach var="filesDTO" items="${fileList}">
						<img src="/resources/file/qna/${filesDTO.filename}" border="0" width="100" height="250"><br />
					</c:forEach>
				</c:if>
			</div>
			<div class = "title">
            <p>${article.content}</p>
            </div>
          </div>
        </div>
               <div >
	               <a href = "/blog/qnaList?pageNum=${pageNum}"><i class = "fab fa-pinterest" style= "font-size:50px"></i></a>
	               <p>돌아가기</p>   
	             
	               <a href = "/blog/qnaForm?num=${article.num} "><i class = "fab fa-pinterest" style= "font-size:50px"></i></a>
	               <p>답글쓰기</p>     
	               <a href = "/blog/qnaDeleteForm?num=${article.num}&pageNum=${pageNum}"><i class = "fab fa-pinterest" style= "font-size:50px"></i></a>
	               <p>삭제하기</p>
               
               </div>
           </div>
    </section>   
	</body>
</html>      





