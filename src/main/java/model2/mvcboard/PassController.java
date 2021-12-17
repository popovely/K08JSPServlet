package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PassController extends HttpServlet {
	// 패스워드 검증을 위한 페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 혹은 삭제를 위한 파라미터 받기
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
	}
}
