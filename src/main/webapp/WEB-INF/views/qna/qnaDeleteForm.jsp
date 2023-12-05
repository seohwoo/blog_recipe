<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>삭제하기</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <link rel="stylesheet" href="/resources/css/mainstyle.css">
	</head>
	<body >
	<center>
     <table width=500 cellpadding="0" cellspacing="0"  align="center" border="1" >
          <form name="" method="post" action="/blog/deletePro"  >
            <b> 삭제하시겠습니까? </b><br />
          <div>
               <input type="submit" value="글삭제" >
               <input type="button" value="목록으로 돌아가기" onclick="document.location.href='/blog/qnaList?pageNum=${pageNum}'">  
         		<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="pageNum" value="${pageNum}">
         </div>
          </form>
         </table>
        </center> 
        </body>
</html>

