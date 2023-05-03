export class OrderItem {
  id: { orderId: number; productId: number };
  quantity: number;
  subtotal: number;
  totalValue: number;

  constructor(orderId: number, productId: number, quantity: number, subtotal: number, totalValue: number) {
    this.id = { orderId, productId };
    this.quantity = quantity;
    this.subtotal = subtotal;
    this.totalValue = totalValue;
  }
}

