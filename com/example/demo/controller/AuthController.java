package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.demo.dto.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        User user = userService.findByEmail(loginRequest.getEmail());

        if (user != null && user.getPassword().equals(loginRequest.getPassword())) {
            Map<String, Object> response = new HashMap<>();
            response.put("userId", user.getUserId());
            response.put("name", user.getName());
            response.put("role", user.getRole().name());  // Return the role (Admin, Agent, Customer)
            userService.updateLastlogin(user);
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(401).body("Invalid email or password.");
        }
    }
}
