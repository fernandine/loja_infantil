import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { map, Observable } from 'rxjs';
import { Product } from '../common/Product';
import { Brands } from '../common/enums/Brands.enum';
import { Sizes } from '../common/enums/Sizes.enum';
import { Colors } from '../common/enums/Colors.enum';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private baseUrl =  'http://localhost:8080/products';
  private searchUrl = 'http://localhost:8080/products/search'

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
    sizeFilters: string[]
  ): Observable<Product[]> {
    const brandParams = brandFilters.map(brand => `brand=${encodeURIComponent(brand)}`).join('&');
    const colorParams = colorFilters.map(color => `color=${encodeURIComponent(color)}`).join('&');
    const sizeParams = sizeFilters.map(size => `size=${encodeURIComponent(size)}`).join('&');
    const filterUrl = `${this.baseUrl}/filter?${brandParams}${colorParams}${sizeParams}`;
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

  getProductList(theCategoryId: number): Observable<Product[]> {
    const searchUrl = `${this.baseUrl}/search/categories?id=${theCategoryId}`;
    return this.getProductSearch(searchUrl)
  }

  getProductSearch(searchUrl: string): Observable<Product[]> {
    return this.http.get<ApiResponseProduct>(searchUrl)
      .pipe(map(response => response.content));
  }

  getProduct(theProductId: number): Observable<Product> {
    const productUrl = `${this.baseUrl}/${theProductId}`;
    return this.http.get<Product>(productUrl);
  }

  getProductListPaginate(
    thePage: number,
    thePageSize: number,
    theCategoryId: number): Observable<ApiResponseProduct> {

    const searchUrl = `${this.baseUrl}/search/categories?id=${theCategoryId}`
      + `&page=${thePage}&size=${thePageSize}`;

    return this.http.get<ApiResponseProduct>(searchUrl)
      .pipe(map(response => response))
  }

  searchProducts(theKeyword: string | null): Observable<Product[]> {
    const searchUrl = `${this.searchUrl}?name=${theKeyword}`;
    console.log(searchUrl)
    return this.getProductSearch(searchUrl)
  }

  searchProductsPaginate(
    thePage: number,
    thePageSize: number,
    theKeyword: string): Observable<ApiResponseProduct> {

    const searchUrl = `${this.searchUrl}?name=${theKeyword}`
      + `&page=${thePage}&size=${thePageSize}`;

    return this.http.get<ApiResponseProduct>(searchUrl)
      .pipe(map(response => response))
  }


  getOneProductById(id: number): Observable<Product> {
    const url = `${this.searchUrl}/${id}`;
    return this.http.get<Product>(url)
      .pipe(map(product => product))
  }

  getAllProducts(): Observable<Product[]> {
    const url = `${this.baseUrl}`;
    return this.http.get<Product[]>(url);
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

interface ApiResponseProduct {
  content: Product[]
  totalPages: number
  size: number
  totalElements: number,
  number: number,
  first: boolean,
  last: boolean,
  empty: boolean

}
interface ResponseProduct {
  content: Product[]
}

