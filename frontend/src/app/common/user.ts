import { Gender } from "./enums/gender";
import { Role } from "./role";

export interface User {
  id: number;
  email: string;
  firstName: string;
  lastName: string;
  gender: Gender;
  password: string;
  cpf: string;
  phone: string;
  birthDay: string;
  roles: Role[];
}
