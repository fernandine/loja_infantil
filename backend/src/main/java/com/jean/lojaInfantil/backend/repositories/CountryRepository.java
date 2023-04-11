package com.jean.lojaInfantil.backend.repositories;


import com.jean.lojaInfantil.backend.entities.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends JpaRepository<Country, Long> {
}
