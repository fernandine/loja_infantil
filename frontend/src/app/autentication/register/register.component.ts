import { Component, Input } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';
import { Gender } from '../../common/enums/gender';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {

  userForm!: FormGroup;

  constructor(private formBuilder: FormBuilder,
              private userService: UserService,
              private router: Router) {}

              ngOnInit(): void {
                this.userForm = this.formBuilder.group({
                  firstName: ['', Validators.required],
                  lastName: ['', Validators.required],
                  email: ['', [Validators.required, Validators.email]],
                  password: ['', [Validators.required, Validators.minLength(8)]],
                  gender: [''],
                  cpf: ['', [Validators.required]],
                  birthDay: ['', [Validators.required]],
                  roles: [[]]
                });
              }

  get form() {
    return this.userForm.controls;
  }

  onRegister() {
    console.log('Dados enviados:', this.userForm.value);

    if (this.userForm.invalid) {
        return;
    }

    this.userService.createUser(this.userForm.value).subscribe(
      response => {
        console.log('Usuário registrado com sucesso!', response);
        this.router.navigate(['/auth-login']);
      },
      error => console.log('Erro ao registrar usuário', error)
    );
  }
}

