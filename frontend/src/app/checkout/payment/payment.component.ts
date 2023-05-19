import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { CardType } from 'src/app/common/enums/card-type.enum';
import { StatusPayment } from 'src/app/common/enums/StatusPayment';
import { OrderItem } from 'src/app/common/order-item';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.scss']
})
export class PaymentComponent {

  type: string[] = ['paymentSlip', 'paymentCreditCard', 'paymentPix'];
  orderItem!: OrderItem;
  paymentForm!: FormGroup;
  selectedValue!: string;
  installments = [1, 2, 3, 4, 5, 6];
  selectedInstallments = new FormControl();

  constructor( private formBuilder: FormBuilder) {}

  ngOnInit() {
    this.paymentForm = this.formBuilder.group({
      id: [''],
      StatusPayment: StatusPayment.PENDING,
      moment: new Date(),
      type: [this.type],

      paymentCreditCard: this.formBuilder.group({
        logo: [''],
        installments: [1],
        cardHolderName: [''],
        cardNumber: [''],
        expiration: [new Date()],
        cvc: [0],
        cardType: [CardType.MASTERCARD]
    }),
  })
}


  calculateInstallments(installments: number) {
    const installmentsValues = [];
    const installmentValue = this.orderItem.totalValue / installments;
    for (let i = 0; i < installments; i++) {
      if (i === installments - 1) {
        // última parcela pode ter diferença de centavos
        installmentsValues.push(
          this.orderItem.totalValue - installmentValue * i
        );
      } else {
        installmentsValues.push(installmentValue);
      }
    }

    return installmentsValues;
  }
}
