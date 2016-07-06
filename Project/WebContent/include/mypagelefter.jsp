<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function memdel() {
		open("", "pop", "width=350,height=230,top=200,left=500");
		document.delform.action = "delmember.jsp"; // 클릭시 이동하는 페이지 
		document.delform.target = "pop"; // 이 부분이 핵심! 열어놓은 빈 창(pop)을 form2가 날아갈 target으로 정한다.
		document.delform.method = "post"; // post방식으로 보내기~!
		document.delform.submit(); //  
	}
</script>
</head>
<body>
		<div class="fl">
		 	<form name="delform">
			<table id="listgroup">
				<thead>
					<tr>
						<th id="user_edit"> 회 원 관 리 </th>
					</tr>
					</thead>
				<tbody>
					<tr>
						<td id="edituser"><a href="memedit.inc"> 회 원 수 정 > </a></td>
					</tr>
					<tr>
						<td id="edituser"><a href="javascript:memdel()"> 회 원 탈 퇴 > </a></td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
</body>
</html>