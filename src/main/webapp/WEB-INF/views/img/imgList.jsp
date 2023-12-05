<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
  		<!-- design -->
    	<section class = "design" id = "design">
      		<div class = "container">
        		<div class = "title">
          			<h2>Blog List</h2>
          			<p>recent & best recipes on the blog</p>
        		</div>
		        <div class = "design-content">
		        	<c:if test="${userCnt <= 0 }">
		        		<p>There are no saved articles in the blog</p>
		        	</c:if>
		        	<c:if test="${userCnt > 0 }">
		        		<c:forEach var="dto" items="${userList }">
				          <!-- item -->
				          <div class = "design-item">
				          	<a href="/img/content?num=${dto.num}&pageNum=${pageNum }">
				            	<div class = "design-img">
				              		<span><i class = "far fa-heart"></i> ${dto.likes }</span>
				              			<!-- 
				              			<c:if test="${dto.files>0 }">
											<img src="/resources/file/board/${imgMap.get(dto.num)}" width="300px" height="400px" />
										</c:if>
										-->
										<img src="/resources/images/1111.jpg" width="300px" height="400px" />
										<c:if test="${dto.files==0 }">
										</c:if>
				              		<span>${dto.writer }</span>
				            	</div>
				            </a>
				            <div class = "design-title">
				            	<h2>${dto.title }</h2>
				            	<h5><fmt:formatDate value="${dto.reg_date}" dateStyle="short" type="date"/></h5>
				            	<p>
				            		<small>
						            	<c:forEach var="i" items="${arStars }">
						            		<c:if test="${i< starMap.get(dto.num)}">
						            			<i class="fas fa-star" style="color: #ffc83d;"></i>
						            		</c:if>
						            		<c:if test="${i - 0.5 <= starMap.get(dto.num)}">
						            			<i class="fas fa-star" style="color: #ffc83d;"></i>
						            		</c:if>
						            		<c:if test="${i > starMap.get(dto.num)}">
						            			<i class="fas fa-star" style="color: #ffc83d;"></i>
						            		</c:if>
						            	</c:forEach>
						            	${starMap.get(dto.num)} (${cntMap.get(dto.num)}) 🔎 (${dto.readcount})
				            		</small>
				            	</p>
				            </div>
				          </div>
			          </c:forEach>
			          <!-- end of item -->
		        	</c:if>	
        			<br />
					<c:if test="${userCnt>0}">
						<c:if test="${startPage>6}"><a href="/img/list?pageNum=${startPage-6}">[이전]</a></c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="/img/list?pageNum=${i}">[${i}]</a>
						</c:forEach>
						<c:if test="${endPage < pageCnt}"><a href="/img/list?pageNum=${startPage+6}">[다음]</a></c:if>
					</c:if>
				</div>
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</body>
</html>