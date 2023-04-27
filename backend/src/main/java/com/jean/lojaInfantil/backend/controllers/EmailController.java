package com.jean.lojaInfantil.backend.controllers;

import com.jean.lojaInfantil.backend.dtos.EmailDto;
import com.jean.lojaInfantil.backend.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/emails")
public class EmailController {

    @Autowired
    private EmailService emailService;

    @PostMapping
    public ResponseEntity<Void> send(@RequestBody EmailDto dto) {
        emailService.sendEmail(dto);
        return ResponseEntity.noContent().build();
    }
}
