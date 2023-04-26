package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Review;
import com.jean.lojaInfantil.backend.entities.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collector;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto implements Serializable {

    private Long id;
    private String comment;
    private int rating;
    private UserDto user;
    private Long productId;

}
