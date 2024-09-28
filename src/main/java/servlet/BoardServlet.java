package servlet;

import dto.BoardDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/save")
public class BoardServlet extends HttpServlet {

    private List<BoardDTO> boardList;

    public BoardServlet() {
        System.out.println("saveServlet.saveServlet");
    }

    @Override
    public void init() throws ServletException {
        /*
        처음 시작할 때 기본 글들을 저장한다
         */
        ServletContext context = getServletContext();
        boardList=(List<BoardDTO>)context.getAttribute("boardList");
        // 어플리케이션에 저장된 리스트를 꺼내서 전역변수에 넣는다

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         입력 받은 글번호, 제목, 내용을 application 에 저장한다
         새로 글을 입력 받아서 저장하는 경우
         */
        int no=Integer.parseInt(req.getParameter("no"));
        String subject=req.getParameter("subject");
        String content=req.getParameter("content");

        BoardDTO board=new BoardDTO(no,subject,content);
        boardList.add(board);// 따로 setAttribute 하지 않아도 주소를 받아왔기 때문에 값이 추가가 된다

        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("top.location.href='index.jsp';"); // 리다이렉션
        out.println("</script>");
        out.close();
    }
}
