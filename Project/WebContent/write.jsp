<!-- 
	/*
	제 목 : write.jsp
	역 할 : write 페이지
	로 그 : 1. 자유게판 글쓰기(장준수 2016/06/23)
	*/
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(ff){

		ff.submit();
}
</script>
<style type="text/css">
	#writetable{
		margin-top: 70px;
		margin-left: 120px;
	}
	
	#writetable {border:none; border-top:2px solid #ddd;}
	#writetable th {border-bottom:1px solid #ccc; border-left:1px solid #ccc; 
	border-right:1px solid #ccc; padding:10px 0 10px 25px; font-weight:bold; background:#efefef; font-size: 15px;
	text-align: center;}
	#writetable td {border-bottom:1px solid #ddd; padding:10px; font-weight: bold;}
	
	#title{margin: -9px; width: 575px;}
	#content{margin: -9px;}
	#upload{margin-left: -9px; width: 380px;}
	
	#move{
		display: inline-block;
		margin-left: 370px;
		margin-top: 20px;
		margin-bottom: 5px;
	}
	
	div#move input[type=button],input[type=reset] {
		display: inline;
		width: 70px;
		height: 27px;
		margin: 10px auto;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #dcdcdc;
		margin-left: 10px;
	}
	
	#idcolor{
		color: #000000;
	}
	
	#write{
		margin-top: 50px;
		width: 970px;
		border: 1px solid #191919;
		margin-left: 305px;
	}
	
	
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="include/header.jsp"></jsp:include>
	
		<div id="write">
		<form action="write.inc" method="post" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value=${vo.id } /> 
			<input type="hidden" id="password" name="password" value=${vo.password } />

			<table id="writetable">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<label for="name" class="hidden">아이디</label>
							<h3 id="idcolor">${vo.id }</h3>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<label for="title" class="hidden">제목</label>
							<input type="text" name="title" id="title" class="join"/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td id="area">
							 <label for="content" class="hidden">내용</label>
							 <textarea rows="25" cols="70" name="content" id="content" class="join"></textarea>
	
						</td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td>
							 <label for="file" class="hidden">첨부파일</label>
							 <input type="file" name="upload" id="upload" class="join"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="move">
				<input type="button" onclick="check(this.form)" value="저장" />
				<input type="reset" value="재입력" />
				<input type="button" value="취소"onclick="javascript:location.href='freeBoard.inc'" />
			</div>	
		</form>
	</div>
</div>
<%@include file="include/footer.jsp"%>
</body>
</html>
