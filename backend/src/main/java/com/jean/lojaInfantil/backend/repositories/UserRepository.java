package com.jean.lojaInfantil.backend.repositories;

import com.jean.lojaInfantil.backend.entities.User;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);


}
