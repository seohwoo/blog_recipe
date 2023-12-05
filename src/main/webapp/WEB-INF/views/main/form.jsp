<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
  <script>
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

  <body>
    <div class="container">
      <div class="contact-box">
        <div class="left"></div>
        <div class="right">
          <h2>Contact Us</h2>
          <input type="text" class="field" placeholder="Writer" />
          <input type="text" class="field" placeholder="title" />
          <button class="field btncontroll">
            files
            <input
              type="file"
              class="btns"
              multiple
              onchange="displayFileCount()"
            />
          </button>
          <textarea placeholder="Message" class="field"></textarea>
          <button class="btn">Send</button>
        </div>
      </div>
    </div>
  </body>
</html>
