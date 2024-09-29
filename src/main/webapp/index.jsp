<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    table {
      width: 800px;
      height: 600px;
      border-collapse: collapse;
    }
    td{
      border:3px solid;
      border-color: black !important;
      text-align:center;
    }
    iframe {
      width: 100%;
      height: 630px;
      border: none;
    }
    /*h3 {*/
    /*  background-color: orange;*/
    /*}*/
    table tr:nth-child(2) > td:nth-child(1) {
      width: 200px;
    }

    td[colspan]{
      border-top:1px solid black !important;
      border-bottom:1px solid black !important;
    }
  </style>
</head>
<body>

<table class="table table-bordered">
  <tr>
    <td colspan="2"><jsp:include page="top.jsp"/> </td>
  </tr>
  <tr>
    <td><iframe src="left.jsp" name="left"></iframe> </td>
    <td><iframe src="center.jsp" name="center"></iframe> </td>
  </tr>
  <tr>
    <td colspan="2"><jsp:include page="footer.jsp"/></td>
  </tr>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
