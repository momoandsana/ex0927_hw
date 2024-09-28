import dto.BoardDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.annotation.WebListener;

import java.util.ArrayList;
import java.util.List;

@WebListener
//웹 리스너는 특별한 설정 없이도 웹 어플리케이션이 시작할 때 같이 시작한다
public class ServletContextListener implements jakarta.servlet.ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent e) {
        System.out.println("ServletContextListener.contextInitialized");

        ServletContext application = e.getServletContext();

        List<BoardDTO> boardList=new ArrayList<>();
        boardList.add(new BoardDTO(1, "첫 번째 글", "내용 1"));
        boardList.add(new BoardDTO(2, "두 번째 글", "내용 2"));
        boardList.add(new BoardDTO(3, "세 번째 글", "내용 3"));

        application.setAttribute("boardList",boardList);
        application.setAttribute("path",application.getContextPath());

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("ServletContextListener.contextDestroyed");
    }
}
