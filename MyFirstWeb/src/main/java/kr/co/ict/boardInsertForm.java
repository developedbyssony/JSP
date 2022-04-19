package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class boardInsertForm
 */
@WebServlet("/boardInsertForm")
public class boardInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher("/board/getBoardInsertForm.jsp");
		dp.forward(request, response);
	
	}
}

/*
String strBoardNum = request.getParameter("board_num");
int boardNum = Integer.parseInt(strBoardNum);

// 1) DAO를 생성하세요.
BoardDAO dao = BoardDAO.getInstance();

// 2) boardNum에 대한 정보를 디테일하게 볼 수 있도록 BoardNum을 getBoardDetail에 전달
BoardVO board = dao.getBoardDetail(boardNum); // 우변에 1번 글 정보 저장

// 글 정보를 디버깅해주세요.
System.out.println("글 넘버 :" + strBoardNum);
System.out.println("글 정보 :" + board);

// 바인딩해주세요.
request.setAttribute("board", board);
*/
