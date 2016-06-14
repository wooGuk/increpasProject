
var xhr = null;

//브라우저를 구별하여 xhr객체를 생성하는 곳
function getRequest(){
	if(window.ActiveXObject){
		xhr = new ActiveXObject(
				"Microsoft.XMLHTTP");
	}else
		xhr = new XMLHttpRequest();
}

//사용자가 서버를 호출할 때 사용하는 함수
function sendRequest(url, param, callback, method, async){  //요청경로,인자,도착함수,요청방식,비동기식여부
	
	getRequest(); //xhr생성
	
	// 요청방식을 받아서 소문자로 변경한 후
	// "get"과 비교한다. 즉, "get"방식으로
	// 정확하게 입력하지 않은 경우는 모두
	// "post"방식으로 처리하기 위해 구별한다.
	method = (method.toLowerCase() == "get")?"GET":"POST";
	
	// 요청방식에 따라 파라미터의 URL이 달라진다.
	// 예를 들어 get방식일 때는 URL이
	// test.jsp?v1=java
	// post방식일 때는 test.jsp가 되고 파라미터는
	// send시 넣어준다.
	// 그리고 요청시 파라미터 값이 없는 경우도
	// 있으므로 그것부터 가려내자!
	param = (param == null || param == "")?null:param;
	
	// 이제 요청방식에 따라 파라미터를
	// URL뒤에 붙일지를 가려내자!
	if(method == "GET" && param != null)
		url = url+"?"+param;
	// 위를 수행한 후의 url은
	// GET방식일 때는 "test.jsp?v1=java" 하지만
	// POST방식일 땐 "test.jsp" 그리고 param이
	// "v1=java"로 되어 있다.
	
	// 요청을 보내고, 응답이 도착하는 함수 지정
	xhr.onreadystatechange = callback;
	
	//요청 정보 지정
	xhr.open(method, url, async);
	
	//한글처리를 위해 헤더값 설정
	xhr.setRequestHeader("Content-Type",
		"application/x-www-form-urlencoded");
	
	//서버로 요청 보내기
	xhr.send(method == "POST"?param:null);
}





