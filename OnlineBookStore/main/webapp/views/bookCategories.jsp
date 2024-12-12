<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Manage Book Categories</title>
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
         <h2 class="text-center mb-4">Book Categories</h2>
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategoryModal">Add Category</button>
         <!-- Modal for Adding Category -->
         <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="addCategoryModalLabel">New Category</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <form action="/admin/addBookCategory" method="post">
                        <div class="mb-3">
                           <label for="name" class="form-label">Category Name</label>
                           <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                           <button type="submit" class="btn btn-primary">Add Category</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
         <table class="table table-striped mt-3">
            <thead class="thead-dark">
               <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Name</th>
                  <th scope="col">Delete</th>
                  <th scope="col">Edit</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="category" items="${bookCategories}">
                  <tr>
                     <td>${category.id}</td>
                     <td>${category.name}</td>
                     <td>
                        <form action="/admin/deleteBookCategory" method="post">
                           <input type="hidden" name="id" value="${category.id}" />
                           <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this category?')">Delete</button>
                        </form>
                     </td>
                     <td>
                        <!-- Edit Button -->
                        <button type="button" class="btn btn-primary edit-button" data-toggle="modal" 
                           data-target="#editCategoryModal${category.id}">
                        Edit
                        </button>
                        <!-- Modal for Editing Category -->
                        <div class="modal fade" id="editCategoryModal${category.id}" tabindex="-1" aria-labelledby="editCategoryModalLabel${category.id}" aria-hidden="true">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="editCategoryModalLabel${category.id}">Edit Category</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="modal-body">
                                    <form action="/admin/updateBookCategory" method="post">
                                       <input type="hidden" name="id" value="${category.id}">
                                       <div class="mb-3">
                                          <label for="editCategoryName${category.id}">Category Name:</label>
                                          <input type="text" class="form-control" id="editCategoryName${category.id}" 
                                             name="name" value="${category.name}" required>
                                       </div>
                                       <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                          <button type="submit" class="btn btn-primary">Save Changes</button>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>
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