export class OrderItem {
  id: { orderId: number; productId: number };
  quantity: number;
  price: number;

  constructor(orderId: number, productId: number, quantity: number, price: number) {
    this.id = { orderId, productId };
    this.quantity = quantity;
    this.price = price;
  }
}

