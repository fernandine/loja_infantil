import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'statusSize',
})
export class StatusSizePipe implements PipeTransform {
  transform(value: string): string {
    switch (value) {
      case 'P':
        return 'P';
      case 'M':
        return 'M';
      case 'G':
        return 'G';
      case 'GG':
        return 'G';
      case 'SIZE_1':
        return '1';
      case 'SIZE_2':
        return '2';
      case 'SIZE_3':
        return '3';
      case 'SIZE_4':
        return '4';
      case 'SIZE_6':
        return '6';
      case 'SIZE_8':
        return '8';
      case 'SIZE_10':
        return '10';
      case 'SIZE_12':
        return '12';
      case 'SIZE_14':
        return '14';
      case 'SIZE_16':
        return '16';
      default:
        return value;
    }
  }
}
