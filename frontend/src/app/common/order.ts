import { StatusOrder } from "./enums/status-order.enum";
import { OrderItem } from "./order-item";
import { Payment } from "./payment";
import { User } from "./user";

export class Order {
  id!: number;
  moment!: Date;
  statusOrder!: StatusOrder;
  user!: User;
  payment!: Payment;
  items!: OrderItem[];

  constructor(
    id: number,
    moment: Date,
    statusOrder: StatusOrder,
    user: User,
    payment: Payment,
    items: OrderItem[]
  ) {
    this.id = id;
    this.moment = moment;
    this.statusOrder = statusOrder;
    this.user = user;
    this.payment = payment;
    this.items = items;
  }
}

