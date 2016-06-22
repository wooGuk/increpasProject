<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List, mybatis.vo.FreeBoardVO, mybatis.vo.MemberVO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- <link href="css/text.css" rel="stylesheet" type="text/css"> -->
<style type="text/css">
	
	div#contents_sub{
		margin-left: 500px;
	}
	
	.t1{width: 56px; text-align: center;}
	.t2{width: 270px; text-align: center;}
	.t3{width: 80px; text-align: center;}
	.t4{width: 100px; text-align: center;}
	.t5{width: 50px; text-align: center;}

	#writebtn{
		
		margin-left: 180px;
	} 
	

</style>
</head>
<body topmargin=0 leftmargin=0 marginwidth="0" marginheight="0">

<!--주요내용시작 -->
<div id="contents_sub">
<form name="ff2" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="bbs_table1">
  <tr>
	<td valign="top">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="bbs_table2">
		<tr>
		  <td align="center" height="10"></td>
		</tr>
		<tr>
		  <td style="padding-left: 250px;"><u><b>BBS 목록</b><u></td>
		</tr>
		<tr>
		  <td align="center" valign="top">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td>&nbsp;</td>
			  </tr>
			</table>
			<table width="556" border="0" cellspacing="0" cellpadding="0" id="bbs_table3">
			  <tr>
				<td height="2" style="background:#C3C3C3"></td>
			  </tr>
			  <tr>
				<td style="background:#E5E5E5">
				<table width="100%" border="0" cellspacing="1" cellpadding="2" id="bbs_table4" >
					<tr>
					  <td class="t1" style="background:#669AB3;"><font color="#FFFFFF">번호</font></td>
					  <td class="t2" style="background:#669AB3;"><font color="#FFFFFF">제목</font></td>
					  <td class="t3" style="background:#669AB3;"><font color="#FFFFFF">아이디</font></td>
					  <td class="t4" style="background:#669AB3;"><font color="#FFFFFF">날짜</font></td>
					  <td class="t5" style="background:#669AB3;"><font color="#FFFFFF">조회수</font></td>
					</tr>
     	  <c:forEach var="vo" items="${list }" varStatus="stat">
					<tr>
					  <td style="background:#F2F7F9">
<!--                           <s:property value="rowTotal-((nowPage-1)*blockList+#stat.index)"/> -->
						${rowTotal-((nowPage-1)*blockList+stat.index) }
                      </td>
					  <td style="background:#F2F7F9" style="text-align:left">
					  	
					  	<%-- step값만큼 들여쓰기하는 반복문 --%>
					  	<c:forEach begin="1" end="${vo.step }">
					  		<c:out value="&nbsp;&nbsp;" escapeXml="false"/>
					  	</c:forEach>
					  	
					  	<%-- step이 0이 아닌 경우엔 화살표 이미지 출력 --%>
					  	<c:if test="${vo.step > 0 }">
					  		<img src="img/arrow.JPG"/>
					  	</c:if>
					  	
<!--                           <s:a href="%{viewURL}"> -->
<!--                               <s:property value="title"/> -->
<!--                           </s:a> -->
						<a href="view.inc?seq=${vo.seq }&nowPage=${nowPage}"> 
							${vo.title }
						</a>
                      </td>
					  <td style="background:#F2F7F9"></td>
					  <td style="background:#F2F7F9">${vo.regdate }</td>
					  <td style="background:#F2F7F9">${vo.hit }</td>
					</tr>
       </c:forEach>
       <c:if test="${empty list }">
				<tr>
				  <td style="background:#F2F7F9; text-align: center" colspan="5" height="70">등록된 게시물이 없습니다.</td>
				</tr>
       </c:if>
				  </table></td>
			  </tr>
			</table>
			<table width="556" border="0" cellspacing="0" cellpadding="0" id="bbs_table5">
			  <tr>
				<td height="20" valign="middle"><img src="/img/sub_it/point_line.gif" width="556" height="3"></td>
			  </tr>
			  <tr>
				<td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td width="315" align="left">
                          ${pageCode }
					  </td>
					  <td width="241" align="right"> <img src="img/but_write.gif" width="56" height="21" id="writebtn" style="cursor:pointer" onClick="javascript:location.href='writeForm.inc'">
					  </td>
					</tr>
				  </table></td>
			  </tr>
			</table></td>
		</tr>
		<tr>
		  <td height="19">&nbsp;</td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</form>
</div>
 <!--주요내용끝 -->

</body>
</html>
