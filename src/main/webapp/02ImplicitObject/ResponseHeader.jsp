<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// get방식으로 전송된 폼값을 날짜 형식을 통해 타임스탬프로 변경한다.
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date="+ add_date);
// 숫자형식으로 전송된 값을 정수로 변경한다.
int add_int = Integer.parseInt(request.getParameter("add_int"));
// <form>태그를 통해 전송되는 모든 값은 문자열 형태로 저장된다.
String add_str = request.getParameter("add_str");

/* 
add계열의 메소드를 통해 응답헤더를 추가한다.

addDateHeader(문자열, long형의타임스템프)
	: 응답헤더중 날짜를 추가하는 메소드.
	  세계표준시를 사용해서 설정한다.
	  대한민국은 표준시 +09, 즉 9시간이 느리므로
	  09시로 설정해야 정상적인 날짜가 출력된다.
	  만약 9시 이전의 시간을 설정하면 어제 날짜가 나온다.
*/
response.addDateHeader("myBirthday", add_date);//날짜형식의 응답헤더를 추가
response.addIntHeader("myNumber", add_int);//정수형식 : 8282
response.addIntHeader("myNumber", 1004);//정수형식 : 1004
response.addHeader("myName", add_str);//문자열 형식 : 홍길동
/* 
set계열의 메소드는 기존의 응답헤더값을 수정한다.
*/
response.setHeader("myName", "안중근");//앞에서 설정한 값을 안중근으로 수정한다.

/* 
파일다운로드 구현시 사용하는 설정
	: 웹브라우저가 인식하지 못하는 MIME타입으로 설정하면
	  웹브라우저는 파일 다운로드 창을 통해 파일을 다운로드 시켜버린다.
	  jpg와 같은 이미지 파일은 웹브라우저가 인식하는 MIME타입이므로
	  다운로드를 위해서는 아래와 같은 설정이 필요하다.
*/
//response.setContentType("binary/octect-stream");

/* 
	새로운 내용을 DB에 추가했는데도 변경된 내용이
	웹브라우저에 출력되지 않을 때
	캐시를 사용하지 않겠다는 의미의 응답헤더 설정이다.
	사이트에 접속할 때 마다 F5를 누른것 처럼
	새로운 정보를 서버로부터 받아서 갱신하게 된다.
*/
response.setHeader("Pragma", "no-cache");// HTTP/1.0에서 사용했던 설정(호환성때문에 남아있음)
response.setHeader("cache-control", "no-cache");// HTTP/1.1에서 사용하는 설정(현재 사용중임)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	// getHeaderNames() 메소드를 통해 응답헤더명을 얻어온다.
	Collection<String> headerNames = response.getHeaderNames();
	// 개선된(확장)for문을 통해 얻어온 응답헤더명의 개수만큼 반복
	for (String hName : headerNames) {
		// 응답헤더값을 얻어온다.
		String hValue = response.getHeader(hName);
	%>
		<li><%= hName %> : <%= hValue %></li>
	<%
	}
	/* 
	첫번째 출력결과에서는 myNumber라는 헤더명이 2번 출력되는데,
	동일한 값이 출력된다.
	이것은 getHeader() 메소드의 특성으로서
	처음 입력한 헤더값만 출력된다.
	*/
	%>
	
	<h2>myNumber만 출력하기</h2>
	<%
	/* 
	myNumber라는 헤더명으로 2개의 값을 추가했으므로
	아래에서는 각각의 값이 정상적으로 출력된다.
	 ; add계열의 메소드는 헤더명을 동일하게 사용하더라도
	   헤더값은 추가된다.
	*/
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber){
		%>
		<li>myNumber : <%= myNum %></li><!-- 8282, 1004가 순서대로 출력된다. -->
	<%
	}
	%>
</body>
</html>