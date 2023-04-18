import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { catchError, map, Observable, tap, throwError } from 'rxjs';
import { Product } from '../common/Product';
import { Category } from '../common/category';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private baseUrl =  'http://localhost:8080/products';

  private likedProducts: Product[] = [];

  constructor(private http: HttpClient) { }

  getLikedProducts(): Product[] {
    return this.likedProducts;
  }

  getBestSellers(limit: number): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.baseUrl}/best-sellers?limit=${limit}`);
  }

  getMostRecents(limit: number): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.baseUrl}/most-recents?limit=${limit}`);
  }

  findByFavorite(favorite: boolean): Observable<Product[]> {
    const url = `${this.baseUrl}/find?notFavorite=${!favorite}`;
    return this.http.get<Product[]>(url).pipe(
      map(products => {
        this.likedProducts = products.filter(p => p.favorite);
        return this.likedProducts;
      })
    );
  }

  getProductsByFilters(
    brandFilters: string[],
    colorFilters: string[],
    sizeFilters: string[],
    category: Category[]
  ): Observable<Product[]> {
    const brandParams = brandFilters.map(brand => `brand=${encodeURIComponent(brand)}`).join('&');
    const colorParams = colorFilters.map(color => `color=${encodeURIComponent(color)}`).join('&');
    const sizeParams = sizeFilters.map(size => `size=${encodeURIComponent(size)}`).join('&');
    const categoryParams = category.map(cat => `category=${encodeURIComponent(cat.id)}`).join('&');
    const filterUrl = `${this.baseUrl}/filter?${brandParams}${colorParams}`;
    return this.http.get<Product[]>(filterUrl)
      .pipe(map(response => response));
  }

  toggleFavorite(product: Product): Observable<Product> {
    product.favorite = !product.favorite;
    const url = `${this.baseUrl}/${product.id}`;
    return this.http.put<Product>(url, product).pipe(
      map(updatedProduct => {
        if (updatedProduct.favorite) {
          this.likedProducts.push(updatedProduct);
        } else {
          const index = this.likedProducts.findIndex(p => p.id === updatedProduct.id);
          this.likedProducts.splice(index, 1);
        }
        return updatedProduct;
      })
    );
  }

  getProduct(): Observable<Product[]> {
    const url = `${this.baseUrl}`;
    return this.http.get<Product[]>(url);
  }

  getProductById(id: number): Observable<Product> {
    const url = `${this.baseUrl}/${id}`;
    return this.http.get<Product>(url);
  }

  getProductList(currentCategoryName: string): Observable<Product[]> {
    const searchUrl = `${this.baseUrl}/categories?name=${currentCategoryName}`;
    return this.getProductSearch(searchUrl).pipe(
      tap(data => console.log('Produtos retornados do servidor:', data)),
      catchError(error => {
        console.error('Ocorreu um erro ao obter produtos por categoria:', error);
        return throwError(error);
      })
      );
  }
/*
  getProductList(currentCategoryName: number): Observable<Product[]> {
    const searchUrl = `${this.baseUrl}/categories?name=${currentCategoryName}`;
    return this.getProductSearch(searchUrl)
  }*/

  getProductSearch(searchUrl: string): Observable<Product[]> {
    return this.http.get<Product[]>(searchUrl)
      .pipe(map(response => response));
  }

  getProductByCategoryName(categoryName: string): Observable<Product[]> {
    const url = `${this.baseUrl}/categories?name=${categoryName}`;
    return this.http.get<Product[]>(url).pipe(
      tap(data => console.log('Produtos retornados do servidor:', data)),
      catchError(error => {
        console.error('Ocorreu um erro ao obter produtos por categoria:', error);
        return throwError(error);
      })
    );
  }

  createProduct(product: Product): Observable<any> {
    return this.http.post(`${this.baseUrl}`, product);
  }

  updateProduct(id: number, value: any): Observable<any> {
    return this.http.put(`${this.baseUrl}/${id}`, value);
  }

  deleteProduct(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${id}`);
  }
}

