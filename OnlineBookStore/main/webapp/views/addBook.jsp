<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Add New Book</title>
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
                  <li class="nav-item"><a class="nav-link" href="/admin/manageBooks">Back</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <br>
      <div class="container jumbotron">
         <h3>Add New Book</h3>
         <!-- Error Display Section -->
         <c:if test="${!empty errors}">
            <div class="alert alert-danger">
               <c:forEach items="${errors}" var="error">
                  <div>${error.defaultMessage}</div>
               </c:forEach>
            </div>
         </c:if>
         <form action="/admin/addBook" method="post" enctype="multipart/form-data">
            <div class="form-group">
               <label for="title">Title</label>
               <input type="text" class="form-control" id="title" name="title" required placeholder="Enter book title">
            </div>
            <div class="form-group">
               <label for="author">Author</label>
               <input type="text" class="form-control" id="author" name="author" required placeholder="Enter author's name">
            </div>
            <div class="form-group">
               <label for="category">Select Category</label>
               <select class="form-control" id="category" name="category_id">
                  <c:forEach var="category" items="${categories}">
                     <option value="${category.id}" ${book.category != null && category.id == book.category.id ? 'selected' : ''}>
                     ${category.name}
                     </option>
                  </c:forEach>
               </select>
            </div>
            <div class="form-group">
               <label for="price">Price</label>
               <input type="number" class="form-control" id="price" name="price" required placeholder="Enter price">
            </div>
            <div class="form-group">
               <label for="stock">Stock</label>
               <input type="number" class="form-control" id="stock" name="stock" required placeholder="Enter stock quantity">
            </div>
            <div class="form-group">
               <label for="description">Description</label>
               <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter book description"></textarea>
            </div>
            <div class="form-group">
               <label for="imageUpload">Upload New Image</label>
               <input type="file" class="form-control-file" id="imageUpload" name="imageFile" accept="image/*">
               <label for="imageUrl">or Enter Image URL</label>
               <input type="text" class="form-control" id="imageUrl" name="imageUrl" placeholder="Enter image URL">
               <small class="form-text text-muted">Either upload an image file or enter an image URL.</small>
            </div>
            <button type="submit" class="btn btn-primary">Add Book</button>
         </form>
      </div>
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
      <script>
         $(document).ready(function () {
             $('.custom-file-input').on('change', function() {
                 var fileName = $(this).val().split('\\').pop();
                 $(this).next('.custom-file-label').addClass("selected").html(fileName);
             });
         });
      </script>
   </body>
</html>