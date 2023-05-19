import { Product } from './Product';

export class CartItem {

  id: string;
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
