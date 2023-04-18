import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Category } from 'src/app/common/category';
import { Product } from 'src/app/common/Product';
import { CategoryService } from '../../services/category.service';
import { ProductService } from '../../services/product.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {

  categories: Category[] = [];

  constructor(
    private route: ActivatedRoute,
    private categoryService: CategoryService,
    private router: Router) { }

  ngOnInit() {
    this.route.paramMap.subscribe(() => {
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

  handleCategoryClick(category: Category) {
    this.categoryService.setSelectedCategory(category);
    const categoryName = category.name;
    this.router.navigateByUrl(`products/categories/${categoryName}`);
  }
}
