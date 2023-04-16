import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SelectItem } from 'primeng/api';
import { CartItem } from 'src/app/common/cart-item';
import { Category } from 'src/app/common/category';
import { Colors } from 'src/app/common/enums/Colors.enum';
import { Sizes } from 'src/app/common/enums/Sizes.enum';
import { Product } from 'src/app/common/Product';
import { CartService } from 'src/app/services/cart.service';
import { CategoryService } from 'src/app/services/category.service';
import { ProductService } from 'src/app/services/product.service';
import { Brands } from '../../common/enums/Brands.enum';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.scss']
})
export class ProductListComponent {

  @Input() products: Product[] = [];

  sortOptions: SelectItem[] = [];
  categories!: Category[];

  currentCategoryId: number = 1;
  previousCategoryId: number = 1;
  searchMode: boolean = false;

  // new properties
  thePageNumber: number = 1;
  thePageSize: number = 10;
  theTotalElements: number = 0;
  previousKeyword: string = '';
  currentPage: number = 0;

  constructor(
    private cartService: CartService,
    private productService: ProductService,
    private route: ActivatedRoute,
    private categoryService: CategoryService) { }


  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.listProducts();
      this.listCategories();
    })
  }

  listCategories() {
    this.categoryService.getCategory().subscribe(
      data => {
        this.categories = data;
      }
    );
  }

  listProducts() {
    this.searchMode = this.route.snapshot.paramMap.has('keyword')
    if (this.searchMode) {
      this.handleSearchProducts();
    } else {
      this.handleListProducts();
    }
  }

  handleSearchProducts() {
    const theKeyword: string = this.route.snapshot.paramMap.get('keyword')!
    if (this.previousKeyword != theKeyword) {
      this.thePageNumber = 1;
    }

    this.previousKeyword = theKeyword;
    this.productService.searchProductsPaginate(this.thePageNumber - 1, this.thePageSize, theKeyword)
      .subscribe(this.processResult())
  }

  handleListProducts() {
    const routeHasCategoryId: boolean = this.route.snapshot.paramMap.has('id');

    if (routeHasCategoryId) {

      this.currentCategoryId = +this.route.snapshot.paramMap.get('id')!;
    }
    else {

      this.currentCategoryId = 1;
    }

    if (this.previousCategoryId != this.currentCategoryId) {
      this.thePageNumber = 1;
    }
    this.previousCategoryId = this.currentCategoryId;
    this.productService.getProductListPaginate(
      this.thePageNumber - 1,
      this.thePageSize,
      this.currentCategoryId).subscribe(this.processResult())
  }

  updatePageSize(pageSize: string) {
    this.thePageSize = +pageSize;
    this.thePageNumber = 1;
    this.listProducts();
  }

  processResult() {
    return (data: any) => {
      this.products = data.content;
      this.thePageSize = data.size;
      this.thePageNumber = data.number + 1;
      this.theTotalElements = data.totalElements;
    }
  }

  addToCart(theProduct: Product) {
    const theCartItem = new CartItem(theProduct);
    this.cartService.addToCart(theCartItem);
  }

  onPageChange(event: { page: number; }) {
    this.currentPage = event.page;
  }
}
