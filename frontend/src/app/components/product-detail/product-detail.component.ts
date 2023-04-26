import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CartItem } from 'src/app/common/cart-item';
import { Sizes } from 'src/app/common/enums/Sizes.enum';
import { Product } from 'src/app/common/Product';
import { CartService } from 'src/app/services/cart.service';
import { ProductService } from 'src/app/services/product.service';
import { ReviewService } from '../../services/review.service';
import { Review } from '../../common/review';
import Decimal from 'decimal.js';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.scss']
})
export class ProductDetailComponent {

  @Input() product!: Product;
  reviews: Review[] = [];
  @Output() favoriteProductsChanged = new EventEmitter<Product>();
  quantity = 1;
  selectedSize!: Sizes;
  rating!: number;
  sizes = [
    { label: Sizes.P, value: Sizes.P },
    { label: Sizes.M, value: Sizes.M },
    { label: Sizes.G, value: Sizes.G },
    { label: Sizes.GG, value: Sizes.GG },
    { label: Sizes.SIZE_1, value: Sizes.SIZE_1 },
    { label: Sizes.SIZE_2, value: Sizes.SIZE_2 },
    { label: Sizes.SIZE_3, value: Sizes.SIZE_3 },
    { label: Sizes.SIZE_4, value: Sizes.SIZE_4 },
    { label: Sizes.SIZE_6, value: Sizes.SIZE_6 },
    { label: Sizes.SIZE_8, value: Sizes.SIZE_8 },
    { label: Sizes.SIZE_10, value: Sizes.SIZE_10 },
    { label: Sizes.SIZE_12, value: Sizes.SIZE_12 },
    { label: Sizes.SIZE_14, value: Sizes.SIZE_14 },
    { label: Sizes.SIZE_16, value: Sizes.SIZE_16 },
  ];

  constructor(
    private cartService: CartService,
    private activatedRoute: ActivatedRoute,
    private productService: ProductService,
    private reviewService: ReviewService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.listReviews();

    this.activatedRoute.paramMap.subscribe(() => {
      this.handleProductDetails()
    })
  }

  handleProductDetails() {
    const theProductId: number = +this.activatedRoute.snapshot.paramMap.get('id')!;
    this.productService.getProductById(theProductId).subscribe(
      (data: any) => {
        this.product = {
          ...data,
          unitPrice: new Decimal(data.unitPrice)
        };
      });
  }

  addToCart() {
    const theCartItem = new CartItem(this.product);
    this.cartService.addToCart(theCartItem);
    this.quantity = 1;
    this.router.navigate(["/checkout/cart-details"])
  }

  toggleFavorite(): void {
    this.productService.toggleFavorite(this.product).subscribe(
      updatedProduct => this.favoriteProductsChanged.emit(updatedProduct)
    );
  }

  isFavorite(): boolean {
    return this.product.favorite;
  }

   listReviews() {
    this.reviewService.getReview().subscribe(
      data => {
        this.reviews = data;
      }
    );
   }

   getStars(rating: number): boolean[] {
    const stars = Array(5).fill(false);
    for (let i = 0; i < Math.round(rating); i++) {
      stars[i] = true;
    }
    return stars;
  }
}

