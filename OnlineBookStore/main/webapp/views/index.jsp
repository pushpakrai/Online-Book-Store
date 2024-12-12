<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Online Book Store</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
      <link rel="stylesheet" href="/css/styles.css">
   </head>
   <body>
      <div class="container">
         <h1>Welcome to Our Online Book Store</h1>
         <p>Please select your login option:</p>
         <ul class="nav justify-content-end">
            <li class="nav-item">
               <a class="nav-link active" aria-current="page" href="/user-login">User Login</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/admin-login">Admin Login</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/registration">New User Registration</a>
            </li>
         </ul>
      </div>
   </body>
</html>