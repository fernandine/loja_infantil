import { Component, Input } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SelectItem } from 'primeng/api';
import { map, Observable } from 'rxjs';

import { CartItem } from 'src/app/common/cart-item';
import { Category } from 'src/app/common/category';
import { Product } from 'src/app/common/Product';
import { CartService } from 'src/app/services/cart.service';
import { CategoryService } from 'src/app/services/category.service';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.scss']
})
export class ProductListComponent {

  @Input() products: Product[] = [];

  categories!: Category[];

  currentCategoryName: string = '';

  constructor(
    private cartService: CartService,
    private productService: ProductService,
    private categoryService: CategoryService,
    private route: ActivatedRoute
    ) { }


  ngOnInit(): void {
    this.listProducts();
    this.listCategories();
  }

  listCategories() {
    this.categoryService.getCategory().subscribe(
      data => {
        this.categories = data;
      }
    );
  }

  listProducts() {
    this.route.paramMap.subscribe(params => {
      const categoryName = params.get('name') || 'default';
      this.currentCategoryName = categoryName;
      this.productService.getProductByCategoryName(categoryName).subscribe(
        data => {
          this.products = data;
        }
      );
    });
  }

  addToCart(theProduct: Product) {
    const theCartItem = new CartItem(theProduct);
    this.cartService.addToCart(theCartItem);
  }

}
