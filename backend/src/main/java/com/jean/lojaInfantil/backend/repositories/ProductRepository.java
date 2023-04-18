package com.jean.lojaInfantil.backend.repositories;

import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.entities.enums.Brands;
import com.jean.lojaInfantil.backend.entities.enums.Colors;
import com.jean.lojaInfantil.backend.entities.enums.Sizes;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    

    //BUSCA OS FAVORITOS
    @Query("SELECT obj FROM Product obj WHERE "
            + "(:notFavorite = false OR obj.favorite = false) ")
    List<Product> find(boolean notFavorite);

    //BUSCA OS PRODUTOS MAIS VENDIDOS
    @Query("SELECT p FROM Product p ORDER BY p.salesCount DESC")
    List<Product> findBestSellers(Pageable pageable);

    // BUSCA OS PRODUTOS MAIS RECENTES COM BASE NA DATA DE CRIAÇÃO
    @Query("SELECT p FROM Product p ORDER BY p.dateCreated DESC")
    List<Product> findMostRecentProductsByCreationDate(Pageable pageable);

    //FILTRA OS PRODUTOS POR MARCA, COR E TAMANHO
    @Query("SELECT DISTINCT p FROM Product p " +
            "JOIN p.category c " +
            "WHERE (:productBrand IS NULL OR p.productBrand IN :productBrand) " +
            "AND (:productColor IS NULL OR p.productColor IN :productColor) " +
            "AND (:productSize IS NULL OR p.productSize IN :productSize) " +
            "AND (:categoryId IS NULL OR c.id = :categoryId)")
    List<Product> findByBrandsAndColorsAndSizesAndCategoryId(
            @Param("productBrand") List<Brands> productBrands,
            @Param("productColor") List<Colors> productColors,
            @Param("productSize") List<Sizes> productSizes,
            @Param("categoryId") Long categoryId
    );

    @Query("SELECT p FROM Product p JOIN p.category c WHERE c.name = :name")
    List<Product> findByNameCategory(@Param("name") String name);
}





