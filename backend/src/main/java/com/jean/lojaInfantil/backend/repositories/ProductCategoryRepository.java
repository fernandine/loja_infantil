package com.jean.lojaInfantil.backend.repositories;

import com.jean.lojaInfantil.backend.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductCategoryRepository extends JpaRepository<Category, Long> {
}
