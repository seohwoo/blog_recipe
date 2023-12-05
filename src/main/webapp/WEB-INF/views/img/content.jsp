<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Product Card/Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/resources/css/realcontentstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <script src="/resources/js/realcontentjs.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/main/nav.jsp" />
    <div class = "card-wrapper">
      <div class = "card">
        <!-- card left -->
        <div class = "product-imgs">
          <div class = "img-display">
            <div class = "img-showcase">
            	<c:forEach var="filename" items="${fileList }">
					<img src="/resources/file/board/${filename}" alt = "shoe image"/>
				</c:forEach>
            </div>
          </div>
          <div class = "img-select">
          	<c:forEach var="i" items="${arFile }" >
	            <div class = "img-item">
	              <a data-id = "${arFile[i]+1 }">
	                <img src = "/resources/file/board/${fileList.get(i)}" alt = "shoe image">
	              </a>
	            </div>
            </c:forEach>
          </div>
        </div>
        <!-- card right -->
        <div class = "product-content">
          <h2 class = "product-title">${dto.title }</h2>
          <div class = "product-rating">
            <p>
				<small>
					<c:forEach var="i" items="${arStars }">
						<c:if test="${i <= avgStars}">
							<i class="fas fa-star" style="color: #ffc83d;"></i>
						</c:if>
						<c:if test="${i - 0.5 <= avgStars && i> avgStars}">
							<i class="fas fa-star-half-alt" style="color: #ffc83d;"></i>
						</c:if>
						<c:if test="${i >= avgStars && i - 0.5 > avgStars}">
							<i class="far fa-star" style="color: #ffc83d;"></i>
						</c:if>
					</c:forEach>
					<span>${avgStars} (${replyCnt}) 🔎 (${dto.readcount})</span>
				</small>
			</p>
          </div>
          <div class = "product-detail">
          	<br />
            <h2>${dto.writer }</h2>
            <p>${dto.content }</p>
          </div>
          
          <div class = "purchase-info">
	           <button type = "button" class = "btn" onclick="document.location.href='/img/update?num=${dto.num}&pageNum=${pageNum}'">
	           	수정하기
	           </button>
	           <button type = "button" class = "btn second" onclick="document.location.href='/img/delete?num=${dto.num}&pageNum=${pageNum}'">
	           	삭제하기
	           </button>
	           <button type = "button" class = "btn third" onclick="document.location.href='/img/write?boardnum=${dto.num}&pageNum=${pageNum}'">
	           	댓글쓰기
	           </button>
	           <button type = "button" class = "btn" onclick="document.location.href='/img/list?pageNum=${pageNum}'">
	           	목록으로
	           </button>
          </div>
          <div class = "purchase-info">
            <input type = "number" value = "${dto.likes }" readonly="readonly">
            <button type = "button" class = "btn" onclick="document.location.href='/img/likes?num=${dto.num}&pageNum=${pageNum}'">
              👍
            </button>
          </div>
          <c:if test="${check == 0 }">
          	<div class = "product-detail">
          		<h2>댓글이 없습니다...😪😪</h2>
          	</div>
          </c:if>
          <c:if test="${check > 0 }">
	      	<c:forEach var="replyDTO" items="${replyList}">
	      	  <hr />
	      	  <br />
	          <div class = "product-detail">
	            <h2>${replyDTO.writer }</h2>
	            <p>${replyDTO.content}</p>
	            <div class = "product-rating">
		            <p>
						<small>
							<c:forEach var="i" items="${arStars }">
								<c:if test="${i <= replyDTO.stars}">
									<i class="fas fa-star" style="color: #ffc83d;"></i>
								</c:if>
								<c:if test="${i > replyDTO.stars}">
									<i class="far fa-star" style="color: #ffc83d;"></i>
								</c:if>
							</c:forEach>
							<span>(${replyDTO.stars}) 👍 (${replyDTO.likes})</span><br />
							<span><fmt:formatDate value="${replyDTO.reg_date}" dateStyle="short" type="date"/></span>
						</small>
					</p>
          		</div>
	          </div>
	          <br />
	         </c:forEach> 
          </c:if>
          
          <br />
          <hr />
          <br />
          <div class = "social-links">
            <p>&copy; Blog & Recipes </p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>