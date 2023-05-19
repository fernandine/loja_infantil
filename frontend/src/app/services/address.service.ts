import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Address } from '../common/address';


@Injectable({
  providedIn: 'root'
})
export class AddressService {

  private apiUrl = environment.shopUrl + '/adresses';

  constructor(private http: HttpClient) { }

  getAddresses(): Observable<Address[]> {
    return this.http.get<Address[]>(this.apiUrl);
  }

  getByUserId(userId: string): Observable<Address[]> {
    const url = `${this.apiUrl}/find?userId=${userId}`;
    return this.http.get<Address[]>(url);
  }

  getById(id: string): Observable<Address[]> {
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

  updateAddress(id:string, value: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, value);
  }

  deleteAddress(id: string): Observable<void> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<void>(url);
  }

}
