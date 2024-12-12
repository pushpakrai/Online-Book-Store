<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>User Login</title>
      <link rel="stylesheet" href="/css/styles.css">
      <script src="/js/errorHandling.js"></script>
   </head>
   <body>
      <div class="container">
         <h1>User Login</h1>
         <form action="/login/user" method="POST" class="login-form">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
         </form>
         <!-- Home Button -->
         <a href="/" class="back-button">Home</a>
      </div>
   </body>
</html>