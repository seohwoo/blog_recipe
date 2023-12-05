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
		              			<c:if test="${dto.files>0 }">
									<img src="/resources/file/board/${imgMap.get(dto.num)}" />
								</c:if>
								<c:if test="${dto.files==0 }">
									<img src="/resources/images/1111.jpg" />
								</c:if>
		              		<span>Our & Recipe</span>
		            	</div>
		            </a>
		            <div class = "design-title">
		              ${dto.title }
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
        	
          
          <!-- item -->
          <div class = "design-item">
            <div class = "design-img">
              <img src = "/resources/images/art-design-2.jpg" alt = "">
              <span><i class = "far fa-heart"></i> 22</span>
              <span>Art & Design</span>
            </div>
            <div class = "design-title">
              <a href = "#">make an awesome art portfolio for college or university</a>
            </div>
          </div>
          <!-- end of item -->
          
        </div>
      </div>
    </section>
    <!-- end of design -->
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
    </head>
    <body>
    	<center >
    		<br /><br />
		   	<h2>💌글목록💌</h2>
		   	<br /><br />
	    	<div>
	    		<a href="/img/write?pageNum=${pageNum }">글쓰기</a>
	    		<br />
	    		<br />
			</div>
			<c:if test="${userCnt <= 0 }">
				<table>
					<tr>
				   		<td>
				    		게시판에 저장된 글이 없습니다.
				    	</td>
				    </tr>	
				</table>
			</c:if>
			<c:if test="${userCnt>0 }">
				<table> 
				    <tr> 
				      <td>작성자</td>
				      <td>제   목</td> 
				      <td>이미지</td> 
				      <td>조회수</td> 
				      <td>별점</td> 
				      <td>댓글수</td> 
				      <td>좋아요</td> 
				      <td>작성일</td> 
				    </tr>
					<c:forEach var="dto" items="${userList }">
						   	<tr>
							    <td>${dto.writer}</td>
							    <td><a href="/img/content?num=${dto.num}&pageNum=${pageNum }">${dto.title}</a></td>
							    <td>
									<c:if test="${dto.files>0 }">
										<img src="/resources/file/board/${imgMap.get(dto.num)}" width="100px" height="100px">
									</c:if>
									<c:if test="${dto.files==0 }">
										<img src="/resources/images/1111.jpg" width="100px" height="100px">
									</c:if>
							    </td>
							    <td>${dto.readcount}</td>
							    <td>${starMap.get(dto.num)}</td>
							    <td>${cntMap.get(dto.num)}</td>
							    <td>${dto.likes}</td>
							    <td>
							    	<fmt:formatDate value="${dto.reg_date}" dateStyle="long" type="both"/>
							    </td>
					  		</tr>
					</c:forEach>   
				</table>
			</c:if>
			<br />
			<c:if test="${userCnt>0}">
				<c:if test="${startPage>10}"><a href="/img/list?pageNum=${startPage-10}">[이전]</a></c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/img/list?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}"><a href="/img/list?pageNum=${startPage+10}">[다음]</a></c:if>
			</c:if>
		</center>
	</body>
</html>
-->