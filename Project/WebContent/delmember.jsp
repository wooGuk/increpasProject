<!-- 	제 목 : delmember.jsp
	
	역 할 : mypageheader.jsp 에서 회원탈퇴 클릭시 보여지는 팝업창
	        
	로 그 : 1.최초 개발( 테이블에서 계정 삭제되는것까지 확인)
					(css수정만 하면됨)
	(박상원 2016/06/21)
			
			 -->
<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
		
%> 
<script type="text/javascript">

	function memdel() {
		var password = document.ff.password.value;
		var pwd = document.f.del.value;
		
		var isDel = confirm("정말로 탈퇴하시겠습니까?");
		 if(isDel){
			 	if(password == pwd){
					
			f.action = "memdel.inc";
			f.submit();
			window.close();
				window.opener.location = "main.inc";
				} else{
					alert("탈퇴할거면 비번제대로 치세요..");
				}
		
		}else{
				
			alert("잘 생각했어요 ^^");
		} 
		
	}
	
	
	function cancel() {
		alert("돈 많이 따세요");
		window.close();
		
		
	}
	
</script>
<style>
	#f{
		text-align: center;
	}
</style>
</head>
<body>

		<h1>계정 탈퇴를 위해 가입시 입력한 암호를 입력해주시오.</h1>
		
		<form id="f" name="f">
			<label for="id">아이디 : </label>${vo.id }
			<br/>
			<label for="del">비밀번호 :</label>
			<input type="text" id="del" name="del"/>
			<input type="button" value="탈퇴ㅠㅠ" onclick="memdel()"/>
			<input type="button" value="취소^^" onclick="cancel()"/>
			
		</form>
		<form id="ff" name="ff">
		<input type="hidden" name="password" id="password" value="${vo.password }"/>
		</form>
</body>
</html>