import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { MenuItem } from 'primeng/api';
import { Category } from 'src/app/common/category';
import { CartService } from 'src/app/services/cart.service';
import { CategoryService } from '../../services/category.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {

  categories: Category[] = [];

  constructor(
    private cartService: CartService,
    private route: ActivatedRoute,
    private categoryService: CategoryService) { }

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

}
