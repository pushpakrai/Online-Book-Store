package com.onlinebookstore.OnlineBookStore.services;

import com.onlinebookstore.OnlineBookStore.dao.BookDao;
import com.onlinebookstore.OnlineBookStore.dao.userDao;
import com.onlinebookstore.OnlineBookStore.models.Book;
import com.onlinebookstore.OnlineBookStore.models.User;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class userService {

    @Autowired
    private userDao userDao;
    
    @Autowired
    private BookDao bookDao;
    
//    Retrieve All Users from the Database
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }
    
//    Save a New User with a Specific Role after Validation
    @Transactional("transactionManager")
    public void saveUser(User user, String role) {
        validateUserDoesNotExists(user);
        userDao.saveUser(user, role);
    }

//    Check if a Username Already Exists in the Database
    public boolean checkUserExists(String username) {
        return userDao.userExists(username);
    }

//    Authenticate User Login Based on Username and Password
    public User checkLogin(String username, String password) {
        return userDao.getUser(username, password);
    }
    
//    Delete a User by ID from the Database
    @Transactional("transactionManager")
    public void deleteUser(long id) {
        userDao.deleteUser(id);
    }
    
//    Fetch a User by Their ID
    public User getUserById(long id) {
        return userDao.getUserById(id);
    }
    
//    Update Existing User Details
    @Transactional("transactionManager")
    public void updateUser(User user) {
        if (user == null || user.getId() == null) {
            throw new RuntimeException("Invalid user details provided");
        }
        User existingUser = userDao.getUserById(user.getId());
        if (existingUser == null) {
            throw new RuntimeException("User not found");
        }

        // Check each field to see if it's present and only then update it
        if (user.getFirstName() != null && !user.getFirstName().isEmpty()) existingUser.setFirstName(user.getFirstName());
        if (user.getLastName() != null && !user.getLastName().isEmpty()) existingUser.setLastName(user.getLastName());
        if (user.getUsername() != null && !user.getUsername().isEmpty()) existingUser.setUsername(user.getUsername());
        if (user.getEmail() != null && !user.getEmail().isEmpty()) existingUser.setEmail(user.getEmail());
        if (user.getAddress() != null && !user.getAddress().isEmpty()) existingUser.setAddress(user.getAddress());
        if (user.getRole() != null && !user.getRole().isEmpty()) existingUser.setRole(user.getRole());

        userDao.updateUser(existingUser);
    }

//    Validate that a User's Username and Email Do Not Already Exist Before Saving
    private void validateUserDoesNotExists(User user) {
        if (userDao.userExists(user.getUsername())) {
            throw new RuntimeException("Username already exists");
        }
        if (userDao.emailExists(user.getEmail())) {
            throw new RuntimeException("Email already exists");
        }
    }
   
//    Retrieve Books for a User Filtered by Category ID or All Books in Stock
    @Transactional(readOnly = true)
    public List<Book> getUserBooksByCategory(Long categoryId) {
        if (categoryId != null && categoryId > 0) {
            return bookDao.findBooksByCategory(categoryId);
        } else {
            return bookDao.findAllWithCategories().stream()
                          .filter(book -> book.getStock() > 0)
                          .collect(Collectors.toList());
        }
    }
    
//    Find a User's ID by Their Username
    public Long findUserIdByUsername(String username) {
        User user = userDao.findByUsername(username);
        return user != null ? user.getId() : null;
    }
    
//    Retrieve a User by Their Username
    @Transactional(readOnly = true)
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }
}
