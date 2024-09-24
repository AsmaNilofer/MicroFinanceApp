package com.example.demo.service;

import java.util.List;
import java.sql.Timestamp;
import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

     public List<User> getAllUsers() {
        try {
            return userRepository.findAll();
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching all users: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    public List<User> getAllCustomers() {
        try {
            return userRepository.findByRole(User.Role.Customer);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching customers: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    public List<User> getAllAgents() {
        try {
            return userRepository.findByRole(User.Role.Agent);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching agents: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public User createUser(User user) {
        user.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
        user.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        return userRepository.save(user);
    }

    public User updateLastlogin(User user)
    {
        user.setLastLogin(new Timestamp(System.currentTimeMillis()));
        return userRepository.save(user);
        
    }

    public User updateUser(Long id, User userDetails) {
        User user = getUserById(id);
        if (user != null) {
            user.setName(userDetails.getName());
            user.setPassword(userDetails.getPassword());
            user.setEmail(userDetails.getEmail());
            user.setPhone(userDetails.getPhone());
            user.setRole(userDetails.getRole());
            user.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            return userRepository.save(user);
        }
        return null;
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
    // public User authenticate(String email, String password) {
    //     User user = userRepository.findByEmail(email);
    //     if (user != null && user.getPassword().equals(password)) {
    //         return user;
    //     }
    //     return null;
    // }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}