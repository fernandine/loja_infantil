import { Payment } from "./payment";

export class PaymentCreditCard extends Payment {
  logo!: string;
  installments!: number;
  cardHolderName!: string;
  cardNumber!: string;
  expiration!: Date;
  cvc!: number;
  cardType!: string;
}
