import { Address } from "./address";

export interface NewUserToOrder {

    id: string;
    firstName: string;
    lastName: string;
    cpf: string;
    phone: string;
    birthDay: Date;
    email: string;
    addressList: Address[];
  }
