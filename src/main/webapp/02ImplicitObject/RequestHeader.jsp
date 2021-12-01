<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력하기</h2>
	<%
	/* 
	getHeaderNames()
		: 사용자의 요청 헤더를 얻어올 때 사용하는 메소드.
		  반환타입은 Enumeration이다.
	hasMoreElements()
		: 출력할 정보가 있는지 확인하여 boolean값을 반환한다.
	nextElement()
		: 헤더명을 반환한다.
	*/
	Enumeration headers = request.getHeaderNames();
	while(headers.hasMoreElements()){
		//nextElement()메소드를 통해 헤더명을 반환한다.
		String headerName = (String)headers.nextElement();
		//getHeader()메소드를 통해 헤더값을 반환한다.
		String headerValue = request.getHeader(headerName);
		out.print("헤더명 : "+ headerName +", 헤더값 : "+ headerValue +"<br>");
	}
	/* 
	요청헤더를 통해 확인할 수 있는 값
	user-agent
		: 사용자가 접속한 웹 브라우저의 종류를 알 수 있다.
		  크롬, 파이어폭스, 엣지 등 여러가지 웹브라우저에서
		  테스트 해보면 각기 다른 결과가 출력되는 것을 확인할 수 있다.
	referer
		: 웹을 서핑하면서 링크를 통해 다른 사이트로 방문시 남는 흔적이다.
		  어떤 사이트를 통해 해당 페이지로 유입되었는지 알 수 있다.
		  유입이 많은 사이트에 광고를 늘린다던가...하기위해 많이 사용함
	cookie
		: 웹서버가 브라우저를 통해 클라이언트의 컴퓨터에 남기는 흔적.
		  파일의 형태로 저장된다.
	*/
	%>
	<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</body>
</html>