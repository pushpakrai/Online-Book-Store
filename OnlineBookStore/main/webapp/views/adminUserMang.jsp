<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin User Management</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   </head>
   <body class="bg-light">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
         <div class="container-fluid">
            <a class="navbar-brand" href="#">Online Bookstore</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item"><a class="nav-link" href="/admin/home">Home</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <div class="container mt-5">
         <h2 class="text-center mb-4">Update User Details</h2>
         <c:choose>
            <c:when test="${mode == 'MODE_UPDATE'}">
               <form action="/admin/update-user" method="post">
                  <input type="hidden" name="id" value="<c:out value="${user.id}"/>" />
                  <div class="form-group">
                     <label for="firstName">First Name:</label>
                     <input type="text" id="firstName" name="firstName" class="form-control" value="<c:out value="${user.firstName}"/>" required>
                  </div>
                  <div class="form-group">
                     <label for="lastName">Last Name:</label>
                     <input type="text" id="lastName" name="lastName" class="form-control" value="<c:out value="${user.lastName}"/>" required>
                  </div>
                  <div class="form-group">
                     <label for="username">Username:</label>
                     <input type="text" id="username" name="username" class="form-control" value="<c:out value="${user.username}"/>" required>
                  </div>
                  <div class="form-group">
                     <label for="password">Password:</label>
                     <input type="password" id="password" name="password" class="form-control" value="<c:out value="${user.password}"/>" required>
                     <input type="checkbox" onclick="togglePassword()"> Show Password
                  </div>
                  <div class="form-group">
                     <label for="email">Email:</label>
                     <input type="email" id="email" name="email" class="form-control" value="<c:out value="${user.email}"/>" required>
                  </div>
                  <div class="form-group">
                     <label for="role">Role:</label>
                     <select id="role" name="role" class="form-control" required>
                        <option value="ROLE_USER" <c:if test="${user.role == 'ROLE_USER'}">selected</c:if>>User</option>
                        <option value="ROLE_ADMIN" <c:if test="${user.role == 'ROLE_ADMIN'}">selected</c:if>>Admin</option>
                     </select>
                  </div>
                  <input type="submit" value="Update" class="btn btn-primary update-button">
                  <a href="javascript:history.back()" class="btn btn-secondary back-button">Back</a>
               </form>
            </c:when>
            <c:otherwise>
               <div class="table-responsive">
                  <table class="table table-striped">
                     <thead>
                        <tr>
                           <th>User ID</th>
                           <th>Username</th>
                           <th>First Name</th>
                           <th>Last Name</th>
                           <th>Email</th>
                           <th>Role</th>
                           <th>Delete</th>
                           <th>Edit</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="user" items="${users}">
                           <tr>
                              <td>${user.id}</td>
                              <td>${user.username}</td>
                              <td>${user.firstName}</td>
                              <td>${user.lastName}</td>
                              <td>${user.email}</td>
                              <td>${user.role}</td>
                              <td><a href="/admin/delete-user?id=${user.id}" class="btn btn-danger delete-button"
                                 onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                              </td>
                              <td><a href="/admin/edit-user?id=${user.id}" class="btn btn-primary edit-button">Edit</a></td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
      <!-- Bootstrap JS and jQuery -->
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
         integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
         crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
         integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
         crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
         integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
         crossorigin="anonymous"></script>
      <script>
         function togglePassword() {
            var passwordInput = document.getElementById("password");
            if (passwordInput.type === "password") {
               passwordInput.type = "text";
            } else {
               passwordInput.type = "password";
            }
         }
      </script>
   </body>
</html>