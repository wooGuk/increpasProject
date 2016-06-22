
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="text.css" rel="stylesheet" type="text/css">
<style type="text/css">
div#del_win {
	position: absolute;
	top: 150px;
	left: 200px;
	width: 160px;
	height: 70px;
	background-color: #fff;
	padding-top: 10px;
	border-radius: 10px;
	border: 1px solid black;
	text-align: center;
	display: none;
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
	
	
	
</script>
</head>
<body>
<div id="wrap">
	<jsp:include page="include/header.jsp"></jsp:include>
		<div>
			<table width="100%" border="0" cellspacing="1" cellpadding="3">
				<tr>
				  <td width="80" height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">아이디</font></td>
                  <td bgcolor="#F2F7F9">${vo1.id }</td>
				  <td width="80" align="center" bgcolor="#669AB3"><font color="#FFFFFF">등록일</font></td>
				  <td width="150" align="center" bgcolor="#F2F7F9">${vo1.regdate}</td>
				</tr>
				<tr>
				  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">메일</font></td>
				  <td bgcolor="#F2F7F9"></td>
				  <td align="center" bgcolor="#669AB3"><font color="#FFFFFF">조회수</font></td>
				  <td align="center" bgcolor="#F2F7F9">${vo1.hit}</td>
				</tr>
				<tr>
				  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
				  <td colspan="3" bgcolor="#F2F7F9">
				  <a href="javascript:download('${vo1.uploadFileName}')">
				  	${vo1.uploadFileName}
				  </a>
				  </td>
				</tr>
				<tr>
				  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">제목</font></td>
				  <td colspan="3" bgcolor="#F2F7F9">${vo1.title}</td>
				</tr>
				<tr valign="top">
				  <td height="23" colspan="4" bgcolor="#FFFFFF">
					<table width="100%" border="0" cellspacing="0" cellpadding="15">
					  <tr>
						<td valign="top"> <pre>${vo1.content}</pre>
						  <p>&nbsp;</p></td>
					  </tr>
					</table></td>
				</tr>
			  </table>
			</td>
		  </tr>
		</table>
		<table width="556" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
			<td height="20" valign="middle"><img src="/img/sub_it/point_line.gif" width="556" height="3"></td>
		  </tr>
		  <tr>
			<td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td align="left">
					&nbsp;
				  </td>
				  <td width="241" align="right">
				    <img src="img/button/but_answer.gif" width="56" height="21" onClick="javaScript:location.href='answer.inc?seq=${vo1.seq}&groups=${vo1.groups }&step=${vo1.step }&lev=${vo1.lev }&nowPage=${nowPage }'" style="cursor:pointer">
					<img src="img/button/but_list.gif" width="56" height="21" onClick="javaScript:location.href='freeBoard.inc?nowPage=${nowPage}'" style="cursor:pointer">
					
					<c:if test="${vo.id == vo1.id }">
					<img src="img/button/but_modify.gif" width="56" height="21" onClick="javascript:location.href='edit.inc?seq=${vo1.seq}&nowPage=${nowPage }'" style="cursor:pointer">
					<img src="img/button/but_del.gif" width="56" height="21" onclick="showDel()" style="cursor:pointer">
					</c:if>
					</td>
				</tr>
			  </table></td>
		  </tr>
		  <tr>
			<td height="19">&nbsp;</td>
		  </tr>

			  

		</table>
		<iframe id="check_f" border='0' width="0" height="0" frameborder='0' marginwidth='0' marginheight='0' scrolling="no"></iframe>
		</td>
	</tr>
	<tr>
	  <td height="19">&nbsp;</td>
	</tr>
  </table>
    <div id="del_win">
		<label for="passwordd">비밀번호:</label> 
		<input type="password" id="password" size="7" /><br /> 
		<input type="button" value="삭제" onClick="javascript:location.href='del.inc?id=${vo1.id}&nowPage=${nowPage }&password=${vo.password }'" style="cursor:pointer"/>
		<input type="button" value="취소" onclick="cancel()" />
		<input type="hidden" name="password" value="${vo.password }"/>
	</div>
	</div>
	</div>
  </body>
  </html>
