package com.jean.lojaInfantil.backend.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jean.lojaInfantil.backend.entities.enums.Brands;
import com.jean.lojaInfantil.backend.entities.enums.Colors;
import com.jean.lojaInfantil.backend.entities.enums.Sizes;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.hateoas.RepresentationModel;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;

@Entity
@Table(name="product")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Product extends RepresentationModel<Product> implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "sku")
    private String sku;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "unit_price")
    private BigDecimal unitPrice;
    @Column(name = "image")
    private String image;
    @Column(name = "favorite")
    private boolean favorite;
    @Column(name = "units_in_stock")
    private int unitsInStock;
    @Column(name = "date_created")
    @JsonFormat(pattern="dd/MM/yyyy")
    private LocalDate dateCreated;

    @Column(name = "sales_count")
    private int salesCount;
    @Enumerated(EnumType.STRING)
    @Column(name = "product_color")
    private Colors productColor;
    @Enumerated(EnumType.STRING)
    @Column(name = "product_brand")
    private Brands productBrand;
    @Enumerated(EnumType.STRING)
    @Column(name = "product_size ")
    private Sizes productSize;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;
    @JsonIgnore
    @OneToMany(mappedBy = "product")
    private List<Review> reviews = new ArrayList<>();
    @JsonIgnore
    @OneToMany(mappedBy = "product")
    private List<Discount> discounts = new ArrayList<>();

    @JsonIgnore
    @OneToMany(mappedBy = "id.product", fetch = FetchType.EAGER)
    private Set<OrderItem> items = new HashSet<>();

//    @JsonIgnore
//    public List<Order> getOrders() {
//        List<Order> list = new ArrayList<>();
//        for(OrderItem orderItem : items) {
//            list.add(orderItem.getOrder());
//        }
//        return list;
//    }

}