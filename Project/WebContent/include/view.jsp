<!-- AJAX 표시를 위한 View 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String msg = (String)request.getAttribute("msg");
	String check = "possible";
	if(msg.equals("소지코인부족") ||msg.equals("1000원이상구매가능")){
		check ="impossible";
	}
%>
<span class="<%=check%>"><%=msg %></span>
