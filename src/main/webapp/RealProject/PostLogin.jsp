<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>$.post() 메소드를 이용한 비동기 로그인 구현하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#btnLogin2").click(function(){
		// 요청할 서버의 URL
		var s_url = "../realproject/PostLogin.do";
		/* 
			jQuery의 Ajax관련 메소드의 파라미터는 JSON형태로 조립한 후
			서버로 전송해야 한다.
			이 때 <form>태그 하위의 모든 폼값을 한꺼번에 JSON으로 만들고 싶다면
			serialize()메소드를 사용하면 된다.
		*/
		var s_params = $("#loginFrm").serialize();
		// Post방식으로 서버로 요청한다.
		$.post(
			s_url,
			s_params,
			
			function(resData){
				/* 
					$.ajax()메소드는 콜백데이터의 형식을 지정할 수 있지만
					$.post()메소드는 형식을 지정할 수 없어서
					무조건 text형식으로만 콜백받는다.
					따라서 JSON데이터를 콜백 받았다면 파싱을 위해
					JSON.parse()메소드를 한번 실행한 후 파싱해야 한다.
				*/
				var d = JSON.parse(resData);
				if(d.result==1){// 로그인에 성공한 경우...
					console.log(d.message);
					// 콜백받은 HTML태그를 해당 위치에 삽입한다.
					$("#loginFrm").html(d.html);
					// 로그인 버튼은 숨김처리 한다.
					$("#btnLogin2").hide();
					alert(d.message);
				}
				else {
					alert(d.message);
				}
			}
		);
	});
});
/* 
	jQuery의 $.post()를 이용한 로그인을 구현하기 전에
	기본적인 로그인 기능이 작동하는지를 우선적으로 체크해야 함.
*/
function checkFrm() {
	var f = document.getElementById("loginFrm");
	f.method = "post";
	f.action = "../realproject/PostLogin.do";
}
</script>
</head>
<body>
<div class="container">
	<h2>$.post() : 비동기 로그인 구현하기</h2>
	<div class="row" id="loginTable">
		<form id="loginFrm" onsubmit="return checkFrm();">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="user_id" value="" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" name="user_pw" value="" />
					</td>
				</tr>
			</table>
			<div>
				<button type="submit" class="btn btn-danger" id="btnLogin1">
					로그인하기(HTML의submit사용)</button>				
				<button type="button" class="btn btn-success" id="btnLogin2">
					로그인하기(jQuery의 $.post()사용)</button>
			</div>						 
		</form>
	</div> 
</div>	
</body>
</html>