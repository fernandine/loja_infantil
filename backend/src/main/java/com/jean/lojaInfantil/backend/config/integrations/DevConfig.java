package com.jean.lojaInfantil.backend.config.integrations;

import com.jean.lojaInfantil.backend.services.EmailService;
import com.jean.lojaInfantil.backend.services.SendGridEmailService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@Profile("dev")
public class DevConfig {

    @Bean
    public EmailService emailService() {
        return new SendGridEmailService();
    }
}
