import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Address } from '../common/address';

@Injectable({
  providedIn: 'root'
})
export class AddressService {

  private apiUrl = 'http://localhost:8080/adresses';

  constructor(private http: HttpClient) { }

  getAddresses(): Observable<Address[]> {
    return this.http.get<Address[]>(this.apiUrl);
  }

  getByUserId(userId: number): Observable<Address[]> {
    const url = `${this.apiUrl}/find?userId=${userId}`;
    return this.http.get<Address[]>(url);
  }

  getById(id: number): Observable<Address[]> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<Address[]>(url);
  }

  getAddressByCEP(cep: string): Observable<Address> {
    const url = `${this.apiUrl}/viacep/${cep}`;
    return this.http.get<Address>(url);
  }

  createAddress(address: Address): Observable<Address> {
    return this.http.post<Address>(this.apiUrl, address);
  }

  updateAddress(id:number, value: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, value);
  }

  deleteAddress(id: number): Observable<void> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<void>(url);
  }

}
