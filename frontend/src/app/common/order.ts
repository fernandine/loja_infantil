import { StatusOrder } from "./enums/status-order.enum";
import { OrderItem } from "./order-item";
import { Payment } from "./payment";
import { User } from "./user";

export class Order {
  id!: number;
  moment!: Date;
  statusOrder!: StatusOrder;
  client!: User;
  payment!: Payment;
  items!: OrderItem[];

  constructor(
    id: number,
    moment: Date,
    statusOrder: StatusOrder,
    client: User,
    payment: Payment,
    items: OrderItem[]
  ) {
    this.id = id;
    this.moment = moment;
    this.statusOrder = statusOrder;
    this.client = client;
    this.payment = payment;
    this.items = items;
  }
}

