package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.EmailDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class MockEmailService implements EmailService {

    private static Logger LOG = LoggerFactory.getLogger(MockEmailService.class);
    public void sendEmail(EmailDto dto) {
            LOG.info("Sending email to: " + dto.getTo());
            LOG.info("Email sent!");
        }
}
