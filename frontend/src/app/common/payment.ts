export interface Payment {
  id: number;
  statusPayment: string;
  moment: Date;
  installments?: number;
  cardHolderName?: string;
  cardNumber?: string;
  expiration?: Date;
  keyType?: string;
  name?: string;
  paymentDate?: Date;
  cardType: string;
  logo: string;
}
