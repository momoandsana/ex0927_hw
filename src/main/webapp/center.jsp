<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-27
  Time: 오후 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .table-bordered td,.table-bordered th{
            border: 2px solid black;
            text-align:center;
        }

        .table{
            width:80%;
            margin:0 auto;
        }

        form{
            margin-top:10px;
        }

        div{
            display:flex;
            align-items:center;
            margin-bottom:10px;
        }

        label{
            margin-left:20px;
            width:80px;
        }

        #button{
            margin-left:20px;
        }
    </style>
</head>
<body>
    <fieldset>
        <legend>BoardList</legend>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>no</th>
                <th>subject</th>
                <th>content</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${applicationScope.boardList}" var="board">
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
            <div>
                <label for="no">글번호 : </label>
                <input type="number" id="no" name="no" required><br>
                <%--            숫자만 입력 받음--%>
            </div>

            <div>
                <label for="subject">제목 : </label>
                <input type="text" id="subject" name="subject" required><br>
            </div>

            <div>
                <label for="content">내용 : </label>
                <textarea id="content" name="content" required></textarea><br><br>
            </div>



            <input type="submit" id="button" class="btn btn-primary" value="등록하기">
        </form>



    </fieldset>

</body>
</html>
