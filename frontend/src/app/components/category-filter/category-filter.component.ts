import { Component, Input} from '@angular/core';
import { ProductService } from '../../services/product.service';
import { Brands } from '../../common/enums/Brands.enum';
import { Sizes } from '../../common/enums/Sizes.enum';
import { Colors } from 'src/app/common/enums/Colors.enum';
import { Product } from 'src/app/common/Product';
import { ActivatedRoute, Router } from '@angular/router';
import { Category } from '../../common/category';
import { CategoryService } from '../../services/category.service';

@Component({
  selector: 'app-category-filter',
  templateUrl: './category-filter.component.html',
  styleUrls: ['./category-filter.component.scss']
})
export class CategoryFilterComponent {

  filteredProducts: Product[] = [];
  selectedCategory!: Category;

  brands: { key: string, value: string, selected: boolean }[] = [];
  colors: { key: string, value: string, selected: boolean }[] = [];
  sizes: { key: string, value: string, selected: boolean }[] = [];

  selectedBrandsObj: {[key in string]?: boolean} = {};
  selectedColorsObj: {[key in string]?: boolean} = {};
  selectedSizesObj: {[key in string]?: boolean} = {};

  constructor(
    private productService: ProductService,
    private route: ActivatedRoute,
    private router: Router,
    private categoryService: CategoryService
  ) { }

  ngOnInit(): void {

    this.brands = Object.keys(Brands).map(value => ({ key: value, value, selected: false }));
    this.colors = Object.keys(Colors).map(value => ({ key: value, value, selected: false }));
    this.sizes = Object.keys(Sizes).map(value => ({ key: value, value, selected: false }));

    console.log('selectedBrands:', this.brands);
    console.log('selectedColors:', this.colors);
    console.log('selectedSizes:', this.colors);

    this.route.queryParams.subscribe(params => {
      const brandFilters = params['brand'] || [];
      const colorFilters = params['color'] || [];
      const sizeFilters = params['size'] || [];
      this.filterProducts(brandFilters, colorFilters, sizeFilters);
    });

    this.categoryService.getSelectedCategory().subscribe((category: Category) => {
      this.selectedCategory = category;
      const categoryId = category.id;
      this.router.navigate([`/categories/${categoryId}`], { relativeTo: this.route });
    });

  }

  filterProducts(brandFilters: string[], colorFilters: string[], sizeFilters: string[]): void {
    this.productService.getProductsByFilters(brandFilters, colorFilters, sizeFilters)
      .subscribe(products => {
        this.filteredProducts = products;
      });
  }
  applyFilters(): void {
    const brandFilters: string[] = this.brands.filter(brand => brand.selected).map(brand => brand.value);
    const colorFilters: string[] = this.colors.filter(color => color.selected).map(color => color.value);
    const sizeFilters: string[] = this.sizes.filter(size => size.selected).map(size => size.value);
    // Verifique se algum filtro foi selecionado
    const filtersSelected = brandFilters.length > 0 || colorFilters.length > 0 || sizeFilters.length > 0;
    // Chame a função de filtro de produtos com os filtros selecionados
    this.filterProducts(brandFilters, colorFilters, sizeFilters);
    if (!filtersSelected) {
      // Nenhum filtro selecionado, redirecionar para a URL atual
      const currentUrl = this.router.url;
      this.router.navigateByUrl('/', {skipLocationChange: true}).then(() => {
        this.router.navigate([currentUrl]);
      });
    }
  }
}
