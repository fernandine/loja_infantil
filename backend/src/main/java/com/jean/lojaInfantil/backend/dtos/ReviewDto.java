package com.jean.lojaInfantil.backend.dtos;

import com.jean.lojaInfantil.backend.entities.Review;
import com.jean.lojaInfantil.backend.entities.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {

    private Long id;
    private String comment;
    private int rating;
    private UserDto user;
    private Long productId;

    public ReviewDto(Review entity) {
        id = entity.getId();
        comment = entity.getComment();
        rating = entity.getRating();
        this.user = (new UserDto(user));
        productId = entity.getProduct().getId();
    }

    public ReviewDto(Review entity, User user) {
        id = entity.getId();
        comment = entity.getComment();
        this.user = new UserDto(user);
        productId = entity.getProduct().getId();
    }
}
