<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
 
	<body>
		<c:forEach var="board" items="${boardList }">
				<h4>${board.writer}</h4>
				<h4>${board.content}</h4>
				<h4><fmt:formatDate value="${board.reg_date}" dateStyle="short" type="date"/></h4>
			</c:forEach>
	</body>
</html>
