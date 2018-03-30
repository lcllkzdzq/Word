package com.vulpes.word.Utils;

import com.vulpes.word.Model.AccountModel;

import java.util.Date;
import java.util.UUID;

public class AccountModelFactory {
    public static AccountModel createAccountModel(String usr, String pwd) {
        AccountModel model = new AccountModel();
        model.setUuid(UUID.randomUUID().toString());
        model.setUsername(usr);
        model.setPassword(pwd);
        model.setRegisterDate(new Date());
        model.setLastSignInDate(model.getRegisterDate());

        return model;
    }
}
