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
        			<br /><br />
          			<h2>Search List</h2>
          			<p>Search Value : ${search}</p>
          			<p>Search Value Count : ${result}</p>
        		</div>
		        <div class = "design-content">
		        	<c:if test="${result <= 0 }">
		        		<p>There are no saved articles in the blog</p>
		        	</c:if>
		        	<c:if test="${result > 0 }">
		        		<c:forEach var="dto" items="${searchList }">
				          <!-- item -->
				          <div class = "design-item">
				          	<a href="/img/content?num=${dto.num}">
				            	<div class = "design-img">
				              		<span><i class = "far fa-heart"></i> ${dto.likes }</span>
				              			<c:if test="${dto.files>0 }">
											<img src="/resources/realImage/${imgMap.get(dto.num)}" width="300px" height="400px" />
										</c:if>
										<c:if test="${dto.files==0 }">
											<img src="/resources/images/1111.jpg" width="300px" height="400px" />
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
						            		<c:if test="${i <= starMap.get(dto.num)}">
						            			<i class="fas fa-star" style="color: #ffc83d;"></i>
						            		</c:if>
						            		<c:if test="${i - 0.5 <= starMap.get(dto.num) && i> starMap.get(dto.num)}">
						            			<i class="fas fa-star-half-alt" style="color: #ffc83d;"></i>
						            		</c:if>
						            		<c:if test="${i >= starMap.get(dto.num) && i - 0.5 > starMap.get(dto.num)}">
						            			<i class="far fa-star" style="color: #ffc83d;"></i>
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
				</div>
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</body>
</html>