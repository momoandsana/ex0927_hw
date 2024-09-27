import dto.BoardDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/save")
public class saveServlet extends HttpServlet {

    private List<BoardDTO> boardList;

    public saveServlet() {
        System.out.println("saveServlet.saveServlet");
    }

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        boardList=(List<BoardDTO>)context.getAttribute("boardList");
        // 어플리케이션에 저장된 리스트를 꺼내서 전역변수에 넣는다

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 입력 받은 글번호, 제목, 내용을 application 에 저장한다
        int no=Integer.parseInt(req.getParameter("no"));
        String subject=req.getParameter("subject");
        String content=req.getParameter("content");

        BoardDTO board=new BoardDTO(no,subject,content);

        resp.sendRedirect("center.jsp");
    }
}
