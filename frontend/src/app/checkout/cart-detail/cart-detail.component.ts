import { Component } from '@angular/core';
import { Router } from '@angular/router';
import Decimal from 'decimal.js';
import { Observable } from 'rxjs';
import { CartItem } from 'src/app/common/cart-item';
import { CartService } from 'src/app/services/cart.service';
import { DiscountService } from 'src/app/services/discount.service';

@Component({
  selector: 'app-cart-detail',
  templateUrl: './cart-detail.component.html',
  styleUrls: ['./cart-detail.component.scss'],
})
export class CartDetailComponent {
  public cartItems$!: Observable<CartItem[]>;
  public quantityOptions = [1, 2, 3, 4, 5];
  public code: string = '';
  public discount!: number;
  public discountValue: Decimal = new Decimal(0);

  constructor(
    private cartService: CartService,
    private router: Router,
    private discountService: DiscountService
  ) {}

  ngOnInit() {
    this.cartItems$ = this.cartService.cartItems$;
  }

  checkDiscountCode(code: string): void {
    const subtotal = this.getSubtotal();

    this.discountService.getDiscountByCode(code, this.getTotal()).subscribe(
      (discount) => {
        if (discount) {
          this.discountValue = new Decimal(discount.discountValue);
          const discountAmount = subtotal.times(this.discountValue);

          alert(
            `Cupom aplicável! Desconto de ${this.getDiscountPercentage(this.discountValue)} será aplicado.`
          );
        } else {
          this.discountValue = new Decimal(0);
          alert('Cupom inválido ou expirado.');
        }
      },
      (error) => {
        console.log(error);
        alert('Ocorreu um erro ao verificar o cupom.');
      }
    );
  }

getSubtotal(): Decimal {
  let subtotal = new Decimal(0);

  this.cartItems$.subscribe((cartItems) => {
    cartItems.forEach((item) => {
      subtotal = subtotal.plus(new Decimal(item.price).times(item.quantity));
    });
  });

  return subtotal || new Decimal(0);
}


  public getTotal(): Decimal {
    const subtotal = this.getSubtotal();
    const discountAmount = subtotal.times(this.discountValue);

    return subtotal.minus(discountAmount);
  }

  public goToCheckout() {
    this.router.navigate(['/checkout/profile-form']);
  }

  getDiscountPercentage(discountValue: Decimal): string {
    console.log('DiscountValue:', discountValue);

    return `${new Decimal(discountValue).times(100)}%`;
  }

  onCalculateButtonClick() {
    this.checkDiscountCode(this.code);
  }
  /*
  public removeCartItem(cartItem: CartItem) {
    this.cartService.removeCartItem(cartItem).pipe(take(1)).subscribe();
  }*/
}
