-- Create schema for Online Book Store
CREATE DATABASE OBS;

USE OBS;

-- Create table for users
CREATE TABLE users (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL,
  address VARCHAR(255),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  PRIMARY KEY (id),
  UNIQUE INDEX username_UNIQUE (username ASC),
  UNIQUE INDEX email_UNIQUE (email ASC)
);

-- Create table for categories
CREATE TABLE book_categories (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for books
CREATE TABLE books (
    book_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    image VARCHAR(255),
    price DECIMAL(10, 2),
    stock INT,
    description TEXT,
    category_id BIGINT,
    FOREIGN KEY (category_id) REFERENCES book_categories(id)
);

CREATE TABLE carts (
    cart_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create table for carts
CREATE TABLE cart_books (
    cart_book_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    quantity INT,
    FOREIGN KEY (cart_id) REFERENCES carts(cart_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE orders (
  order_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  order_date DATETIME NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(50) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
