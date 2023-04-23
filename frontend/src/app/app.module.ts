import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { CommonModule } from '@angular/common';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { MessageService } from 'primeng/api';
import { AccountComponent } from './account/account/account.component';
import { AddressFormComponent } from './account/address-form/address-form.component';
import { AddressListComponent } from './account/address-list/address-list.component';
import { OrdersComponent } from './account/orders/orders.component';
import { ProfilesComponent } from './account/profiles/profiles.component';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AdminComponent } from './area-admin/admin/admin.component';
import { CategoriesComponent } from './area-admin/categories/categories.component';
import { ProductEditComponent } from './area-admin/product-edit/product-edit.component';
import { LoginComponent } from './autentication/login/login.component';
import { RegisterComponent } from './autentication/register/register.component';
import { CartDetailComponent } from './checkout/cart-detail/cart-detail.component';
import { CartStatusComponent } from './checkout/cart-status/cart-status.component';
import { CheckoutComponent } from './checkout/checkout/checkout.component';
import { DeliveryComponent } from './checkout/delivery/delivery.component';
import { PaymentComponent } from './checkout/payment/payment.component';
import { ProfileFormComponent } from './checkout/profile-form/profile-form.component';
import { AboutComponent } from './components/about/about.component';
import { CategoryFilterComponent } from './components/category-filter/category-filter.component';
import { ContactComponent } from './components/contact/contact.component';
import { DiscountComponent } from './components/discount/discount.component';
import { FooterComponent } from './components/footer/footer.component';
import { HeaderComponent } from './components/header/header.component';
import { HomeComponent } from './components/home/home.component';
import { ProductDetailComponent } from './components/product-detail/product-detail.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import { SearchComponent } from './components/search/search.component';
import { UserComponent } from './components/user/user.component';
import { HttpRequestInterceptor } from './http-request.interceptor';
import { StatusBrandPipe } from './pipes/statusBrand.pipe';
import { StatusColorPipe } from './pipes/statusColor.pipe';
import { StatusRolePipe } from './pipes/statusRole.pipe';
import { StatusSizePipe } from './pipes/statusSize.pipe';
import { PrimeNgModule } from './primeng.module';
import { CartService } from './services/cart.service';
import { NotificationService } from './services/notification.service';
import { CurrencyFormatPipe } from './pipes/currencyFormat.pipe';
import { FavoritesComponent } from './account/favorites/favorites.component';


@NgModule({
  declarations: [
    AppComponent,
    FavoritesComponent,
    HomeComponent,
    AccountComponent,
    AddressFormComponent,
    AddressListComponent,
    DiscountComponent,
    OrdersComponent,
    ProfilesComponent,
    LoginComponent,
    RegisterComponent,
    AdminComponent,
    CategoryFilterComponent,
    HeaderComponent,
    CategoriesComponent,
    ProductEditComponent,
    CheckoutComponent,
    CartDetailComponent,
    CartStatusComponent,
    DeliveryComponent,
    PaymentComponent,
    ProfileFormComponent,
    AboutComponent,
    ContactComponent,
    ProductListComponent,
    ProductDetailComponent,
    UserComponent,
    SearchComponent,
    FooterComponent,
    StatusSizePipe,
    StatusBrandPipe,
    StatusColorPipe,
    StatusRolePipe,
    CurrencyFormatPipe
  ],
  imports: [
    BrowserModule,
    CommonModule,
    PrimeNgModule,
    ReactiveFormsModule,
    AppRoutingModule,
  ],
  providers: [
    CartService,
    NotificationService,
    MessageService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: HttpRequestInterceptor,
      multi: true,
    },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
