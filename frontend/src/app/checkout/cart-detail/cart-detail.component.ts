import { Component } from '@angular/core';
import { Router } from '@angular/router';
import Decimal from 'decimal.js';
import { Observable } from 'rxjs';
import { CartItem } from 'src/app/common/cart-item';
import { AuthService } from 'src/app/services/auth.service';
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
  subtotal: Decimal = new Decimal(0);
  total: Decimal = new Decimal(0);
  isCartEmpty!: boolean;


  constructor(
    private cartService: CartService,
    private router: Router,
    private discountService: DiscountService,
    private authService: AuthService
  ) {}

  ngOnInit() {
    this.cartItems$ = this.cartService.cartItems$;

    this.cartItems$.subscribe((cartItems) => {
      this.isCartEmpty = cartItems.length === 0;
    });
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

          // Atualize o valor do desconto no estado do carrinho
          this.cartService.setDiscountValue(this.discountValue);

          // Recupere o valor total atualizado e armazene-o no estado do componente
          this.total = subtotal.minus(discountAmount);
          this.cartService.setTotalValue(this.total.toNumber());
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

  goToCheckout() {
    if (!this.authService.isAuthenticated()) {
      // Usuário não está autenticado, redireciona para a página de login
      this.router.navigate(['/auth-login']);
      return;
    }

    // Usuário está autenticado, redireciona para a página de checkout
    this.router.navigate(['/checkout/orders'], {});
  }


  getDiscountPercentage(discountValue: Decimal): string {
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
