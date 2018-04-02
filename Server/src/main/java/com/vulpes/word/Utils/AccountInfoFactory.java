package com.vulpes.word.Utils;

import com.vulpes.word.Model.AccountMessage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class AccountInfoFactory {
    public static AccountMessage.AccountInfo createAccountModel(String usr, String pwd) {
        SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = dateFmt.format(new Date());

        return AccountMessage.AccountInfo.newBuilder()
                .setUuid(UUID.randomUUID().toString())
                .setUsername(usr)
                .setPassword(pwd)
                .setRegisterDate(date)
                .setLastSignInDate(date).build();
    }
}
