<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - out</title>
</head>
<body>
	<!-- 
		out태그
		
		- 영역에 저장된 변수를 출력할때 사용
		- escapeXml 속성이 true이면 HTML태그가 그대로 출력된다. (innerText()와 동일)
	 -->
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<h4>기본 사용</h4>
	<!-- escapeXml 속성은 true가 디폴트 값이다. 즉, 텍스트가 그대로 출력된다. -->
	<c:out value="${ iTag }" />
	
	<h4>escapeXml 속성</h4>
	<!-- escapeXml="false"이면 HTML태그가 적용되어 출력된다. innerHTML()과 동일 -->
	<c:out value="${ iTag }" escapeXml="false" />
	
	<h4>default 속성</h4>
	<!-- 최초 실행시에는 파라미터가 없는 상태이므로 default값이 출력됨 -->
	<c:out value="${ param.name }" default="이름없음" />
	<!-- value속성이 null일때만 default값이 출력되고, 빈값인 경우에는 출력되지 않는다. -->
	<c:out value="" default="빈 문자열도 값입니다."/><!-- default값이 출력되지 않음. -->
</body>
</html>