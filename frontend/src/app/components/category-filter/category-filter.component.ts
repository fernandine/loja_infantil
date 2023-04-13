import { Component } from '@angular/core';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-category-filter',
  templateUrl: './category-filter.component.html',
  styleUrls: ['./category-filter.component.scss']
})
export class CategoryFilterComponent {
  brands: any[] = [
    {name: 'Alfred'},
    {name: 'Hyper'},
    {name: 'Peak'},
    {name: 'Bastion'},
];

colors: any[] = [
    {name: 'Black', class:'bg-gray-500'},
    {name: 'Orange', class:'bg-orange-500'},
    {name: 'Indigo', class:'bg-indigo-500'},
    {name: 'Pink', class:'bg-pink-500'},
];

prices: any[] = [
    {range: '$10 - $100'},
    {range: '$101 - $200'},
    {range: '$201 - $300'},
    {range: '$301 - $400'},
];

selectedBrands: any[] = ['Alfred', 'Hyper'];

selectedBrands2: any[] = [
  {name: 'Alfred'},
  {name: 'Hyper'}
];


selectedBrand_1!: any[];
items: MenuItem[] = [
    {label: 'Color'},
    {label: 'Size'},
    {label: 'Price'}
];

selectedPrice1: any;

selectedPrice2: any;

selectedColors: any = [];

selectedColors2: any = ['Black'];

selectedFilters: any[] = ['Alfred', 'Hyper', 'Black'];

sizes: any[] = [
    {page: [
      {value: '28x28'},
      {value: '28x30'},
      {value: '28x32'},
      {value: '28x34'},
      {value: '29x28'},
      {value: '29x30'},
      {value: '29x32'},
      {value: '29x34'},
      {value: '30x28'},
      {value: '30x30'},
      {value: '30x32'},
      {value: '30x34'},
      {value: '31x28'},
      {value: '31x30'},
      {value: '31x32'},
      {value: '31x34'},
    ]},
    {page: [
      {value: '32x28'},
      {value: '32x30'},
      {value: '32x32'},
      {value: '32x34'},
      {value: '33x28'},
      {value: '33x30'},
      {value: '33x32'},
      {value: '33x34'},
      {value: '34x28'},
      {value: '34x30'},
      {value: '34x32'},
      {value: '35x34'},
      {value: '35x28'},
      {value: '35x30'},
      {value: '35x32'},
      {value: '35x34'},
    ]},
    {page: [
      {value: '28x28'},
      {value: '28x30'},
      {value: '28x32'},
      {value: '28x34'},
      {value: '29x28'},
      {value: '29x30'},
      {value: '29x32'},
      {value: '29x34'},
      {value: '30x28'},
      {value: '30x30'},
      {value: '30x32'},
      {value: '30x34'},
      {value: '31x28'},
      {value: '31x30'},
      {value: '31x32'},
      {value: '31x34'},
    ]},
];

selectedSizes1: any[] = [];

selectedSizes2: any[] = [];

responsiveOptions: any[] = [
    {
        breakpoint: '1024px',
        numVisible: 3,
        numScroll: 3
    },
    {
        breakpoint: '768px',
        numVisible: 2,
        numScroll: 2
    },
    {
        breakpoint: '560px',
        numVisible: 1,
        numScroll: 1
    }
];

rangeValues: number[] = [20,80];

checked1: boolean = true;

checked2: boolean = false;

openDropdown: boolean = true;

removeChip( filter: any) {
    this.selectedFilters = this.selectedFilters.filter(i => i !== filter);
    this.selectedBrands = this.selectedBrands.filter(i => i !== filter);
    this.selectedSizes2 = this.selectedSizes2.filter(i => i !== filter);
}

clearAll() {
    this.selectedFilters = [];
    this.selectedColors2 = [];
    this.selectedSizes2 = [];
    this.selectedBrands = [];
    this.selectedBrands2 = [];
}

}
