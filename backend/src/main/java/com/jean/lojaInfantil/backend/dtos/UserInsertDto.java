package com.jean.lojaInfantil.backend.dtos;


import com.jean.lojaInfantil.backend.services.validation.UserInsertValid;

@UserInsertValid
public class UserInsertDto extends UserDto {

	private String password;

	UserInsertDto() {
		super();
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
