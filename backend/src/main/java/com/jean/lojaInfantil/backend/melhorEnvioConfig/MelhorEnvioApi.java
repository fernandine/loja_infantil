package com.jean.lojaInfantil.backend.melhorEnvioConfig;

import com.fasterxml.jackson.databind.ObjectMapper;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
 import java.io.IOException;

public class MelhorEnvioApi {
    private static final String AUTH_ENDPOINT = "https://sandbox.melhorenvio.com.br/oauth/token";

    private final String clientId;
    private final String clientSecret;
    private final String redirectUri;

    public MelhorEnvioApi(String clientId, String clientSecret, String redirectUri) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.redirectUri = redirectUri;
    }

    public TokenResponse solicitarToken(String grantType, String code, String refreshToken) throws IOException {
        OkHttpClient client = new OkHttpClient();

        MultipartBody body = new MultipartBody.Builder()
                .setType(MultipartBody.FORM)
                .addFormDataPart("grant_type", grantType)
                .addFormDataPart("client_id", clientId)
                .addFormDataPart("client_secret", clientSecret)
                .addFormDataPart("redirect_uri", redirectUri)
                .addFormDataPart("code", code)
                .addFormDataPart("refresh_token", refreshToken)
                .build();

        Request request = new Request.Builder()
                .url(AUTH_ENDPOINT)
                .post(body)
                .addHeader("Accept", "application/json")
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .addHeader("User-Agent", "Aplicação (email para contato técnico)")
                .build();

        Response response = client.newCall(request).execute();

        if (!response.isSuccessful()) {
            throw new IOException("Erro ao solicitar token do Melhor Envio: " + response.message());
        }

        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(response.body().string(), TokenResponse.class);
    }
}

