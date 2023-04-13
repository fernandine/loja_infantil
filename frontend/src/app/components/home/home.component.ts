import { Component } from '@angular/core';
import { Product } from 'src/app/common/Product';
import { ProductService } from '../../services/product.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {

  bestSellers: Product[] = [];
  responsiveOptions = [
    {
      breakpoint: '1024px',
      numVisible: 3,
      numScroll: 3
    },
    {
      breakpoint: '768px',
      numVisible: 2,
      numScroll: 2
    },
    {
      breakpoint: '560px',
      numVisible: 1,
      numScroll: 1
    }
  ];

  constructor(private productService: ProductService) {}

  ngOnInit() {
    this.productService.getBestSellers(8).subscribe(products => {
      this.bestSellers = products;
    }, error => {
        console.error('Erro ao buscar os melhores vendedores', error);
    });
  }
}
