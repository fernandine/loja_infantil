import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'statusColor'
})
export class StatusColorPipe implements PipeTransform {

  transform(value: string): string {
    switch(value) {
      case 'AZUL':
        return 'Azul';
        case 'ROSA_BEBE':
          return 'Rosa Bebê';
          case 'LILAS':
        return 'Lilás';
        case 'VERMELHO':
          return 'Vermelho';
          case 'AMARELO':
        return 'Amarelo';
        case 'VERDE':
          return 'Verde';
          case 'PRETO':
        return 'Preto';
        case 'BRANCO':
          return 'Branco';
          case 'CINZA':
          return 'Cinza';
          case 'MARROM':
        return 'Marrom';
        case 'ROXO':
          return 'Roxo';
          case 'BEGE':
        return 'Bege';
        case 'LARANJA':
          return 'Laranja';
          case 'ROSA':
          return 'Rosa';
          case 'TURQUESA':
        return 'Turquesa';

          default:
            return value;
    }
  }

}
