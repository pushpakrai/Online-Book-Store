<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>User Home - Online Bookstore</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   </head>
   <body class="bg-light">
      <!-- Navigation bar, similar to the one provided -->
      <!-- ... -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
         <div class="container-fluid">
            <a class="navbar-brand" href="#">Online Bookstore</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
               data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
               aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item"><a class="nav-link" href="/user/profile">Profile</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/cart">Cart</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/orders?userId=${user.id}">My Orders</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/logout">Logout</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <div class="container mt-4">
         <div class="jumbotron text-center">
            <h1 class="display-4">Welcome Back, ${sessionScope.user.firstName}!</h1>
            <hr>
            <p>Browse and manage your book selections here!</p>
         </div>
         <!-- Category Filtering Form -->
         <form action="/user/home" method="get">
            <div class="form-group">
               <label for="categoryFilter">Filter by Category:</label>
               <select class="form-control" id="categoryFilter" name="category_id" onchange="this.form.submit()">
                  <option value="">All Categories</option>
                  <c:forEach items="${categories}" var="category">
                     <option value="${category.id}" ${selectedCategoryId == category.id ? 'selected' : ''}>${category.name}</option>
                  </c:forEach>
               </select>
            </div>
         </form>
         <!-- Books Grid -->
         <div class="row mt-3">
            <c:forEach var="book" items="${books}">
               <div class="col-md-4">
                  <div class="card mb-4">
                     <img src="${book.image}" class="card-img-top" height="200px">
                     <div class="card-body">
                        <h5 class="card-title"><b>Name:</b> ${book.title}</h5>
                        <p class="card-text"><b>Author Name:</b> ${book.author}</p>
                        <p class="card-text"><b>Book Category:</b> ${book.category.name}</p>
                        <p class="card-text"><b>Description:</b> ${book.description}</p>
                        <p class="card-text"><b>Price:</b> ${book.price}</p>
                        <p class="card-text"><b>Available Quantity:</b> ${book.stock}</p>
                        <!-- Update Button -->
                        <form action="/user/addToCart/${book.id}" method="post">
                           <button type="submit" class="btn btn-primary update-button">Add to Cart</button>
                        </form>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
      <!-- Bootstrap JS and jQuery -->
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   </body>
</html>