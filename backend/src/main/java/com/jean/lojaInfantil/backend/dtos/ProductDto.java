package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto implements Serializable {

    private Long id;
    private String sku;
    private String name;
    private String description;
    private BigDecimal unitPrice;
    private String image;
    private boolean favorite;
    private int unitsInStock;
    private Date dateCreated;
    private Date lastUpdated;
    private CategoryDto category;

    public ProductDto(Product entity) {
        id = entity.getId();
        sku = entity.getSku();
        name = entity.getName();
        description = entity.getDescription();
        unitPrice = entity.getUnitPrice();
        image = entity.getImage();
        favorite = entity.isFavorite();
        unitsInStock = entity.getUnitsInStock();
        dateCreated = entity.getDateCreated();
        lastUpdated = entity.getLastUpdated();
        category = new CategoryDto(entity.getCategory());
    }
}
