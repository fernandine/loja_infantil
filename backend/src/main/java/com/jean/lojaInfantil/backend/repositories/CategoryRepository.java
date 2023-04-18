package com.jean.lojaInfantil.backend.repositories;

import com.jean.lojaInfantil.backend.entities.Category;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.entities.enums.Brands;
import com.jean.lojaInfantil.backend.entities.enums.Colors;
import com.jean.lojaInfantil.backend.entities.enums.Sizes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
