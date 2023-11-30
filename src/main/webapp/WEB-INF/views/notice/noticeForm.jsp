<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>공지 작성</title>

</head>
<body>
	<form method="post" enctype="multipart/form-data" name="noticeform" action="/notice/form">
		<table width="800" border="1" cellspacing="0" cellpadding="0"  align="center">
			<tr>
				<td align="right" colspan="2">
					<a href="/notice/list">돌아가기</a>
				</td>
			</tr>
			<tr>
				<td width="100" align="center">제목</td>
				<td width="700"><input type="text" id="title" maxlength="50" /></td>
			</tr>
			<tr>
				<td width="100" align="center">작성자</td>
				<td width="700">admin</td>
			</tr>
			<tr>
				<td width="100" align="center">내용</td>
				<td width="700"><textarea name="content" rows="13" cols="40"></textarea></td>
			</tr>
			<tr>
				<td width="100" align="center">파일 첨부</td>
				<td width="700"><input type="file" name="files"></td>
			</tr>
			<tr>      
 				<td colspan=2 align="center"> 
  					<input type="submit" value="작성완료" >  
  					<input type="reset" value="다시작성">
  				</td>
  			</tr>
		</table>
	</form>


</body>