import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Review } from '../common/review';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ReviewService {

  private baseUrl =  environment.shopUrl + '/reviews';

  constructor(private http: HttpClient) {}

  getReview(): Observable<Review[]> {
    const url = `${this.baseUrl}`;
    return this.http.get<Review[]>(url);
  }

  createReview(review: Review): Observable<any> {
    return this.http.post(`${this.baseUrl}`, review);
  }
}
