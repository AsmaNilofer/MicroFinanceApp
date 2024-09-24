package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/view/all")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/view/customers")
    public List<User> getAllCustomers() {
        return userService.getAllCustomers();
    }

    @GetMapping("/view/agents")
    public List<User> getAllAgents() {
        return userService.getAllAgents();
    }

    @GetMapping("/view/{id}")
    public User getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PostMapping("/add")
    public User createUser(@RequestBody User user) {
        return userService.createUser(user);
    }

    @PutMapping("/update/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        return userService.updateUser(id, userDetails);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        try {
            userService.deleteUser(id);
            return ResponseEntity.ok().build(); // Return 200 OK if successful
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Return 500 if an error occurs
        }
    }
    


}
