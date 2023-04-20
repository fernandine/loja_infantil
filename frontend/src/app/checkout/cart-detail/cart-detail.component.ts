import { Component } from '@angular/core';
import { SelectItem } from 'primeng/api';
import { CartItem } from 'src/app/common/cart-item';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-cart-detail',
  templateUrl: './cart-detail.component.html',
  styleUrls: ['./cart-detail.component.scss']
})
export class CartDetailComponent {

  cartItems: CartItem[] = [];
  totalPrice: number = 0;
  totalQuantity: number = 0;
  discountValue: number = 0;

  quantity: SelectItem[] = [
    {label: '1', value: 1},
    {label: '2', value: 2},
    {label: '3', value: 3},
    {label: '4', value: 4},
    {label: '5', value: 5},
    {label: '6', value: 6},
    {label: '7', value: 7}
  ];


  constructor(private cartService: CartService) {
    this.cartService.cartItemsChanged.subscribe(
      () => {
        this.listCartDetails();
      }
    );
   }

  ngOnInit(): void {
    this.listCartDetails();
  }

  listCartDetails() {
    this.cartItems = this.cartService.cartItems;
    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );
    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );
    this.cartService.discountValue.subscribe(
      data => this.discountValue = data // armazena o valor do desconto na propriedade local
    );
    this.cartService.computeCartTotals(this.discountValue);
  }

  incrementQuantity(theCartItem: CartItem) {
    this.cartService.addToCart(theCartItem);
  }

  remove(theCartItem: CartItem) {
    this.cartService.remove(theCartItem);
  }

  getSubtotal(): number {
    return this.cartItems.map(t => t.unitPrice * t.quantity).reduce((acc, value) => acc + value, 0);
  }

  getTotal(): number {
    return this.cartItems.map(t => t.unitPrice * t.quantity - this.discountValue).reduce((acc, value) => acc + value, 0);
  }
}

