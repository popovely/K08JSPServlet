<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<h2>회원목록 조회 테스트 (executeQuery() 사용)</h2>
	<%
	// DB연결
	JDBCConnect jdbc = new JDBCConnect();
	
	// 정적 쿼리 실행을 위한 statement객체 생성 및 쿼리준비
	String sql = "SELECT id, pass, name, regidate FROM member";
	Statement stmt = jdbc.con.createStatement();
	
	// 행에 영향이 없는 쿼리를 실행할 경우 executeQuery()를 사용한다.
	ResultSet rs = stmt.executeQuery(sql);
	/*
		select의 결과는 ResultSet객체를 통해 반환하고,
		그 개수만큼 반복해서 출력한다.
	*/
	while (rs.next()) {
		// 각 레코드의 컬럼에 접근시
		//①인덱스를 사용하거나...
		String id = rs.getString(1);
		String pw = rs.getString(2);
		//②컬럼명을 사용할 수 있다.
		String name = rs.getString("name");
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s", id, pw, name, regidate)+ "<br>");
	}
	// 자원해제
	jdbc.close();
	%>
</body>
</html>