import { OrderItem } from "./order-item";
import { Payment } from "./payment";
import { NewUserToOrder } from './NewUserToOrder';
import { Address } from './address';

export interface Order {
  id: string;
  moment: Date;
  user: NewUserToOrder;
  payment: Payment;
  items: OrderItem[];
}
