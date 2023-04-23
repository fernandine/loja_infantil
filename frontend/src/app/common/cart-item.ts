import { Product } from './Product';
import Decimal from 'decimal.js';

export class CartItem {

  id: number;
  name: string;
  imageCart: string;
  price: number;
  quantity: number;
  color: string;
  size: string;
  brand: string;

  constructor(product: Product) {
      this.id = product.id;
      this.name = product.name;
      this.imageCart = product.image;
      this.price = product.unitPrice.toNumber();
      this.color = product.productColor;
      this.size = product.productSize;
      this.brand = product.productBrand;
      this.quantity = 1;
  }
}
