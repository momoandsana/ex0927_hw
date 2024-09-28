package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/logout", loadOnStartup = 1)
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();

        // 로그아웃 후에 center.jsp를 새로 고치는 스크립트가 포함된 HTML 응답 코드. left 에서 해당 로직 만들면 문제가 생김
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html><head>");
        out.println("<script>");
        out.println("window.parent.frames['center'].location.reload();");
        // center 프레임 새로 고침->로그아웃하면 세션 없어지니까 center 에서 글 작성 기능 제외해야 함
        out.println("window.location.href = '/left.jsp';"); // left.jsp로 리다이렉션
        out.println("</script>");
        out.println("</head><body></body></html>");
    }
}
