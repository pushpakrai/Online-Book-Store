<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>User Profile - Online Bookstore</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   </head>
   <body class="bg-light">
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
                  <li class="nav-item"><a class="nav-link" href="/user/cart">Cart</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/orders?userId=${user.id}">My Orders</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/logout">Logout</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <div class="container mt-4">
         <div class="jumbotron text-center">
            <h1 class="display-4">User Profile</h1>
            <hr>
         </div>
         <div class="row">
            <div class="col-md-6 offset-md-3">
               <h2>Profile Information</h2>
               <form action="/user/updateProfile" method="POST"> <!-- Assuming the update profile endpoint is /user/updateProfile -->
                  <div class="form-group">
                     <label for="firstName">First Name:</label>
                     <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}"  readonly>
                  </div>
                  <div class="form-group">
                     <label for="lastName">Last Name:</label>
                     <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}"  readonly>
                  </div>
                  <div class="form-group">
                     <label for="username">Username:</label>
                     <input type="text" class="form-control" id="username" name="username" value="${user.username}"  readonly>
                  </div>
                  <div class="form-group">
                     <label for="email">Email:</label>
                     <input type="email" class="form-control" id="email" name="email" value="${user.email}">
                  </div>
                  <div class="form-group">
                     <label for="address">Address:</label>
                     <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                  </div>
                  <button type="submit" class="btn btn-primary">Update Profile</button> <!-- Update Profile Button -->
               </form>
            </div>
         </div>
      </div>
      <!-- Bootstrap JS and jQuery -->
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   </body>
</html>
