<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>이미지게시판</title>
        <link rel="stylesheet" href="https://unpkg.com/mvp.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> 
    </head>
    <body>
    	<center>
    		<br /><br />
		   	<h2>💌게시글작성💌</h2>
		   	<br /><br />
			<form action="/img/writePro?pageNum=${pageNum }" method="post" enctype="multipart/form-data">
		   		<label>작성자</label>
		   		<input type="text" name="writer"/>
			   	<c:if test="${boardnum==0 }">
			   		<label>제목</label>
			   		<input type="text" name="title" />
			   		<label>파일</label>
			   		<input type="file" name="filelist" multiple="multiple" />
				   	<input type="hidden" name="stars" value="0"/>
			   	</c:if>
			   	<c:if test="${boardnum!=0 }">
				   	<input type="hidden" name="title" value="이미지댓글"/>
				   	<input type="hidden" name="files" value="0"/>
				   	<br />
				   	<label>별점</label>
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
				</c:if>
			   	<label>내용</label>
			   	<textarea rows="5" cols="60" name="content"></textarea>
			   	<br />
		   		<input type="hidden" name="boardnum" value="${boardnum }"/>
			   	<input type="submit" value="글쓰기"/>
			</form>
		</center>
    </body>
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
</script>
<style>
.stars1 {
    padding-left: 70px;
    font-size: 30px;
    cursor: pointer;
}
.stars1 .star {
	color: #FFA500;
    transition: color 0.3s;
}
</style>
</html>
