import { Address } from "./address";
import { OrderItem } from "./order-item";
import { Payment } from "./payment";
import { User } from './user';

export interface Order {
  id: string;
  moment: Date;
  user: User;
  address: Address;
  payment: Payment;
  items: OrderItem[];
}
