import { CartItem } from "./cart-item";

export class OrderItem {

  productId: string;
  orderId: string;
  imageUrl: string;
  price: number;
  quantity: number;
  totalValue!: number;
  subtotal!: number;


  constructor(cartItem: CartItem) {
      this.imageUrl = cartItem.imageCart;
      this.quantity = cartItem.quantity;
      this.price = cartItem.price;
      this.productId = cartItem.id;
      this.orderId = cartItem.id;
  }
}


