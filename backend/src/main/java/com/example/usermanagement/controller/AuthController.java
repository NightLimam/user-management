package com.example.usermanagement.controller;


import com.example.usermanagement.entity.User;
import com.example.usermanagement.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {


private final AuthService authService;


@PostMapping("/register")
public ResponseEntity<User> register(@RequestBody User user) {
User savedUser = authService.register(user);
return ResponseEntity.ok(savedUser);
}


@PostMapping("/login")
public ResponseEntity<String> login(@RequestBody User user) {
String token = authService.login(user, user.getPassword());
return ResponseEntity.ok(token);
}
}