<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>My Orders - Online Bookstore</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   </head>
   <body class="bg-light">
      <!-- Navigation bar, similar to the one provided -->
      <!--... -->
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
                  <li class="nav-item"><a class="nav-link" href="/user/home">Home</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/profile">Profile</a></li>
                  <li class="nav-item active"><a class="nav-link" href="/user/orders">My Orders</a></li>
                  <li class="nav-item"><a class="nav-link" href="/">Logout</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <div class="container mt-4">
         <div class="jumbotron text-center">
            <h1 class="display-4">My Orders</h1>
            <hr>
            <p>View your order history here!</p>
         </div>
         <!-- Order List -->
         <div class="row mt-3">
            <c:forEach var="order" items="${userOrders}">
               <div class="col-md-12">
                  <div class="card mb-4">
                     <div class="card-body">
                        <h5 class="card-title">Order #${order.orderId}</h5>
                        <p class="card-text">Order Date: ${order.orderDate}</p>
                        <p class="card-text">Total: ${order.totalPrice}</p>
                        <!-- Modify this line -->
                        <p class="card-text">Status: ${order.status}</p>
                        <!-- Order Details Button -->
                        <a href="/user/orderDetails/${order.orderId}" class="btn btn-primary">View Order Details</a>
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