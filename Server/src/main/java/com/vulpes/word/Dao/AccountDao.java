package com.vulpes.word.Dao;

import com.google.appengine.api.datastore.*;
import com.vulpes.word.Model.AccountModel;
import com.vulpes.word.Utils.AccountModelFactory;

public class AccountDao {
    public static AccountModel signUp(String usr, String pwd) {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        AccountModel model = AccountModelFactory.createAccountModel(usr, pwd);

        Entity account = new Entity("Account");
        account.setProperty("uuid", model.getUuid());
        account.setProperty("username", model.getUsername());
        account.setProperty("password", model.getPassword());
        account.setProperty("registerDate", model.getRegisterDate());
        account.setProperty("lastSignInDate", model.getLastSignInDate());

        datastore.put(account);

        return model;
    }

    public static AccountModel signIn(String usr, String pwd) {
        AccountModel model = AccountModelFactory.createAccountModel(usr, pwd);
        return model;
    }
}
