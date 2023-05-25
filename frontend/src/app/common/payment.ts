import { StatusPayment } from "./enums/StatusPayment";
import { Order } from "./order";

export interface Payment {
  id: number;
  statusPayment: StatusPayment;
  moment: Date;
  order: Order;
  type: string;

  logo: string;
  installments: number;
  cardHolderName: string;
  cardNumber: string;
  expiration: Date;
  cvc: number;
  cardType: string;
}
