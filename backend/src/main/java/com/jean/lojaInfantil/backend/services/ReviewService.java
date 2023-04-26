package com.jean.lojaInfantil.backend.services;

import com.jean.lojaInfantil.backend.dtos.ReviewDto;
import com.jean.lojaInfantil.backend.entities.Product;
import com.jean.lojaInfantil.backend.entities.Review;
import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.repositories.ProductRepository;
import com.jean.lojaInfantil.backend.repositories.ReviewRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository repository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthService authService;

    @Autowired
    private ModelMapper modelMapper;

    @Transactional(readOnly = true)
    public List<ReviewDto> findAll() {
        List<Review> list = repository.findAll();
        return list.stream()
                .map(order -> modelMapper.map(order, ReviewDto.class))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public ReviewDto insert(ReviewDto dto) {
        Review entity = new Review();
      User user = authService.authenticated();
        copyEntityToDTO(user, entity, dto);
        entity = repository.save(entity);
        return modelMapper.map(entity, ReviewDto.class);
    }

    public void copyEntityToDTO(User user, Review entity, ReviewDto dto) {

        entity.setComment(dto.getComment());

        Product product = productRepository.getReferenceById(dto.getProductId());
        entity.setProduct(product);

        user.setId(userService.getAuthUser().getId());
        user.setFirstName(userService.getAuthUser().getFirstName());
        user.setLastName(userService.getAuthUser().getLastName());
        user.setEmail(userService.getAuthUser().getEmail());
        entity.setUser(user);
    }
}
