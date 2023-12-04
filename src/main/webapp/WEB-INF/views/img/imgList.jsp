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