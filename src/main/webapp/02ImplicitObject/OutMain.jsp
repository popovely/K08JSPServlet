<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	버퍼에 담아두었다가
	flush()하거나 문서끝을 만나면 한꺼번에 출력된다.
	
	[참고] 버퍼가 있기 때문에 forward가 가능하다.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - out</title>
</head>
<body>
	<%
	/*
		out객체를 통해 print()메소드를 호출하면
		인자로 전달된 내용을 화면상에 출력할 수 있다.
	*/
	out.print("출력되지 않는 텍스트");
	/* 
	clearBuffer() : 버퍼에 저장된 내용을 삭제하므로 앞의 내용은 출력되지 않는다.
	*/
	out.clearBuffer();
	
	out.print("<h2>out 내장 객체</h2>");
	// getBufferSize() : 버퍼 크기 확인
	out.print("출력 버퍼의 크기 : "+ out.getBufferSize() +"<br>");
	out.print("남은 버퍼의 크기 : "+ out.getRemaining() +"<br>");
	
	// flush() : 버퍼에 저장된 내용을 출력한다.
	out.flush();
	out.print("flush 후 버퍼의 크기 : "+ out.getRemaining() +"<br>");
	
	// 다양한 타입의 값을 출력
	out.println(1);
	out.println(false);
	out.print('가');
	/* 
	print()와 println()의 차이
		: 출력된 문자열 뒤에 \n을 하나 추가하는 정도이다.
		    ; 두 메소드의 차이는 스페이스 한칸이 추가되는 정도이다.
		  
	웹브라우저에서는 줄바꿈을 위해서는 <br>태그가 필요하다.
	*/
	%>
</body>
</html>