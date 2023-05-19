import { Address } from "./address";
import { Gender } from "./enums/gender";
import { Role } from "./role";

export interface User {
  id: number;
  firstName: string;
  lastName: string;
  gender: Gender;
  email: string;
  password: string;
  cpf: string;
  phone: string;
  birthDay: string;
  roles: Role[];
  addressList: Address[];
}
