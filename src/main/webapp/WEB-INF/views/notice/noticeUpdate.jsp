<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지 수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="/resources/css/formstyle.css">
</head>
<body>
 <jsp:include page="/WEB-INF/views/main/nav.jsp" />

<div class="container">
	<form method="post" name="noticeform" action="/notice/updatePro?num=${num}&pageNum=${pageNum}">
		<table>
		  
		  <td class="right"><a href="/notice/list">돌아가기</a></td>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" maxlength="50" value="${dto.title}"  class="field" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="${dto.writer}"  class="field"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="13" cols="40" value="${dto.content}" ></textarea></td>
			</tr>
			<tr>      
 				<td colspan="2"> 
  					<input type="submit" value="작성완료" class="btn" >  
  				</td>
  			</tr>
		</table>
	</form>
</div>
<jsp:include page="/WEB-INF/views/main/footer.jsp" />

</body>