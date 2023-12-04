<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:if test="${check==1}">
	<c:if test="${boardnum==0 }">
		<meta http-equiv="Refresh" content="0;url=/img/content?num=${num}&pageNum=${pageNum}" >
	</c:if>
	<c:if test="${boardnum>0 }">
		<meta http-equiv="Refresh" content="0;url=/img/content?num=${boardnum}&pageNum=${pageNum}" >
	</c:if>
</c:if>
<c:if test="${check!=1 && result!=1}">
	<script language="JavaScript">      
    	alert("오류입니다..!!🤬🤬🤬");
    	history.go(-1);
	</script>
</c:if>
