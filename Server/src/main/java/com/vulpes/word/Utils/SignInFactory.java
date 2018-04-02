package com.vulpes.word.Utils;

import com.vulpes.word.Model.AccountMessage;
import com.vulpes.word.Model.ResponseMessage;
import com.vulpes.word.Model.SignInMessage;

public class SignInFactory {
    public static SignInMessage.SignInResponse createSignInResponse(int status, AccountMessage.AccountInfo info) {

        return SignInMessage.SignInResponse.newBuilder()
                .setHeader(ResponseMessage.ResponseHeader.newBuilder().setStatus(status).setDesc(""))
                .setAccount(info).build();
    }
}
