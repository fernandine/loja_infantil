package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.repositories.UserRepository;
import com.jean.lojaInfantil.backend.services.exceptions.ResourceNotFoundException;
import com.jean.lojaInfantil.backend.services.exceptions.UnauthorizedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public User authenticated() {
        try {
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            return userRepository.findByEmail(username);
        } catch (Exception e) {
            throw new UnauthorizedException("Invalid user");
        }
    }

    public void validadeMember(Long userId) {
        User user = authenticated();
        if (!user.hasHole("ROLE_USER")) {
            throw new ResourceNotFoundException("Invalid user");
        }
    }
}