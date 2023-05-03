import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import Decimal from 'decimal.js';
import { Observable } from 'rxjs';
import { Address } from 'src/app/common/address';
import { CartItem } from 'src/app/common/cart-item';
import { Order } from 'src/app/common/order';
import { OrderItem } from 'src/app/common/order-item';
import { Product } from 'src/app/common/Product';
import { OrderService } from 'src/app/services/order.service';
import { ProductService } from '../../services/product.service';

@Component({
  selector: 'app-order-detail',
  templateUrl: './order-detail.component.html',
  styleUrls: ['./order-detail.component.scss']
})
export class OrderDetailComponent {

  orderId!: number;
  orderDetails: any;
  productDetails: any;
  paymentDetails: any; // Adicione esta propriedade
subtotal: number = 0;
  totalComDesconto: number = 0;

  constructor(
    private route: ActivatedRoute,
    private orderService: OrderService,
    private productService: ProductService
    ) { }

    ngOnInit(): void {
       this.orderId = Number(this.route.snapshot.paramMap.get("id"));
       this.orderService.getOrderById(this.orderId).subscribe(
        (data) => {
          console.log('dados' + JSON.stringify(data));
          this.orderDetails = data;

          // Calcula o subtotal e o total com desconto
        const item = this.orderDetails.items[0];
        this.subtotal = item.subtotal;
        this.totalComDesconto = item.totalValue;

          // Busca os detalhes do produto
          this.productService.getProductById(this.orderDetails.items[0].productId).subscribe(
            (productData) => {
              console.log('detalhes do produto' + JSON.stringify(productData));
              this.productDetails = productData;
            },
            (error) => {
              console.log(error);
            }
          );

          // Acessa o endereço de entrega do usuário
          const address = this.orderDetails.user.addressList[0];
          console.log('endereço de entrega' + JSON.stringify(address));
        },
        (error) => {
          console.log(error);
        }
      );

      this.orderService.getOrderById(this.orderId).subscribe(
        (data) => {
          console.log('dados' + JSON.stringify(data));
          this.orderDetails = data;
          this.paymentDetails = this.orderDetails.payment;
        },
        (error) => {
          console.log(error);
        }
      );
  }




}

