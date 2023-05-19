import { Component } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import Decimal from 'decimal.js';
import { Observable } from 'rxjs';
import { CartItem } from 'src/app/common/cart-item';

@Component({
  selector: 'app-order-item',
  templateUrl: './order-item.component.html',
  styleUrls: ['./order-item.component.scss']
})
export class OrderItemComponent {

cartItems$!: Observable<CartItem[]>;
itemsForm!: FormGroup;
subtotal: Decimal = new Decimal(0);
total: Decimal = new Decimal(0);
currentUser: any;
discountValue: Decimal = new Decimal(0);

constructor(private formBuilder: FormBuilder) {}

  ngOnInit() {

    this.itemsForm = this.formBuilder.group({
      subtotal: [null],
      totalValue: [null],
      imageUrl: [''],
      price: [null],
      quantity: [null],
      productId: [''],
      orderId: [''],
    })
  }

  getSubtotal(): Decimal {
    let subtotal = new Decimal(0);

    this.cartItems$.subscribe((cartItems) => {
      cartItems.forEach((item) => {
        subtotal = subtotal.plus(new Decimal(item.price).times(item.quantity));
      });
      // Armazena o valor subtotal no estado do componente
      this.subtotal = subtotal;
    });

    return subtotal || new Decimal(0);
  }

  public getTotal(): Decimal {
    const subtotal = this.getSubtotal();
    const discountAmount = subtotal.times(this.discountValue);
    const total = subtotal.minus(discountAmount);

    // Armazena o valor total no estado do componente
    this.total = total;

    return total;
  }

  public decreaseQuantity(item: CartItem): void {
    if (item.quantity > 1) {
      item.quantity--;
    }
  }

  getDiscountPercentage(discountValue: Decimal): string {
    return `${new Decimal(discountValue).times(100)}%`;
  }

}
