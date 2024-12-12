# Online Book Store

## Description
Online Book Store is a comprehensive web application designed for browsing, managing, and purchasing books. This platform supports extensive features like user registration, admin controls, shopping carts, and order management. Developed using Spring Boot and Hibernate for the backend, JSP for frontend rendering, and CSS for styling, it's an ideal project for educational purposes or commercial deployment by small to medium-sized book retailers.

## Features
- **User Authentication**: Secure login and registration system with encrypted passwords and session management.
- **Admin Dashboard**: Full control over book inventory including add, update, and delete capabilities, along with category management and order overview.
- **Book Management**: Detailed management of book details such as ISBN, title, author, price, and description.
- **Shopping Cart**: Advanced cart functionalities including add, remove, and quantity adjustments with real-time updates.
- **Order Management**: Users can place orders, view their order history, and track order status.

## Tech Stack
- **Backend**: Spring Boot, Hibernate ORM for database interactions.
- **Frontend**: JSP for dynamic content rendering, CSS for styling.
- **Database**: MySQL for data storage.
- **Security**: Integrated with Spring Security for robust authentication and authorization.
- **Build Tool**: Maven for managing dependencies and building the project.

## Prerequisites
Before you begin, ensure you have the following installed:
- Java JDK 11 or later.
- Maven 3.6 or higher.
- MySQL 5.7 or later.

## Project Structure

Below is a breakdown of the key directories and files within the project:

```plaintext
src/
│
├── main/
│   ├── java/
│   │   ├── config/         # Configuration files for Spring and database
│   │   ├── controller/     # Controllers to handle request mapping
│   │   ├── model/          # Entity models for Hibernate
│   │   ├── repository/     # Repository interfaces for database access
│   │   └── service/        # Services for business logic
│   ├── resources/
│   │   └── application.properties  # Configuration settings
│   └── webapp/
│       ├── WEB-INF/
│       └── static/         # Static resources like CSS and JavaScript
└── pom.xml                # Maven project file



## Setup and Installation
1. **Clone the Repository:**

2. **Database Setup:**
- Create a new MySQL database:
  ```
  CREATE DATABASE onlinebookstore;
  USE onlinebookstore;
  ```
- Import the SQL schema and initial data:
  ```
  mysql -u yourusername -p onlinebookstore < OBS.sql
  ```

3. **Configure Application Properties:**
- Open `src/main/resources/application.properties`.
- Set your database URL, username, and password:
  ```
  spring.datasource.url=jdbc:mysql://localhost:3306/onlinebookstore
  spring.datasource.username=yourusername
  spring.datasource.password=yourpassword
  ```

4. **Build the Application:**
mvn clean install

5. **Run the Application:**
mvn spring-boot:run


## Usage
After running the application, open your web browser and navigate to `http://localhost:8080`. You can register as a new user, browse books, add them to your cart, and simulate purchase transactions.

## Contributing
We encourage contributions from the community, whether it is fixing bugs, improving documentation, or suggesting new features. Please use GitHub issues and pull requests:

1. Fork the repository.
2. Create a new branch for your changes.
3. Develop and test your changes.
4. Submit a pull request.
