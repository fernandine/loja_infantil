package com.jean.lojaInfantil.backend.repositories;

import com.jean.lojaInfantil.backend.dtos.ProductDto;
import com.jean.lojaInfantil.backend.entities.Category;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.entities.enums.Brands;
import com.jean.lojaInfantil.backend.entities.enums.Colors;
import com.jean.lojaInfantil.backend.entities.enums.Sizes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    //BUSCA POR CATEGORIA
    @Query("SELECT DISTINCT obj FROM Product obj WHERE "
            + ":category IS NULL OR obj.category IN :category")
    Page<Product> findByCategoryId(Category category, Pageable pageable);

    //BUSCA POR NOME
    Page<Product> findByName(@Param("name") String name, Pageable pageable);

    //BUSCA OS FAVORITOS
    @Query("SELECT obj FROM Product obj WHERE "
            + "(:notFavorite = false OR obj.favorite = false) ")
    List<Product> find(boolean notFavorite);

    //BUSCA OS PRODUTOS MAIS VENDIDOS
    @Query("SELECT p FROM Product p ORDER BY p.salesCount DESC")
    List<Product> findBestSellers(Pageable pageable);

    // Busca os produtos mais recentes com base na data de criação
    @Query("SELECT p FROM Product p ORDER BY p.dateCreated DESC")
    List<Product> findMostRecentProductsByCreationDate(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE (:productBrand IS NULL OR p.productBrand = :productBrand) " +
            "AND (:productColor IS NULL OR p.productColor = :productColor) " +
            "AND (:productSize IS NULL OR p.productSize = :productSize)")
    List<Product> findByBrandsAndColorsAndSizes(@Param("productBrand") Brands productBrand,
                                                @Param("productColor") Colors productColor,
                                                @Param("productSize") Sizes productSize);

}


