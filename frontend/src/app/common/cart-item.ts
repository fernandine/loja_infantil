import { Product } from './Product';


export class CartItem {

  id: number;
  name: string;
  imageCart: string;
  unitPrice: number;
  quantity: number;
  color: string;
  size: string;
  brand: string;

  constructor(product: Product) {
      this.id = product.id;
      this.name = product.name;
      this.imageCart = product.image;
      this.unitPrice = product.unitPrice;
      this.color = product.productColor;
      this.size = product.productSize;
      this.brand = product.productBrand;
      this.quantity = 1;
  }
}
