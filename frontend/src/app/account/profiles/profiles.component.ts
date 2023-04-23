import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { StorageService } from 'src/app/services/storage.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-profiles',
  templateUrl: './profiles.component.html',
  styleUrls: ['./profiles.component.scss']
})
export class ProfilesComponent {

  currentUser: any;
  userForm!: FormGroup;

  constructor(
    private storage: StorageService,
    private formBuilder: FormBuilder,
    private userService: UserService
    ) {}

    ngOnInit(): void {
       this.currentUser = this.storage.getItem('currentUser');

       this.userForm = this.formBuilder.group({
        email: ['', [Validators.required, Validators.email]],
        firstName: ['', Validators.required],
        lastName: ['', Validators.required],
        cpf: ['', Validators.required],
        phone: ['', Validators.required],
        birthDay: ['', Validators.required]
      });

      this.userForm.patchValue(this.currentUser);
}

saveUser() {
  if (this.userForm.valid) {
    const user = this.userForm.value;
    this.userService.updateUser(this.currentUser.id, user).subscribe(() => {
      Object.assign(this.currentUser, user);

      this.userForm.reset();
    });
  }
}

cancelEdit() {
  this.userForm.reset();
}
}
