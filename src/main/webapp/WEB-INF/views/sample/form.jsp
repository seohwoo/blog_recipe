<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Contact us</title>
    <link href="/resources/css/formstyle.css" rel="stylesheet" type="text/css">
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
          <h2>Contact Us</h2>
          <input type="text" class="field" placeholder="Writer" />
          <input type="text" class="field" placeholder="title" />
          <button class="field btncontroll">
            files
            <input type="file" class="btns" multiple />
          </button>
          <textarea placeholder="Message" class="field"></textarea>
          <button class="btn">Send</button>
        </div>
      </div>
    </div>
  </body>
</html>
