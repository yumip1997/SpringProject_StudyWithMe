<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
<c:set var="error" value="" />
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
		<p>잘못된 요청입니다.</p>    
	</c:if>	
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
		<p>요청하신 페이지를 찾을 수 없습니다.</p>    
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
		<p>요청된 메소드가 허용되지 않습니다.</p>    
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
		<p>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
		<p>서비스를 사용할 수 없습니다.</p>
	</c:if>
</body>
<script type=text/javascript>
var error = ${requestScope['javax.servlet.error.status_code']};
switch(error){
case 400 : 
	alert('잘못된 요청입니다.');
	break;
case 404 :
	alert('요청하신 페이지를 찾을 수 없습니다.');
	break;
case 405 :
	alert('요청된 메서드가 허용되지 않습니다.');
	break;
case 500 :
	alert('서버에 오류가 발생하여 요청을 수행할 수 없습니다.');
	break;
case 503:
	alert('서비스를 사용할 수 없습니다.');
default :
	alert('오류가 발생했습니다.');
}
history.back();
</script>
</html>