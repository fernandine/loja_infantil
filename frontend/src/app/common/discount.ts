import { Product } from './Product';
import Decimal from 'decimal.js';

export interface Discount {
     id: number,
     code: string,
     discountValue: Decimal,
     expirationDate: Date,
     discountedPrice: Decimal,
     productId: Product
}
