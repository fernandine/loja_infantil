import { Brands } from './enums/Brands.enum';
import { Colors } from './enums/Colors.enum';
import { Sizes } from './enums/Sizes.enum';

export class Product {
  id!: number;
  sku!: string;
  name!: string;
  description!: string;
  unitPrice!: number;
  image!: string;
  favorite!: boolean;
  unitsInStock!: number;
  dateCreated!: Date;
  lastUpdate!: Date;
  rating!: boolean;
  salesCount!: number;

  productColor!: Colors;
  productBrand!: Brands;
  productSize!: Sizes;
}
