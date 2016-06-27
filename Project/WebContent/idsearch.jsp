<!-- 	제 목 : idsearch.jsp
	역 할 : ID Search 클릭시 보여지는 팝업창
	로 그 : 1.최초 개발( 아이디값 찾아서 찍어지는거 확인)
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
<style>
	div{
		border: 1px solid red;
		text-align: center;
		margin-top: 60px;
	}

</style>
</head>
<body>

	<div>
		<c:if test="${vo != null }">
		찾으시는 ID는	(${vo.id }) 입니다.
		</c:if>
 
  		<c:if test="${vo == null }">
		유효하지않은 정보입니다.
		</c:if>
	
	</div>
</body>
</html>