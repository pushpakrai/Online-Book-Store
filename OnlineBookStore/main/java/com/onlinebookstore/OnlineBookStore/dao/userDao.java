package com.onlinebookstore.OnlineBookStore.dao;

import com.onlinebookstore.OnlineBookStore.models.Cart;
import com.onlinebookstore.OnlineBookStore.models.User;
import com.onlinebookstore.OnlineBookStore.exceptions.DataAccessException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class userDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public userDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

//    Retrieve All Users from the Database
    public List<User> getAllUsers() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM User", User.class).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataAccessException("Failed to retrieve all users", e);
        }
    }
    
//    Save or Update a User with Specified Role
    public void saveUser(User user, String role) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            
            if (user.getCart() == null) { 
                Cart newCart = new Cart();
                newCart.setUser(user); 
                user.setCart(newCart); 
            }
            user.setRole(role);
            session.saveOrUpdate(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            throw new DataAccessException("Failed to save user", e);
        }
    }

//    Check if an Email Already Exists in the Database
    public boolean emailExists(String email) {
        try (Session session = sessionFactory.openSession()) {
            User user = session.createQuery("from User where email = :email", User.class)
                    .setParameter("email", email)
                    .uniqueResult();
            return user != null;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    Check if a Username Already Exists in the Database
    public boolean userExists(String username) {
        try (Session session = sessionFactory.openSession()) {
            User user = session.createQuery("from User where username = :username", User.class)
                    .setParameter("username", username)
                    .uniqueResult();
            return user != null;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    Retrieve a User by Username and Password
    public User getUser(String username, String password) {
        try (Session session = sessionFactory.openSession()) {
            User user = session.createQuery("from User where username = :username and password = :password", User.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .uniqueResult();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

//    Delete a User by ID from the Database
    public void deleteUser(long id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            User user = session.get(User.class, id);
            if (user != null) {
                session.delete(user);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            throw new DataAccessException("Failed to delete user", e);
        }
    }

//    Fetch a User by ID
    public User getUserById(long id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(User.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataAccessException("Failed to retrieve user by ID", e);
        }
    }

//    Retrieve a User by ID Including Their Orders
    public User getUserByIdWithOrders(long id) {
        User user = null;
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            user = session.createQuery("SELECT u FROM User u LEFT JOIN FETCH u.orders WHERE u.id = :userId", User.class)
                          .setParameter("userId", id)
                          .uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new DataAccessException("Failed to retrieve user by ID", e);
        }
        return user;
    }

//    Update User Details in the Database
    public void updateUser(User user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            throw new DataAccessException("Failed to update user", e);
        }
    }

//    Find a User by Their Username
    public User findByUsername(String username) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM User WHERE username = :username", User.class)
                          .setParameter("username", username)
                          .uniqueResult();
        }
    }   

    
}
