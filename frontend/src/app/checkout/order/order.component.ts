import { Component } from '@angular/core';
import { FormGroup, NonNullableFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { CartItem } from 'src/app/common/cart-item';
import { AddressService } from 'src/app/services/address.service';
import { AuthService } from 'src/app/services/auth.service';
import { NotificationService } from 'src/app/services/notification.service';
import { Address } from '../../common/address';
import { StorageService } from '../../services/storage.service';
import { CartService } from '../../services/cart.service';
import Decimal from 'decimal.js';
import { Order } from 'src/app/common/order';
import { OrderService } from 'src/app/services/order.service';
import { Payment } from 'src/app/common/payment';
import { OrderItem } from 'src/app/common/order-item';
import { StatusOrder } from 'src/app/common/enums/status-order.enum';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.scss']
})
export class OrderComponent {

  public cartItems!: CartItem[];
  public cartItems$!: Observable<CartItem[]>;
  cartItem!: CartItem;
  public discountValue: Decimal = new Decimal(0);

  subtotal: Decimal = new Decimal(0);
  total: Decimal = new Decimal(0);

  address!: Address;
  currentUser: any;
  userForm!: FormGroup;
  orderId!: number;

  addressForm = this.formBuilder.group({
    id: [-1],
    cep: ['', Validators.required],
    logradouro: ['', Validators.required],
    complemento: [''],
    bairro: ['', Validators.required],
    localidade: ['', Validators.required],
    uf: ['', Validators.required],
    userId: [-1]
  });

  constructor(
    private router: Router,
    private cartService: CartService,
    private formBuilder: NonNullableFormBuilder,
    private addressService: AddressService,
    private authService: AuthService,
    private route: ActivatedRoute,
    private notificationService: NotificationService,
    private storageService: StorageService,
    private orderService: OrderService
    ) {}

  ngOnInit(): void {
    this.discountValue = this.cartService.getDiscountValue();

    this.cartItems = this.cartService.getStoredCartItems();

    this.cartItems$ = this.cartService.cartItems$;

    const addressId = this.route.snapshot.params['id'];
    if (addressId) {
      this.loadAddress(addressId);
    }
    this.currentUser = this.storageService.getItem('currentUser');

    this.userForm = this.formBuilder.group({
     email: ['', [Validators.required, Validators.email]],
     firstName: ['', Validators.required],
     lastName: ['', Validators.required],
     phone: ['', Validators.required],
   });

   this.userForm.patchValue(this.currentUser);
  }

    loadAddress(addressId: number) {
      this.addressService.getByUserId(addressId)
        .subscribe(
          (addresses: Address[]) => {
            const address = addresses[0];
            this.addressForm.setValue({
              id: address?.id ?? null,
              cep: address.cep,
              logradouro: address.logradouro,
              complemento: address?.complemento ?? '',
              bairro: address.bairro,
              localidade: address.localidade,
              uf: address.uf,
              userId: address?.userId ?? null
            });
          },
          error => {
            console.error('Erro ao buscar endereço pelo ID:', error);
          }
        );
    }

    onCepBlur() {
      const cep = this.addressForm.get('cep')?.value;
      if (cep && this.addressForm) {
        this.addressService.getAddressByCEP(cep)
          .subscribe(
            (address: Address) => {
              this.addressForm.patchValue({
                logradouro: address.logradouro,
                complemento: address.complemento,
                bairro: address.bairro,
                localidade: address.localidade,
                uf: address.uf
              });
            },
            error => {
              console.error('Erro ao buscar endereço pelo CEP:', error);
            }
          );
      }
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

  onSubmit() {
    const orderItems: OrderItem[] = [];

    // Cria os objetos OrderItem a partir dos objetos CartItem
 this.cartItems.forEach((cartItem) => {
  const orderId = cartItem['order'].id;
  const productId = cartItem['product'].id;

  const orderItem = new OrderItem(
    orderId,
    productId,
    cartItem.quantity,
    cartItem['subtotal'],
    cartItem['totalValue']
  );

  orderItems.push(orderItem);
});


    const order: Order = {
      moment: new Date(),
      statusOrder: StatusOrder.PENDING,
      user: this.userForm.value,
      items: orderItems,
      payment: { id: 1, moment: new Date() } as Payment,
      id: 0
    };

    this.orderService.createOrder(order).subscribe(
      (response) => {
        // Lida com a resposta do backend e navega para a página de confirmação do pedido
        const orderId = response.id;
        this.router.navigate(['/checkout/orders', orderId]);
      },
      (error) => {
        console.error('Erro ao criar pedido:', error);
        // Adicione um tratamento de erro adequado aqui
      }
    );
    }

  selectedValue: string = '';

  selectedValue2: string = '';
  ccRegex: RegExp = /[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$/;
  card1: string = '**** **** **** 1234';

  card2: string = '**** **** **** 1235';

  cc!: string;

  cvc!: string;

  cvcRegex: RegExp = /^[0-9]{3,4}$/;



  expRegex: RegExp = /[0-9]{2}\/[0-9]{2}$/;
}
