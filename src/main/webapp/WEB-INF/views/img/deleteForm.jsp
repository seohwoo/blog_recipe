<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head> 
    <title>Contact us</title>
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="/resources/css/mainstyle.css">
    <link rel="stylesheet" href="/resources/css/formstyle.css">
    <link
      href="https://fonts.googleapis.com/css?family=Quicksand&display=swap"
      rel="stylesheet"
    />
    <meta
      name="viewport"
      content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0"
    />
  </head>
  <body>
    <div class="container">
      <div class="contact-box">
        <div class="left"></div>
        <div class="right">
          <h2>❌ Delete Blog ❌</h2>
          <br/>
          <br/>
          <br/>
          <h2>👀정말 삭제하시겠습니까??👀</h2>
          <form action="/img/deletePro" method="post">
          		<br/>
          		<br/>
          		<br/>
				<input class="field" type="hidden" name="num" value="${num}">
				<input type="hidden" name="pageNum" value="${pageNum}">
			   	<input type="submit" class="btn" value="삭제하기"/>
				<br/>   	
				<br/>   	
				<br/>   	
			</form>
        </div>
      </div>
    </div>
  </body>
</html>