<!-- 	제 목 :PWsearch.jsp
	역 할 : PWD Search 클릭시 보여지는 팝업창
	로 그 : 1.최초 개발( 비밀번호값 찾아서 찍어지는거 확인)
					(css수정만 하면됨)
	(박상원 2016/06/14)
			
			 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${vo != null }">
		찾으시는 패스워드는	(${vo.password }) 입니다.
	</c:if>
	
	<c:if test="${vo == null }">
		유효하지 않은 정보입니다.
	</c:if>

</body>
</html>