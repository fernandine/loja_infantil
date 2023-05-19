import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Order } from '../common/order';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class OrderService {

  private baseUrl = environment.shopUrl + '/orders';

constructor(private http: HttpClient) { }

getOrder(): Observable<Order[]> {
  const url = `${this.baseUrl}`;
  return this.http.get<Order[]>(url);
}

getOrderById(id: number): Observable<Order> {
  const url = `${this.baseUrl}/${id}`;
  return this.http.get<Order>(url);
}

createOrder(order: Order): Observable<any> {
  return this.http.post(`${this.baseUrl}`, order);
}

updateOrder(id: number, value: any): Observable<any> {
  return this.http.put(`${this.baseUrl}/${id}`, value);
}

deleteOrder(id: number): Observable<any> {
  return this.http.delete(`${this.baseUrl}/${id}`);
}
}
