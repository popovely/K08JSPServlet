<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - application</title>
</head>
<body>
	<!-- 
		application.getInitParameter(파라미터명)
			: 파라미터명에 해당하는 내용을 읽어온다.
	 -->
	<h2>web.xml에 설정한 내용 읽어오기</h2>
	초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %>
	
	<!-- 
		application.getRealPath(대상이름)
			: 이클립스에서는 우리가 작성한 파일의 원본을 실행하는 것이 아니고
			  metadata폴더 하위에 프로젝트와 동일한 환경을 만들어두고
			  복사본 파일을 실행한다.
			  따라서 아래의 물리적 경로는 metadata 하위의 경로가 출력된다.
	 -->
	<h2>서버의 물리적 경로 얻어오기</h2>
	application 내장 객체 : <%= application.getRealPath("/02ImplicitObject") %>
	
	<h2>선언부에서 application 내장 객체 사용하기</h2>
	<%!
	/* 
		선언부에서는 내장객체를 바로 사용할 수 없다.
		내장객체는 _jspService()메소드 내에서 생성된 지역변수이므로
		더 넓은 지역인 선언부에서 사용하려면 매개변수로 전달받아야 한다.
	*/
	/* 
	방법1]
			this.getServletContext() 메소드를 통해
			선언부에서 application 내장객체를 얻어온다.
	*/
	public String useImplicitObject(){
		return this.getServletContext().getRealPath("/02ImplicitObject");
	}
	/* 
	방법2]
			스크립트릿에서 메소드 호출시
			application 내장객체를 매개변수로 전달한다.
	*/
	public String useImplicitObject(ServletContext app){
		return app.getRealPath("/02ImplicitObject");
	}
	%>
	<ul>
		<li>this 사용 : <%= useImplicitObject() %></li>
		<li>내장 객체를 인수로 전달 : <%= useImplicitObject(application) %></li>
	</ul>
</body>
</html>