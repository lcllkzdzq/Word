package com.vulpes.word.Utils;

import com.vulpes.word.Model.AccountMessage;
import com.vulpes.word.Model.ResponseMessage;
import com.vulpes.word.Model.SignUpMessage;

public class SignUpFactory {
    public static SignUpMessage.SignUpResponse createSignUpResponse(int status, AccountMessage.AccountInfo info) {

        return SignUpMessage.SignUpResponse.newBuilder()
                .setHeader(ResponseMessage.ResponseHeader.newBuilder().setStatus(status).setDesc(""))
                .setAccount(info).build();
    }
}
