import { Injectable } from '@angular/core';
import Decimal from 'decimal.js';
import { BehaviorSubject } from 'rxjs';
import { CartItem } from '../common/cart-item';
import { StorageService } from './storage.service';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private cartItemsSubject = new BehaviorSubject<CartItem[]>([]);
  public cartItems$ = this.cartItemsSubject.asObservable();
  public totalQuantity = new BehaviorSubject<number>(0);
  private storage = new StorageService();
  private discountValue: Decimal = new Decimal(0);

  constructor() {}

  addCartItem(cartItem: CartItem) {
    const currentCartItems = this.cartItemsSubject.getValue();
    const existingCartItemIndex = currentCartItems.findIndex(item => item.id === cartItem.id);

    if (existingCartItemIndex > -1) {
      currentCartItems[existingCartItemIndex].quantity += cartItem.quantity;
    } else {
      currentCartItems.push(cartItem);
    }
  }

  setDiscountValue(discountValue: Decimal): void {
    this.discountValue = discountValue;
  }

  getDiscountValue(): Decimal {
    return this.discountValue;
  }

  getStoredCartItems(): CartItem[] {
    return this.storage.getItem('cartItems') || [];
  }

  updateStoredCartItems(cartItems: CartItem[]): void {
    this.storage.setItem('cartItems', cartItems);
  }

  public addToCart(cartItem: CartItem) {
    this.addCartItem(cartItem);
  }

}

