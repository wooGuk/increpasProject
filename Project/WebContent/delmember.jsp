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
#f {
	text-align: center;
}

#memdel {
	color: #191919;
}

#aa {
	float: left;
	width: 100px;
	text-align: right; font-size : 13px;
	font-size: 13px;
	margin-top: 3px;
	font-weight: bold;
}

.tt3 {
	font-size: 11px;
	font-weight: bold;
	color: green
}

#delbtn input[type=button]{
		width: 58px;
		height: 23px;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;		
	}
	
	#delbtn{
		margin-top: 5px;
		margin-left: 50px;
		display: inline-block;
		padding-right: 20px;
	}
</style>
</head>
<body>
		<h3 id="memdel">회 원 탈 퇴</h3>
		<hr noshade color="#7CCE76">
		<fieldset>
		<form id="f" name="f">
		<table>
			<tr>
				<td id="aa">아이디 : </td><td>${vo.id }</td>
			</tr>
			<tr>
				<td id="aa">비밀번호 : </td><td><input type="text" id="del" name="del"/></td>
			</tr>
		</table>
		<div id="delbtn">
			<input type="button" value="탈퇴" onclick="memdel()"/>
			<input type="button" value="취소" onclick="cancel()"/>
		</div>	
		</form>
		</fieldset>
		<form id="ff" name="ff">
		<dd width="50%">
				<img src="img/sp.gif">&nbsp;<label class="tt3">탈퇴시 비밀번호가 필요합니다!</label>
			</dd>
		<input type="hidden" name="password" id="password" value="${vo.password }"/>
		</form>
</body>
</html>