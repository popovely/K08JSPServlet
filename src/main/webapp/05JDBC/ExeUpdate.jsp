<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
	// JDBC를 통한 DB연결
	JDBCConnect jdbc = new JDBCConnect();
	
	// 입력할 회원데이터 준비 (하드코딩)
	String id = "test2";
	String pass = "2222";
	String name = "테스트2회원";
	
	// 쿼리문 준비 (입력값에 대한 부분은 ?(인파라미터)로 처리)
	String sql = "INSERT INTO member VALUES (?, ?, ?, sysdate)";
	// 동적쿼리 실행을 위한 prepared 객체 생성
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	// 인파라미터 설정 (인덱스는 1부터 시작한다.)
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name);
	
	/*
	executeUpdate()
		: 행에 영향을 주는 update, delete, insert문을 실행할 때 사용하는 메소드.
		  반환값이 적용된 행의 개수이므로 좌변에 int사용
	*/
	int inResult = psmt.executeUpdate();
	out.println(inResult +"행이 입력되었습니다.");
	
	//자원해제 (객체소멸)
	jdbc.close();
	%>
</body>
</html>