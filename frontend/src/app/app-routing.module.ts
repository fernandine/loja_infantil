import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountComponent } from './account/account/account.component';
import { AddressListComponent } from './account/address-list/address-list.component';
import { FavoritesComponent } from './account/favorites/favorites.component';
import { OrdersComponent } from './account/orders/orders.component';
import { ProfilesComponent } from './account/profiles/profiles.component';
import { AdminComponent } from './area-admin/admin/admin.component';
import { CategoriesComponent } from './area-admin/categories/categories.component';
import { ProductEditComponent } from './area-admin/product-edit/product-edit.component';
import { LoginComponent } from './autentication/login/login.component';
import { RegisterComponent } from './autentication/register/register.component';
import { CartDetailComponent } from './checkout/cart-detail/cart-detail.component';
import { CheckoutComponent } from './checkout/checkout/checkout.component';
import { DeliveryComponent } from './checkout/delivery/delivery.component';
import { PaymentComponent } from './checkout/payment/payment.component';
import { ProfileFormComponent } from './checkout/profile-form/profile-form.component';
import { AboutComponent } from './components/about/about.component';
import { ContactComponent } from './components/contact/contact.component';
import { ProductDetailComponent } from './components/product-detail/product-detail.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import { HomeComponent } from './components/home/home.component';
import { CategoryFilterComponent } from './components/category-filter/category-filter.component';

const routes: Routes = [
{
    path: 'orders',
    component: OrdersComponent
  },

  { path: 'account', component: AccountComponent, children: [
    { path: 'profile', component: ProfilesComponent },
    { path: 'adresses', component: AddressListComponent },
    { path: 'orders', component: RegisterComponent },
    { path: 'favorites', component: FavoritesComponent },
  ]},

  { path: 'checkout', component: CartDetailComponent, children: [
    { path: 'cart-details', component: CartDetailComponent },
    { path: 'profile-form', component: ProfileFormComponent },
    { path: 'delivery', component: DeliveryComponent },
    { path: 'payment', component: PaymentComponent },
  ]},

  { path: 'admin', component: AdminComponent, children: [
    { path: 'ad?categories', component: CategoriesComponent },
    { path: 'product-edit', component: ProductEditComponent },
  ]},

  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  { path: 'auth-login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'products/:id', component: ProductDetailComponent },
  { path: 'search/:keyword', component: ProductListComponent },
  { path: 'products/categories/:name', component: CategoryFilterComponent },
  { path: 'categories', component: ProductListComponent },
  { path: 'filter', component: CategoryFilterComponent },
  { path: 'products', component: ProductListComponent },
  { path: 'home', component: HomeComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  //{ path: '**', redirectTo: '/products', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
   declarations: [
   ]
})
export class AppRoutingModule { }
