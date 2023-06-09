package com.jean.lojaInfantil.backend.components;


import com.jean.lojaInfantil.backend.entities.User;
import com.jean.lojaInfantil.backend.repositories.AddressRepository;
import com.jean.lojaInfantil.backend.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class JwtTokenEnhancer implements TokenEnhancer {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AddressRepository addressRepository;
	
	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {

		User user = userRepository.findByEmail(authentication.getName());
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", user.getId());
		map.put("firstName", user.getFirstName());
		map.put("lastName", user.getLastName());
		map.put("email", user.getEmail());
		map.put("username", user.getUsername());
		map.put("cpf", user.getCpf());
		map.put("birthDay", user.getBirthDay());
		map.put("gender", user.getGender());
		map.put("phone", user.getPhone());
		map.put("roles", user.getRoles());

		DefaultOAuth2AccessToken token = (DefaultOAuth2AccessToken) accessToken;
		token.setAdditionalInformation(map);
		
		return accessToken;
	}
}
