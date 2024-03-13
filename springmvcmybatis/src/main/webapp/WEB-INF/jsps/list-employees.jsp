<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Web Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Optional: Add your own styles here -->
    <style>
        /* Add your custom styles here */
        body {
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">List of Employees</h1>
        <button class="btn btn-primary mb-3" onclick="window.location.href = 'showFormForAddEmployee.html'">Add Employee</button>
                <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Hobbies</th>
                        <th>Country</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listemployees}" var="e">
                        <c:url var="deleteLink" value="/deleteemployee">
                            <c:param name="employeeId" value="${e.id}"/>
                        </c:url>
                        <c:url var="updateLink" value="/editemployee">
                            <c:param name="employeeId" value="${e.id}"/>
                        </c:url>
                        <tr>
                            <td>${e.fullname}</td>
                            <td>${e.email}</td>
                            <td>${e.gender}</td>
                            <td>${e.hobbies}</td>
                            <td>${e.country}</td>
                            <td>${e.address}</td>
                            <td>
                                <a class="btn btn-info btn-sm" href="${updateLink}">Update</a>
                                <a class="btn btn-danger btn-sm" href="${deleteLink}" onclick="if(!(confirm('Are you sure want to delete the record?'))) return false;">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap features like dropdowns) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
