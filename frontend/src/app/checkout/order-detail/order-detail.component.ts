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

  constructor(
    private route: ActivatedRoute,
    private orderService: OrderService
    ) { }

    ngOnInit(): void {
      this.orderId = Number(this.route.snapshot.paramMap.get("id"));
      this.orderService.getOrderById(this.orderId).subscribe(
        (data) => {
          console.log('dados' + JSON.stringify(data));
          this.orderDetails = data;
        },
        (error) => {
          console.log(error);
        }
      );
    }
  }
