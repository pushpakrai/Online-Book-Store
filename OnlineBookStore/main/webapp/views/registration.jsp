<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>User Registration</title>
      <link rel="stylesheet" href="/css/styles.css">
   </head>
   <body>
      <div class="container">
         <h1>User Registration</h1>
         <%-- Display error message --%>   
         <c:if test="${param.registrationError}">
            <p id="errorMessage"></p>
            <!-- Registration error message will be displayed here -->
         </c:if>
         <form action="/registration" method="POST" class="login-form">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required><br>
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required><br>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="checkbox" onclick="togglePassword()"> Show Password<br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <input type="submit" value="Register">
         </form>
         <!-- Home Button -->
         <a href="/" class="back-button">Home</a>
      </div>
      <!-- Include custom JavaScript for error handling and password toggle -->
      <script src="/js/errorHandling.js"></script>
   </body>
</html>