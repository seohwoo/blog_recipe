<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
  	<nav class = "navbar">
        <div class = "container">
          <a href = "/main/main" class = "navbar-brand">Our.Recipe</a>
          <div class = "navbar-nav">
            
            
           
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
            <a></a>
             <c:if test="${sessionScope.memId == null}">
    	        <a></a>
	            <a></a>
            </c:if>
            <a href = "/img/list">Blog</a>
            <a href = "/notice/list">Notice</a>
            
            <c:if test="${sessionScope.memId == null}">
            <a href = "/member/loginForm">Login</a>
            </c:if>
            <c:if test="${sessionScope.memId != null}">
            <a href = "/member/logout">Logout</a>
            <a href = "/member/main">MyPage</a>
            </c:if>
          </div>
        </div>
      </nav>
  </body>
</html>