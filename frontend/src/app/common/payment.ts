import { PaymentType } from "./enums/payment-type.enum";
import { StatusPayment } from "./enums/StatusPayment";
import { Order } from "./order";

export class Payment {
  id!: number;
  statusPayment!: StatusPayment;
  moment!: Date;
  order!: Order;
  type!: string;
}
