<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-27
  Time: 오후 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <fieldset>
        <legend>BoardList</legend>
        <table>
            <thead>
            <tr>
                <th>no</th>
                <th>subject</th>
                <th>content</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="{applicationScope.boradList}" var="board">
                    <tr>
                        <td>${board.no}</td>
                        <td>${board.subject}</td>
                        <td>${board.content}</td>
<%--                        dto 안의 getter 함수들 호출--%>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <form action="register" method="post">
            <label for="no">글번호 : </label>
            <input type="number" id="no" name="no" required>
<%--            숫자만 입력 받음--%>

            <label for="subject">제목 : </label>
            <input type="text" id="subject" name="subject" required>

            <label for="content">내용 : </label>
            <textarea id="content" name="content" required></textarea>

            <input type="submit" value="등록하기">
        </form>



    </fieldset>

</body>
</html>
