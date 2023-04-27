<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Contact</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<div align="center">
    <h2>Edit Contact</h2>
    <form:form action="update" method="post" modelAttribute="contact">
        <table border="0" cellpadding="5">
            <tr>
                <td>ID: </td>
                <td><form:hidden path="id" /></td>
            </tr>
            <tr>
                <td>First Name: </td>
                <td><form:input path="firstName" /></td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td><form:input path="lastName" /></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td>Phone: </td>
                <td><form:input path="phone" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" class="btn btn-primary" value="Update" onclick="if (!(confirm('Are you sure you want to update this contact?'))) return false"></td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>>
