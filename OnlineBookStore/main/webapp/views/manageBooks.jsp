<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Manage Book</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
      <style>
         <link rel="stylesheet" href="/css/styles.css">
      </style>
   </head>
   <body class="bg-light">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
         <div class="container-fluid">
            <a class="navbar-brand" href="#">Online Bookstore</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
            </button>
            <link rel="stylesheet" href="/css/styles.css">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item"><a class="nav-link" href="/admin/home">Home</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <div class="container mt-4">
         <h2 class="text-center mb-4">Manage Books</h2>
         <a href="/admin/addBookForm" class="btn btn-primary">Add Book</a>
         <!-- Category Filtering Form -->
         <form action="/admin/manageBooks" method="get">
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
         <table class="table table-striped mt-3">
            <thead class="thead-dark">
               <tr>
                  <th scope="col">Serial Number</th>
                  <th scope="col">Name</th>
                  <th scope="col">Author</th>
                  <th scope="col">Category</th>
                  <th scope="col">Preview</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Price($)</th>
                  <th scope="col">Description</th>
                  <th scope="col">Delete</th>
                  <th scope="col">Update</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="book" items="${books}">
                  <tr>
                     <td>${book.id}</td>
                     <td>${book.title}</td>
                     <td>${book.author}</td>
                     <td>${book.category.name}</td>
                     <td><img src="${book.image}"
                        height="100px" width="100px"></td>
                     <td>${book.stock}</td>
                     <td>${book.price}</td>
                     <td>${book.description}</td>
                     <td>
                        <form action="/admin/deleteBook" method="post">
                           <input type="hidden" name="id" value="${book.id}" />
                           <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Book?')">Delete</button>
                        </form>
                     </td>
                     <td>
                        <!-- Update Button -->
                        <form action="/admin/editBook/${book.id}" method="get">
                           <button type="submit" class="btn btn-primary update-button">Update</button>
                        </form>
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
      <!-- Bootstrap JS and jQuery -->
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   </body>
</html>