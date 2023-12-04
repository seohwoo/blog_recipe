<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<c:if test = "${result}">
			<meta http-equiv="Refresh" content="0;url=/member/main" >
		</c:if>

		<c:if test = "${result==false}">
			<script language="JavaScript">
				alert("이미지 파일만 업로드 가능합니다..!!😪😪😪");
		    	history.go(-1);
			</script>
		</c:if>
	</body>
</html>
