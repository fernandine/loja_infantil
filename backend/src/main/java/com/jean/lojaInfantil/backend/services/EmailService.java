package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.EmailDto;

public interface EmailService {

    void sendEmail(EmailDto dto);
}
