
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="text.css" rel="stylesheet" type="text/css">
<style type="text/css">
div#del_win {
	position: absolute;
	top: 380px;
	left: 750px;
	width: 160px;
	height: 70px;
	padding-top: 10px;
	border-radius: 10px;
	border: 1px solid black;
	/* text-align: center; */
	display: none;
	background: #EEEEEE;
}
div#del_win input[type=button]{
		display:inline-block;
		width: 40px;
		height: 25px;
		font-size: 13px;
		font-weight: bold;
		border: 1px solid #dcdcdc;	
		margin-left: 28px;
		margin-top: 5px;
}

div#del_win input[type=password]{width: 80px;}

#viewTable{
		border:none; border-top:2px solid #5E5E5E;
		width: 700px;
		height: 500px;
		margin-top: 40px;
		margin-left: 500px;
		
	}
#viewtitle{font-size: 15px; font-weight: bold;}
#viewtitle,#viewdate{height: 40px;background: #F3F3F3;}
#viewid, #viewhit{height: 40px;}	
#viewupload{height: 40px; background: #F3F3F3;}	
#viewtitle{padding-left: 3px;}	
#viewid{padding-left: 3px; font-size: 15px; font-weight: bold;}
#viewcontent{padding-left: 3px;}
#viewupload{padding-left: 3px; font-size: 15px; font-weight: bold;}
#viewhit{padding-right: 3px;}
#viewdate{padding-right: 3px;}	
#viewtitle,#viewdate{border:none; border-bottom:2px solid #5E5E5E;}
#viewhit,#viewdate{text-align: right;}
#viewcontent{padding-top: 5px;}

#viewid, #viewhit, #viewcontent,#viewupload{
	border:none; border-bottom:2px solid #ddd;
}


#move{
		margin-top: 15px;
		display: inline-block;
		margin-left: 1008px;
		
	}
	
#move2{
		margin-top: 15px;
		display: inline-block;
		padding-left: 93px;
		
		
}

div#move input[type=button],div#move2 input[type=button]{
		
		width: 45px;
		height: 28px;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;	
		
}


</style>
<script type="text/javascript">
	function download(fname){
	
		location.href="FileDownload?dir=upload&filename="+fname;
		//위의 FileDownload는 서블릿이다.
	}
	
	function showDel(){
		var win = document.getElementById("del_win");
		win.style.display = "block";
	}
	
	function cancel(){
		var win = document.getElementById("del_win");
		win.style.display = "none";
	}
	
	function check(){
		var password1 = document.f.password1.value; // 텍스트값
		var password = document.f.password.value; // 유저 비밀번호
		if(password == password1){ // 비교
			document.f.submit(); // 텍스트값과 유저비밀번호값이 맞으면
		}else{ 
			alert("비밀번호를 다시 입력해주세요."); // 맞지않으면
			return;
		}
		
	}
</script>
</head>
<body>
<div id="wrap">
	<jsp:include page="include/header.jsp"></jsp:include>
		<div id="moveView">
			<table id="viewTable">
				<tbody>
					<tr>
						<td id="viewtitle"> 제목</td><td id="viewtitle">${view.title }</td><td id="viewdate">${view.regdate }</td>
					</tr>
					<tr>
						<td id="viewid">${view.id }</td><td id="viewid"></td><td id="viewhit">조회수 ${view.hit }</td>
					</tr>
					<tr>
						<td id="viewcontent">${view.content}</td><td id="viewcontent"></td><td id="viewcontent"></td>
					</tr>

					<tr>
						<td id="viewupload">첨부파일</td><td id="viewupload"><u><a href="javascript:download('${view.uploadFileName}')">${view.uploadFileName}</a></u></td><td id="viewupload"></td>
					</tr>
				</tbody>
			</table>
			<div id="move">
			<c:if test="${vo.id == view.id }">
				<input type="button" value="수정" onClick="javascript:location.href='edit.inc?seq=${vo1.seq}&nowPage=${nowPage }'" style="cursor:pointer"/>
				<input type="button" value="삭제" onclick="showDel()" style="cursor:pointer"/>
				<input type="button" value="답글" onClick="javaScript:location.href='answer.inc?seq=${vo1.seq}&groups=${vo1.groups }&step=${vo1.step }&lev=${vo1.lev }&nowPage=${nowPage }'" style="cursor:pointer"/>
				<input type="button" value="목록" onClick="javaScript:location.href='freeBoard.inc?nowPage=${nowPage}'" style="cursor:pointer"/>
				</c:if>
			</div>
			<c:if test="${vo.id != view.id }">
			<div id="move2">
				<input type="button" value="답글" onClick="javaScript:location.href='answer.inc?seq=${vo1.seq}&groups=${vo1.groups }&step=${vo1.step }&lev=${vo1.lev }&nowPage=${nowPage }'" style="cursor:pointer"/>
				<input type="button" value="목록" onClick="javaScript:location.href='freeBoard.inc?nowPage=${nowPage}'" style="cursor:pointer"/>
			</div>
			</c:if>
		</div>
	</div>

    <div id="del_win">
    	<form action="del.inc" method="post" name="f">
		<label for="password">비밀번호:</label> 
		<input type="password" id="password1" name="password1" size="7" /><br /> 
		<input type="button" value="삭제" onclick="check()"/> 
		<input type="button" value="취소" onclick="cancel()" />
		<input type="hidden" id="id" name="id" value="${view.id }"/>
		<input type="hidden" id="nowPage" name="nowPage" value="${nowPage }"/>
		<input type="hidden" id="seq" name="seq" value="${view.seq }"/>
		<input type="hidden" name="password" value="${vo.password }"/>
		</form>
	</div>
</body>
</html>
