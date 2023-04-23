import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private cartItemsSubject = new BehaviorSubject<CartItem[]>([]);
  public cartItems$ = this.cartItemsSubject.asObservable();
  public totalQuantity = new BehaviorSubject<number>(0);

  constructor() {}

  public addCartItem(cartItem: CartItem) {
    const currentCartItems = this.cartItemsSubject.getValue();
    const existingCartItemIndex = currentCartItems.findIndex(item => item.id === cartItem.id && item.color === cartItem.color && item.size === cartItem.size);

    if (existingCartItemIndex > -1) {
      currentCartItems[existingCartItemIndex].quantity += cartItem.quantity;
    } else {
      currentCartItems.push(cartItem);
    }

    this.cartItemsSubject.next(currentCartItems);
    this.totalQuantity.next(currentCartItems.reduce((acc, item) => acc + item.quantity, 0));
  }

  public removeCartItem(cartItem: CartItem) {
    const currentCartItems = this.cartItemsSubject.getValue();
    const cartItemIndex = currentCartItems.findIndex(item => item.id === cartItem.id && item.color === cartItem.color && item.size === cartItem.size);

    if (cartItemIndex > -1) {
      currentCartItems.splice(cartItemIndex, 1);
      this.cartItemsSubject.next(currentCartItems);
      this.totalQuantity.next(currentCartItems.reduce((acc, item) => acc + item.quantity, 0));
    }
  }

  public clearCart() {
    this.cartItemsSubject.next([]);
    this.totalQuantity.next(0);
  }

  // Adicione essa função
  public addToCart(cartItem: CartItem) {
    this.addCartItem(cartItem);
  }
}
