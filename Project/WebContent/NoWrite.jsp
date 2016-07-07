 
<!-- 		제 목 : NoWrite.jsp
		역 할 : 공지사항 게시판글작성하는 jsp파일
		로 그 :  1.프로그램 최초 생성 (박상원 2016/06/22)
			 
			 
			   -->
			
		


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항-프로야구 토토 승무패 페이지</title>
<script type="text/javascript">
/* function check(ff){
		
		ff.submit();
} */
</script>
</head>
<body>

<form action="wnotice.inc" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" height="10"></td>
        </tr>
        <tr>
          <td align="center"><h1><u><b>공지사항</b></u></td></h1>
        </tr>
        <tr>
          <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <table width="556" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="2" bgcolor="#C3C3C3"></td>
              </tr>
              <tr>
                <td bgcolor="#E5E5E5"><table width="100%" border="0" cellspacing="1" cellpadding="2">


                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3">
                      <font color="#FFFFFF">제목</font></td>
                      <td bgcolor="#F2F7F9" align="left">
                      <input type="text" name="title" id="title" size="50" theme="simple"/>
                      </td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">내용</font></td>
                      <td bgcolor="#F2F7F9" align="left"><textarea name="content" id="content" cols="50" rows="10" theme="simple"></textarea></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
                      <td bgcolor="#F2F7F9" align="left">
                        <input type="file" name="upload" id="upload" cssStyle="width:300px" theme="simple"/>
                      </td>
                    </tr>
                    
                  </table></td>
              </tr>
            </table>
            <table width="556" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20" valign="middle"><img src="/img/sub_it/point_line.gif" width="556" height="3"></td>
              </tr>
              <tr>
                <td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="315" align="center">
                        
                      </td>
                      <td width="241" align="right">
                      <input type="submit"  value="보내기"/>
                      <input type="reset" value="재입력"/>
                      <input type="button" value="취소" onclick="javascript:location.href='notice.inc'"/>
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="19"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
