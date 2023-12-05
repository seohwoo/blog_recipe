<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>QnA 작성하기</title>
	   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <link rel="stylesheet" href="/resources/css/mainstyle.css">
	    <link rel="stylesheet" href="/resources/css/formstyle.css">
	    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet"  />
	    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
  </head>
		<script>
		function writeSave(){
			if(document.qnaForm.title.value==""){
				  alert("제목을 입력하세요!");
				  document.qnaForm.title.focus();
				  return false;
			}
			if(document.qnaForm.content.value==""){
			  alert("내용을 입력하세요!");
			  document.qnaForm.content.focus();
			  return false;
			}
		 }    
		 function displayFileCount() {
		      // 파일 입력 엘리먼트 참조
		      var fileInput = document.getElementById("fileInput");

		      // 선택된 파일의 개수 가져오기
		      var fileCount = fileInput.files.length;
		      var buttonText = "선택된 파일 수: " + fileCount;

		      // 페이지 로딩 시 버튼 텍스트 설정
		      document.addEventListener("DOMContentLoaded", function () {
		        var buttonElement = document.querySelector("button");
		        buttonElement.innerText = buttonText;
		      });
		    }
		</script>
	<body >  
	<center>
	  <body>
	  <form method="post" enctype="multipart/form-data" name="qnaForm" action="/blog/qnaPro" onsubmit="return writeSave()">
    <div class="container">
      <div class="contact-box">
        <div class="left"></div>
        <div class="right">
          <h2>무엇이든 질문하세요!</h2>
          <input type="text" class="field" placeholder="제목" name="title" />
          <input type="text" class="field" placeholder="작성자" name="writer" />
			<c:if test="${num != 0}">
				 <input type="text" size="40" maxlength="50" name="title" value="[답변]">
			</c:if>
          <button class="field btncontroll">
            사진 올리기
            <input type="file" class="btns" multiple="multiple" name="fileList" onchange="displayFileCount()"/>
          </button>
          <textarea placeholder="내용" class="field" name="content" name="fileList"></textarea>
          <button class="btn"><input type="submit" value="글쓰기"></button>
          <button class="btn"><input type="reset" value="다시쓰기"></button>
          <button class="btn"><input type="button" value="목록보기" OnClick="window.location='/blog/qnaList'"></button>
        </div>
      </div>
    </div>
    </form>
  </body>
</html>
		  			
    
