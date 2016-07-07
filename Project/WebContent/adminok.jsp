 
<!-- 		제 목 : adminok.jsp
		역 할 :  공지사항게시판 운영자인지 확인하는 jsp파일
		로 그 :  1.프로그램 최초 생성 (박상원 2016/06/22)
			 -> 현재 서버에 운영진 계정을 따로 못만드는 관계로
					팝업창을 보여진 후에 운영진끼리 아는 암호(123)			 	
			 		입력시에만 글쓰기 게시판으로 넘어가짐!
-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운영자 체크 -프로야구 토토 승무패 페이지</title>
<script>
function ok() {
	var password = document.ff.password.value;
	var pwd = document.f.del.value;
	
	var isDel = confirm("입력한 암호가 맞으십니까?");
	 if(isDel){
		 	if(password == pwd){
				
		
		f.submit();
		window.close();
		window.opener.location = "writenotice.inc";
			} else{
				alert("당신은 운영진이아니에요!");
			}
	
	}else{
			
		
	} 
	
}


function cancel() {

	window.close();		
}


</script>
</head>
<body>
	<h1>운영진 전용 암호를 입력해주세요.</h1>
		
		<form id="f" name="f">
			
			
			<label for="del">비밀번호 :</label>
			<input type="text" id="del" name="del"/>
			<input type="button" value="확인" onclick="ok()"/>
			<input type="button" value="취소" onclick="cancel()"/>
			
		</form>
		<!-- 임시로 암호 123 지정 -->
		<form id="ff" name="ff">
		<input type="hidden" name="password" id="password" value="123"/>
		</form>
</body>
</html>