<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=/img/list?pageNum=${pageNum }" >
</c:if> 
<c:if test="${check!=1 }">
	<script language="JavaScript">      
    	alert("삭제불가..!!🤬🤬🤬");
    	history.go(-1);
	</script>
</c:if>