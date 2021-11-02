package com.ezcook.utils;

import com.ezcook.constants.GoogleConstant;
import com.ezcook.entities.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.IOException;
import java.util.Objects;

public class GoogleUtil {

    public static String getToken(final String code) {

        RequestBody requestBody = new FormBody.Builder()
                .add("client_id", GoogleConstant.GOOGLE_CLIENT_ID)
                .add("client_secret", GoogleConstant.GOOGLE_CLIENT_SECRET)
                .add("redirect_uri", GoogleConstant.GOOGLE_REDIRECT_URI)
                .add("code", code)
                .add("grant_type", GoogleConstant.GOOGLE_GRANT_TYPE)
                .build();

        String resp = getResponse(GoogleConstant.GOOGLE_LINK_GET_TOKEN, requestBody);
        return getAttributeFromJson(resp, "access_token");
    }

    public static User getUserInfo(final String access_token) {
        String url = GoogleConstant.GOOGLE_LINK_GET_USER_INFO + access_token;

        String resp = getResponse(url, null);

        User user = new User();

        StringBuilder email = new StringBuilder(getAttributeFromJson(resp, "email"));
        user.setEmail(email.toString());
        user.setUsername(email.replace(email.indexOf("@"), email.length(), "").toString());

        // set properties role..
        user.setIdRole(1);
        return user;
    }

    public static String getResponse(String url, RequestBody requestBody) {
        okhttp3.Request request;
        if (requestBody != null) {
            request = new okhttp3.Request.Builder()
                    .url(url)
                    .post(requestBody)
                    .build();
        } else {
            request = new okhttp3.Request.Builder()
                    .url(url)
                    .build();
        }

        OkHttpClient client = new OkHttpClient();
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code: " + response);
            }
            return Objects.requireNonNull(response.body()).string();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getAttributeFromJson(String json, String attributeName) {
        JsonObject jobj = new Gson().fromJson(json, JsonObject.class);
        return jobj.get(attributeName).toString().replace("\"", "");
    }

}
