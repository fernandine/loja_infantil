export class Payment {
  id: number;
  moment: Date;

  constructor(id: number, moment: Date) {
    this.id = id;
    this.moment = moment;
  }
}
