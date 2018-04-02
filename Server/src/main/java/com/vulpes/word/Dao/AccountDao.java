package com.vulpes.word.Dao;

import com.google.appengine.api.datastore.*;
import com.vulpes.word.Model.AccountMessage;
import com.vulpes.word.Utils.AccountInfoFactory;

public class AccountDao {
    public static AccountMessage.AccountInfo signUp(String usr, String pwd) {
        DatastoreService dataStore = DatastoreServiceFactory.getDatastoreService();
        AccountMessage.AccountInfo model = AccountInfoFactory.createAccountModel(usr, pwd);

        Entity account = new Entity("Account");
        account.setProperty("uuid", model.getUuid());
        account.setProperty("username", model.getUsername());
        account.setProperty("password", model.getPassword());
        account.setProperty("registerDate", model.getRegisterDate());
        account.setProperty("lastSignInDate", model.getLastSignInDate());

        dataStore.put(account);

        return model;
    }

    public static AccountMessage.AccountInfo signIn(String usr, String pwd) {
        return AccountInfoFactory.createAccountModel(usr, pwd);
    }
}
