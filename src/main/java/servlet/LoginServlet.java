package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Calendar;

@WebServlet(urlPatterns="/login", loadOnStartup = 1)
public class LoginServlet extends HttpServlet {
    String dbId="kim",dpPwd="1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId=request.getParameter("userId");
        String userPwd=request.getParameter("userPwd");

        if(dbId.equals(userId) && userPwd.equals(dpPwd))
        {
            HttpSession session=request.getSession();

            session.setAttribute("userId",userId);

            Calendar cal=Calendar.getInstance();
            int y=cal.get(Calendar.YEAR);
            int m=cal.get(Calendar.MONTH)+1;
            int d=cal.get(Calendar.DATE);

            int h=cal.get(Calendar.HOUR_OF_DAY);
            int min=cal.get(Calendar.MINUTE);
            int s=cal.get(Calendar.SECOND);

            StringBuilder sb=new StringBuilder();
            sb.append(y+"년");
            sb.append(m+"월");
            sb.append(d+"일");
            sb.append(h+"시");
            sb.append(min+"분");
            sb.append(s+"초");

            session.setAttribute("creationTime",sb.toString());
            response.sendRedirect("LoginOk.jsp");
        }
        else
        {
            request.setAttribute("errMsg","님 정보를 확인해주세요");
            request.getRequestDispatcher("/error/error.jsp")
                    .forward(request, response);
        }
    }
}
