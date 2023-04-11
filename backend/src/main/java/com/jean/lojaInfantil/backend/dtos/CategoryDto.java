package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDto implements Serializable {

    private Long id;
    private String name;

    public CategoryDto(Category entity) {
        id = entity.getId();
        name = entity.getName();
    }
}
