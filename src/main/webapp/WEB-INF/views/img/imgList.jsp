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
				      <td>번 호</td> 
				      <td>이미지</td> 
				      <td>제   목</td> 
				      <td>작성자</td>
				      <td>작성일</td> 
				      <td>조 회</td> 
				    </tr>
					<c:forEach var="dto" items="${userList }">
						   	<tr>
							
						    	<td>${dto.num}</td>
							    <td>
									<c:if test="${dto.files>0 }">
										<img src="/resources/file/board/${imgMap.get(dto.num).filename}" width="100px" height="100px">
									</c:if>
									<c:if test="${dto.files==0 }">
										<img src="/resources/images/1111.jpg" border="0"  height="16" style="margin-top: 5px;">
									</c:if>
							    </td>
							    <td><a href="/img/content?num=${dto.num}&pageNum=${pageNum }">${dto.title}</a></td>
							    <td>${dto.writer}</td>
							    <td>
							    	<fmt:formatDate value="${dto.reg_date}" dateStyle="short" type="date"/>
							    </td>
							    <td>${dto.readcount}</td>
					  		</tr>
					</c:forEach>   
				</table>
			</c:if>
			<br />
			<c:if test="${userCnt>0}">
				<c:if test="${startPage>10}"><a href="/free/list?pageNum=${startPage-10}">[이전]</a></c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/free/list?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}"><a href="/free/list?pageNum=${startPage+10}">[다음]</a></c:if>
			</c:if>
		</center>
	</body>
</html>