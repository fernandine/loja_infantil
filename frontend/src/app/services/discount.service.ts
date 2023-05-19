import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Discount } from '../common/discount';
import Decimal from 'decimal.js';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class DiscountService {

  private baseUrl = environment.shopUrl + '/discounts';

  constructor(private http: HttpClient) {}

  getDiscount(): Observable<Discount[]> {
    const url = `${this.baseUrl}`;
    return this.http.get<Discount[]>(url);
  }

  getDiscountByCode(code: string, totalPrice: Decimal): Observable<Discount> {
    return this.http
      .get<Discount>(
        `${this.baseUrl}/apply?code=${code}&totalPrice=${totalPrice}`
      )
      .pipe(map((response) => response));
  }

  getExpiringDiscounts(date: Date): Observable<Discount> {
    return this.http
      .get<Discount>(
        `${this.baseUrl}/expiring?date=${date.toISOString().split('T')[0]}`
      )
      .pipe(map((response) => response));
  }

  insert(discount: Discount): Observable<any> {
    return this.http.post(`${this.baseUrl}`, discount);
  }
}
