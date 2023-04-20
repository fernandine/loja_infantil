import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'statusBrand'
})
export class StatusBrandPipe implements PipeTransform {

  transform(value: string): string {
    switch(value) {
      case 'CARINHOSO':
        return 'Carinhoso';
        case 'MALWEE_KIDS':
          return 'Malwee Kids';
          case 'LILICA_RIPILICA':
        return 'Lilica Repilica';
        case 'TIP_TOP':
          return 'Tip Top';
          case 'BRANDILI':
        return 'Brandili';
        case 'MARISOL':
          return 'Marisol';
          case 'PUC':
        return 'Puc';
        case 'TROLLE':
          return 'Trolle';
          case 'UP_BABY':
          return 'Up Baby';
          case 'MILON':
            return 'Milon';
          default:
            return value;
    }
  }
}
