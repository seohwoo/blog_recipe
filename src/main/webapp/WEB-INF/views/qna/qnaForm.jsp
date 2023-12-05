<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
	<head>
		<title>QnA 작성하기</title>
		<script>
		function writeSave(){
			if(document.qnaForm.title.value==""){
				  alert("제목을 입력하세요!");
				  document.qnaForm.title.focus();
				  return false;
				}
			if(document.qnaForm.writer.value==""){
			  alert("작성자를 입력하세요!");
			  document.qnaForm.writer.focus();
			  return false;
			}
			if(document.qnaForm.content.value==""){
			  alert("내용을 입력하세요!");
			  document.qnaForm.content.focus();
			  return false;
			}
		 }    
		</script>
	</head>
	<body >  
	<center>
		<b> 무엇이든 질문하세요!</b>
		<br />
		<form method="post" enctype="multipart/form-data" name="qnaForm" action="/blog/qnaPro" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="${num}">
			<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	   			<tr>
				    <td align="right" colspan="2" >
					    <a href="/blog/qnaList"> QnA 게시판 가기</a> 
				   </td>
	   			</tr>
	  			<tr>
				    <td  width="70"   align="center" >제 목</td>
				    <td  width="330">
					       <input type="text" size="40" maxlength="50" name="title">
					</td>
				</tr>
					<!-- 관리자이면 제목 입력칸에 답변 표시   
					<if test="${num != 0}">
						   <input type="text" size="40" maxlength="50" name="subject" value="[답변]">
					-->
				<tr>
					<td  width="70"  align="center">작성자</td>
					<td  width="330">
						<input type="text" size="40" maxlength="30" name="writer" >
					</td>
	  			</tr>
	  			
		  			<tr>
						<td  width="70"  align="center"> 파 일</td>
						<td  width="330" id="files">
							<input type="file" size="40" maxlength="30" name="fileList"  multiple="multiple"/>
						</td>
		  			</tr>
				<tr>
					<td  width="70"  align="center" >내 용</td>
					<td  width="330" >
						<textarea name="content" rows="13" cols="40"></textarea> 
					</td>
				</tr>
				<tr>      
	 				<td colspan=2  align="center"> 
						<input type="submit" value="글쓰기" >  
						<input type="reset" value="다시작성">
						<input type="button" value="목록보기" OnClick="window.location='/blog/qnaList'">
					</td>
				</tr>
			</table>       
		</form>      
	</body>
</html>      
    
