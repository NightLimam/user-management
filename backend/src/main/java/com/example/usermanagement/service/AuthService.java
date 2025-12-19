package com.example.usermanagement.service;


import com.example.usermanagement.entity.User;
import com.example.usermanagement.security.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class AuthService {


private final JwtService jwtService;
private final PasswordEncoder passwordEncoder;


public String login(User user, String rawPassword) {
if (!passwordEncoder.matches(rawPassword, user.getPassword())) {
throw new RuntimeException("Invalid credentials");
}
return jwtService.generateToken(user.getUsername());
}


public User register(User user) {
user.setPassword(passwordEncoder.encode(user.getPassword()));
user.setRole("ROLE_USER");
return user;
}
}