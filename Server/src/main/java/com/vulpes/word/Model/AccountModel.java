package com.vulpes.word.Model;

import java.util.Date;

public class AccountModel {
    private String uuid;
    private String username;
    private String password;
    private Date registerDate;
    private Date lastSignInDate;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public Date getLastSignInDate() {
        return lastSignInDate;
    }

    public void setLastSignInDate(Date lastSignInDate) {
        this.lastSignInDate = lastSignInDate;
    }
}