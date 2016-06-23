<%-- 
    제 목 : notiView.jsp
		역 할 : 공지사항 게시글 보는 jsp
		로 그 :  1.프로그램 최초 생성 (박상원 2016/06/23)
		2./noticeview.inc 컨트롤러에서 세션값저장을
			session.setAttribute("no", no); 
			 
			 vo-> no 로 변경하여 notiView.jsp에도 수정
--%>

<%@page import="mybatis.vo.MemberVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
	
	function delnoti(){
		if(document.f.pwd.value == document.ff.password.value){
			
		/* location.href="delnotice.inc"; */
		document.f.submit();
		}else{
			alert("비밀번호가 틀립니다.");
			
		}
		
	}
	
</script>
</head>
<body>
	
<table width="556" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		    <td align="center" style="font-size: 18px;"><u><b>공지사항</b><u>
		    <br/><br/>
		    </td>
		  </tr>
		  <tr>
			<td height="2" bgcolor="#C3C3C3"></td>
		  </tr>
		  <br/><br/><br/><br/><br/>
		  <tr>
			<td valign="top" bgcolor="#E5E5E5">
			<table width="100%" border="0" cellspacing="1" cellpadding="3">
				<tr>
				  <td width="80" height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">글쓴이</font></td>
                  <td bgcolor="#F2F7F9">Admin</td>
				  <td width="80" align="center" bgcolor="#669AB3"><font color="#FFFFFF">등록일</font></td>
				  <td width="150" align="center" bgcolor="#F2F7F9">${no.regdate}</td>
				</tr>
				<tr>
				  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">메일</font></td>
				  <td bgcolor="#F2F7F9"></td>
				  <td align="center" bgcolor="#669AB3"><font color="#FFFFFF">조회수</font></td>
				  <td align="center" bgcolor="#F2F7F9">${no.hit}</td>
				</tr>
				<tr>
				  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
				  <td colspan="3" bgcolor="#F2F7F9">
				  <a href="javascript:download('${no.uploadFileName}')">
				  	${no.uploadFileName}
				  </a>
				  </td>
				</tr>
				<tr>
				  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">제목</font></td>
				  <td colspan="3" bgcolor="#F2F7F9">${no.title}</td>
				</tr>
				<tr valign="top">
				  <td height="23" colspan="4" bgcolor="#FFFFFF">
					<table width="100%" border="0" cellspacing="0" cellpadding="15">
					  <tr>
						<td valign="top"> <pre>${no.content}</pre>
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
			<td height="20" valign="middle"><img src="/images/sub_it/point_line.gif" width="556" height="3"></td>
		  </tr>
		  <tr>
			<td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td align="left">
					&nbsp;
				  </td>
				  <td width="241" align="right">
				  
					
					<img src="img/button/but_list.gif" width="56" height="21" onClick="javaScript:location.href='notice.inc?nowPage=${nowPage}'" style="cursor:pointer">

					<img src="img/button/but_del.gif" width="56" height="21" onclick="showDel()" style="cursor:pointer">

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
  <form id="f" name="f" action="delnotice.inc">
		<label for="pwd">비밀번호:</label>
		<input type="password" id="pwd" name="pwd" size="7" /><br /> 
		<input type="submit" value="삭제" onClick="delnoti()" style="cursor:pointer"/>
		<input type="button" value="취소" onclick="cancel()" />
		<input type="hidden" name="seq" id="seq" value="${no.seq }"/>
		<input type="hidden" name="nowpage" id="nowpage" value="${nowPage }"/>
		
	</form>		
	 
	</div>
		<!-- 임시로 암호 123 지정 -->
		<form id="ff" name="ff">
		<input type="hidden" name="password" id="password" value="123"/>
		</form>
  </body>
  </html>
