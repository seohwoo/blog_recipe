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
          	<c:forEach var="filename" items="${fileList }" >
	            <div class = "img-item">
	              <a href = "#" data-id = "1">
	                <img src = "/resources/file/board/${filename}" alt = "shoe image">
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
					${starMap.get(dto.num)} (${cntMap.get(dto.num)}) 🔎 (${dto.readcount})
				</small>
			</p>
            <span>${avgStars}(${replyCnt})</span>
          </div>
          <div class = "purchase-info">
            <input type = "number" value = "${dto.likes }" readonly="readonly">
            <button type = "button" class = "btn">
              👍
            </button>
          </div>

          <div class = "social-links">
            <p>Share At: </p>
            <a href = "#">
              <i class = "fab fa-facebook-f"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-twitter"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-instagram"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-whatsapp"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-pinterest"></i>
            </a>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    <script src="/resources/js/realcontentjs.js"></script>
  </body>
</html>

<!-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>이미지게시판</title>
        <link rel="stylesheet" href="https://unpkg.com/mvp.css"> 
    </head>
    <body>  	
		<center>
			<h3>💌글내용 보기💌</h3>
			<form>
				<table>  
				  <tr>
				    <td>작성자</td>
				    <td>${dto.writer}</td>
				  </tr>  
				  <tr>
				  	<td>글제목</td>
				    <td>${dto.title}</td>
				  </tr>
				    <c:if test="${dto.files>0 }">
				  		<tr>  	
				    		<td>첨부파일</td>
				    		<td>
				    			<c:forEach var="filename" items="${fileList }">
				    				<img src="/resources/file/board/${filename}" width="100px" height="100px"/>
				    			</c:forEach>
				    		</td>
				    	</tr>	
				    </c:if>
				    <tr>
				    	<td>글내용</td>
				    	<td><pre>${dto.content}</pre></td>
				    </tr>
				    <tr>
				    	<td>조회수</td>
				    	<td>${dto.readcount}</td>
				    </tr>
				    <tr>
				    	<td>별점수</td>
				    	<td>${formatavgStars}</td>
				    </tr>
				    <tr>
				    	<td>좋아요</td>
				    	<td>${dto.likes}</td>
				    </tr>
				    <tr>
					    <td>작성일</td>
				   	 	<td>
					     	<fmt:formatDate value="${dto.reg_date}" dateStyle="long" type="both"/> 
						</td>
				    </tr>
				  <tr height="30">
				    <td>
						<input type="button" value="글수정" 
						onclick="document.location.href='/img/update?num=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
				    </td>
				    <td>
						<input type="button" value="글삭제" 
						onclick="document.location.href='/img/delete?num=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
					</td>	
				    <td>
						<input type="button" value="댓글쓰기" 
						onclick="document.location.href='/img/write?boardnum=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
					</td>
					<td>
				       <input type="button" value="글목록" 
				       onclick="document.location.href='/img/list?pageNum=${pageNum}'" style="cursor: pointer;">
				    </td>
				    <td>
				       <input type="button" value="👍" 
				       onclick="document.location.href='/img/likes?num=${dto.num}&pageNum=${pageNum}'" style="cursor: pointer;">
				    </td>   
				  </tr>
				</table>
			</form>
			<br />
			<table>
				<c:if test="${check == 0 }">
					<tr>
						<td>댓글이 없습니다...😪😪😪😪</td>
					</tr>
				</c:if>
				<c:if test="${check > 0 }">
					<tr>
						<td>작성자</td>
						<td>내용</td>
						<td>별점</td>
						<td>좋아요</td>
						<td>작성일</td>
						<td></td>
					</tr>
					<c:forEach var="replyDTO" items="${replyList}">
						<tr>
							<td>${replyDTO.writer}</td>
							<td>${replyDTO.content}</td>
							<td>${replyDTO.stars}</td>
							<td>${replyDTO.likes}</td>
							<td><fmt:formatDate value="${replyDTO.reg_date}" dateStyle="long" type="both"/></td>
							<td><button onclick="document.location.href='/img/likes?num=${replyDTO.num}&pageNum=${pageNum}&boardnum=${replyDTO.boardnum}'">👍</button></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</center>     
	</body>
</html>
    	
</html>


 -->