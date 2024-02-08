<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>블로그작성</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="/resources/css/realcontentstyle.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="/resources/summernote/summernote-lite.js"></script>
		<script src="/resources/summernote/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	    
	    <script>
	
		$(document).ready(function () {
	        $('#summernote').summernote({
	            codeviewFilter: false, // 코드 보기 필터 비활성화
	            codeviewIframeFilter: false, // 코드 보기 iframe 필터 비활성화
	
	            height: 500, // 에디터 높이
	            minHeight: null, // 최소 높이
	            maxHeight: null, // 최대 높이
	            focus: true, // 에디터 로딩 후 포커스 설정
	            lang: 'ko-KR', // 언어 설정 (한국어)
	
	            toolbar: [
	                ['style', ['style']], // 글자 스타일 설정 옵션
	                ['fontsize', ['fontsize']], // 글꼴 크기 설정 옵션
	                ['font', ['bold', 'underline', 'clear']], // 글자 굵게, 밑줄, 포맷 제거 옵션
	                ['color', ['color']], // 글자 색상 설정 옵션
	                ['table', ['table']], // 테이블 삽입 옵션
	                ['para', ['ul', 'ol', 'paragraph']], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
	                ['height', ['height']], // 에디터 높이 조절 옵션
	                ['insert', ['picture', 'link', 'video']], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
	                ['view', ['codeview', 'fullscreen', 'help']], // 코드 보기, 전체 화면, 도움말 옵션
	            ],
	
	            fontSizes: [
	                '8', '9', '10', '11', '12', '14', '16', '18',
	                '20', '22', '24', '28', '30', '36', '50', '72',
	            ], // 글꼴 크기 옵션
	
	            styleTags: [
	                'p',  // 일반 문단 스타일 옵션
	                {
	                    title: 'Blockquote',
	                    tag: 'blockquote',
	                    className: 'blockquote',
	                    value: 'blockquote',
	                },  // 인용구 스타일 옵션
	                'pre',  // 코드 단락 스타일 옵션
	                {
	                    title: 'code_light',
	                    tag: 'pre',
	                    className: 'code_light',
	                    value: 'pre',
	                },  // 밝은 코드 스타일 옵션
	                {
	                    title: 'code_dark',
	                    tag: 'pre',
	                    className: 'code_dark',
	                    value: 'pre',
	                },  // 어두운 코드 스타일 옵션
	                'h1', 'h2', 'h3', 'h4', 'h5', 'h6',  // 제목 스타일 옵션
	            ],
	
	            callbacks: {   //여기 부분이 이미지를 첨부하는 부분
	                onImageUpload : function(files) {   
	                   for(i = 0 ; i < files.length ; i++){
	                      uploadSummernoteImageFile(files[i],this);
	                   }
	                },
	                onPaste: function (e) {
	                   var clipboardData = e.originalEvent.clipboardData;
	                   if (clipboardData && clipboardData.items && clipboardData.items.length) {
	                      var item = clipboardData.items[0];
	                      if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
	                         e.preventDefault();
	                      }
	                   }
	                }
	             }
	           });
	       });
		
		function uploadSummernoteImageFile(file, editor) {
		   data = new FormData();
		   data.append("file", file);
		   $.ajax({
		      data : data,
		      type : "POST",
		      url : "/img/uploadSummernoteImageFile",
		      contentType : false,
		      processData : false,
		      dataType: 'json',
		      success : function(data) {
		         $('#addProduct').append("<input type='hidden' name='fileNames' value='"+data.fileName+"' />");
		         console.log(data.fileName);
		           //항상 업로드된 파일의 url이 있어야 한다.
		         $(editor).summernote('insertImage', data.url);;
		      }
		   });
		}
		
		$("div.note-editable").on('drop',function(e){
		    for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
		       uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
		    }
		   e.preventDefault();
		})
	</script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/main/nav.jsp" />
    	<div class = "card-wrapper" style="display: grid;">
	    	<h2 style="margin-top: 100px;">💌 Create Blog 💌</h2>
        	<form action="/img/editorPro" method="post" enctype="multipart/form-data" id = "addProduct">
	        	<c:if test="${sessionScope.memId != null}">
			   		<input type="text"  class="field" name="writer" value="${sessionScope.memId}" readonly="readonly"/>
	           	</c:if>
				<input type="text"  class="field" name="title" placeholder="Title" />
				<textarea id="summernote" name="content"></textarea>
				<input type="submit" class="btn" value="글쓰기"/>
        	</form>
          	<div class = "social-links">
            	<p>&copy; Blog & Recipes </p>
          	</div>
    	</div>
    	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</body>
</html>