package com.jean.lojaInfantil.backend.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.entities.enums.Gender;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDate;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto implements Serializable {

    private Long id;
    @NotBlank
    private String firstName;
    private String lastName;
    private String cpf;
    private String phone;

    @JsonFormat(pattern="dd/MM/yyyy")
    private LocalDate birthDay;
    @NotBlank
    @Email
    private String email;

    private Gender gender;

    Set<RoleDto> roles = new HashSet<>();

    Set<AddressDto> addressList = new HashSet<>();

}