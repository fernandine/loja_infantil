package com.jean.lojaInfantil.backend.services.apis;

import com.jean.lojaInfantil.backend.melhorEnvioConfig.TokenResponse;
import feign.Body;
import feign.Headers;
import feign.Param;
import feign.RequestLine;

public interface MelhorEnvioClient {

    @RequestLine("POST /oauth/token")
    @Headers({
            "Accept: application/json",
            "Content-Type: application/x-www-form-urlencoded"
    })
    @Body("grant_type=authorization_code&client_id={clientId}&client_secret={clientSecret}&redirect_uri={redirectUri}&code={code}")
    TokenResponse getTokenFromCode(@Param("clientId") String clientId,
                                   @Param("clientSecret") String clientSecret,
                                   @Param("redirectUri") String redirectUri,
                                   @Param("code") String code);

    @RequestLine("POST /oauth/token")
    @Headers({
            "Accept: application/json",
            "Content-Type: application/x-www-form-urlencoded"
    })
    @Body("grant_type=refresh_token&client_id={clientId}&client_secret={clientSecret}&refresh_token={refreshToken}")
    TokenResponse refreshToken(@Param("clientId") String clientId,
                               @Param("clientSecret") String clientSecret,
                               @Param("refreshToken") String refreshToken);
}

