<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Example</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <script src="<c:url value="resources/js/jquery-3.6.4.min.js" />"></script>
    <script src="<c:url value="resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
        <h2>Contacts</h2>
        <hr />
        <br/><br/>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Contacts List</div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="tempContact" items="${contacts}">

                        <c:url var="updateLink" value="/edit">
                            <c:param name="id" value="${tempContact.id}" />
                        </c:url>

                        <c:url var="deleteLink" value="/delete/${tempContact.id}">
                        </c:url>
                        <tr>
                            <td>${tempContact.firstName}</td>
                            <td>${tempContact.lastName}</td>
                            <td>${tempContact.email}</td>
                            <td>${tempContact.phone}</td>
                            <td>
                                <a href="${updateLink}">Update</a>
                                | <a href="${deleteLink}"
                                     onclick="if (!(confirm('Are you sure you want to delete this contact?'))) return false">
                                Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
