import { Brands } from './enums/Brands.enum';
import { Colors } from './enums/Colors.enum';
import { Sizes } from './enums/Sizes.enum';
import Decimal from 'decimal.js';

export class Product {
  id!: number;
  sku!: string;
  name!: string;
  description!: string;
  unitPrice!: Decimal;
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
