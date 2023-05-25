import { Component } from '@angular/core';
import {
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { Order } from 'src/app/common/order';
import Decimal from 'decimal.js';
import { OrderService } from 'src/app/services/order.service';
import { StorageService } from 'src/app/services/storage.service';
import { CartItem } from 'src/app/common/cart-item';
import { CartService } from 'src/app/services/cart.service';
import { OrderItem } from 'src/app/common/order-item';
import { AddressService } from '../../services/address.service';
import { ɵNullViewportScroller } from '@angular/common';
import { StatusPayment } from 'src/app/common/enums/StatusPayment';


@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.scss'],
})
export class OrderComponent {

  cartItems: CartItem[] = [];

  subtotal: Decimal = new Decimal(0);
  total!: number;
  currentUser: any;
  discountValue: Decimal = new Decimal(0);
  selectedValue!: string;

  orderForm!: FormGroup;
  order!: Order;

  constructor(
    private fb: FormBuilder,
    private storageService: StorageService,
    private orderService: OrderService,
    private router: Router,
    private cartService: CartService,

  ) {}

  ngOnInit() {

    this.currentUser = this.storageService.getItem('currentUser');
    this.orderForm = this.fb.group({

      user: this.fb.group({
        firstName: new FormControl('', Validators.required),
        lastName: new FormControl('', Validators.required),
        phone: new FormControl(null, Validators.required),
        birthDay: new FormControl(null),
        cpf: new FormControl('', Validators.required),
        email: new FormControl('', [Validators.required, Validators.email]),
      }),
      address: this.fb.group({
        cep: new FormControl(''),
        logradouro: new FormControl(''),
        numero: new FormControl(null, Validators.required),
        complemento: new FormControl(''),
        bairro: new FormControl('', Validators.required),
        localidade: new FormControl('', Validators.required),
        uf: new FormControl('', Validators.required),
        referencia: new FormControl(''),
  }),
    payment: this.fb.group({
        cardHolderName: new FormControl('', Validators.required),
        cardNumber: new FormControl(null, Validators.required),
        cvc: new FormControl(null, Validators.required),
        expiration: new FormControl(null, Validators.required),
        installments: new FormControl(null, Validators.required),
      }),

    });

    this.cartService.cartItems$.subscribe(cartItems => {
      this.cartItems = cartItems;
      this.subtotal = this.cartService.getSubtotal();
      this.discountValue = this.cartService.getDiscountValue();
      this.getTotal();
    });
  }


  updateDiscountValue(discountValue: number) {
    this.discountValue = new Decimal(discountValue);
    this.getTotal();
  }

  getDiscountPercentage(discountValue: Decimal): string {
    return `${new Decimal(discountValue).times(100)}%`;
  }

  getTotal() {
    const subtotal = this.subtotal;
    const discountValue = new Decimal(this.discountValue);
    const discountAmount = subtotal.times(this.discountValue);
    if (discountValue.toNumber() > 0) {
      this.total = subtotal.minus(discountAmount).toNumber();
    } else {
      this.total = subtotal.toNumber();
    }
  }

  getDiscountAmount(): number {
    const discountAmount = new Decimal(this.subtotal).times(this.discountValue);
    return discountAmount.toNumber();
  }

  onSubmit() {
    this.orderService.createOrder(this.order).subscribe(
      (response) => {
        // Lida com a resposta do backend e navega para a página de confirmação do pedido
        const orderId = response.id;
        this.router.navigate(['/checkout/orders', orderId]);
      },
      (error) => {
        console.error('Erro ao criar pedido:', error);
      }
    );
  }

}
