<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	필요한 외부 클래스를 임포트한다.
	Java에서와 같이 자동완성으로 기술한다.
 -->
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - import 속성</title>
</head>
<body>
<%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String todayStr = dateFormat.format(today);
//오늘의 날짜를 0000-00-00 형식으로 출력
out.println("오늘 날짜 : "+ todayStr);
%>
</body>
</html>