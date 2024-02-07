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
        	
        	<c:if test="${boardnum!=0 }">
	          <h2>💌 Wirte comment 💌</h2>
        	</c:if>
          <form action="/img/writePro?pageNum=${pageNum }" method="post" enctype="multipart/form-data">
           	<c:if test="${sessionScope.memId != null}">
		   		<input type="text"  class="field" name="writer" value="${sessionScope.memId}" readonly="readonly"/>
           	</c:if>
			   	<c:if test="${boardnum==0 }">
			   		<input type="text"  class="field" name="title" placeholder="Title" />
				   	<input type="hidden" name="stars" value="0"/>
			   	</c:if>
			   	<c:if test="${boardnum!=0 }">
				   	<input type="hidden" name="title" value="이미지댓글"/>
				   	<input type="hidden" name="files" value="0"/>
				   	<br />
				   	<h3>👍 STAR 👍</h3>
				   	<div class="stars1">
				        <label for="star1" class="star" data-rating="1"> <i class="far fa-star" style="color: #ffc83d;"></i></label>
				        <label for="star2" class="star" data-rating="2"> <i class="far fa-star" style="color: #ffc83d;"></i></label>
				        <label for="star3" class="star" data-rating="3"> <i class="far fa-star" style="color: #ffc83d;"></i></label>
				        <label for="star4" class="star" data-rating="4"> <i class="far fa-star" style="color: #ffc83d;"></i></label>
				        <label for="star5" class="star" data-rating="5"> <i class="far fa-star" style="color: #ffc83d;"></i></label>
				    </div>
				
				    <div>
				        <input type="radio" name="stars" value="1" id="star1" style="display: none;">
				        <input type="radio" name="stars" value="2" id="star2" style="display: none;">
				        <input type="radio" name="stars" value="3" id="star3" style="display: none;">
				        <input type="radio" name="stars" value="4" id="star4" style="display: none;">
				        <input type="radio" name="stars" value="5" id="star5" style="display: none;">
				    </div>
					<br />
			   		<textarea placeholder="Message" class="field" name="content"></textarea>
				</c:if>
			   	<br />
		   		<input type="hidden" name="boardnum" value="${boardnum }"/>
			   	<input type="submit" class="btn" value="글쓰기"/>
			</form>
        </div>
      </div>
    </div>
  </body>
</html>


<script>
const stars = document.querySelectorAll('.stars1 .star');
const radioButtons = document.querySelectorAll('input[name="stars"]');

radioButtons.forEach((radio, index) => {
    radio.addEventListener('change', () => {
        const starsValue = radio.value;
        for (let i = 0; i < stars.length; i++) {
            const sRating = parseInt(stars[i].getAttribute("data-rating"));
            if (sRating <= starsValue) {
                stars[i].innerHTML = '<i class="fas fa-star" style="color: #ffc83d;"></i>';
            } else {
                stars[i].innerHTML = ' <i class="far fa-star" style="color: #ffc83d;"></i>';
            }
        }
    });
});

function validateAndSubmit() {
    const selectedStars = document.querySelector('input[name="stars"]:checked');
    const reviewTextarea = document.querySelector('textarea[name="review"]');
    if (!selectedStars || reviewTextarea.value.trim() === '') {
        alert("평점과 리뷰를 모두 입력했는지 확인해주세요.");
        return false;
    } else {
        return true;
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
<style>
.stars1 {
    font-size: 30px;
    cursor: pointer;
}
.stars1 .star {
	color: #FFA500;
    transition: color 0.3s;
}
</style>