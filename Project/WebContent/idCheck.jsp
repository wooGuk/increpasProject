<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${chk == '0' }">
		<div class="success">사용가능</div>
</c:if>
<c:if test="${chk != '0' }">
		<div class="fail">사용불가</div>
</c:if>
