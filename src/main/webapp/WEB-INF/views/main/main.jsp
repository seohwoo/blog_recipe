<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <!-- header -->
      <jsp:include page="/WEB-INF/views/main/nav.jsp" />
      <header>
      <jsp:include page="/WEB-INF/views/main/search.jsp" />
      </header>
    <!-- end of header -->
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
  </body>
</html>