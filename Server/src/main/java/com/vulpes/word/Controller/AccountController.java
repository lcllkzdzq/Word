package com.vulpes.word.Controller;


import com.vulpes.word.Dao.AccountDao;
import com.vulpes.word.Model.*;
import com.vulpes.word.Utils.SignInFactory;
import com.vulpes.word.Utils.SignUpFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    @RequestMapping(value = "/signUp")
    @ResponseBody
    public SignUpMessage.SignUpResponse signUp(@RequestBody SignUpMessage.SignUpRequest account) {
        AccountMessage.AccountInfo model = AccountDao.signUp(account.getUsername(), account.getPassword());

        return SignUpFactory.createSignUpResponse(0, model);
    }

    @RequestMapping(value = "/signIn")
    @ResponseBody
    public SignInMessage.SignInResponse signIn(@RequestBody SignInMessage.SignInRequest account) {
        AccountMessage.AccountInfo model = AccountDao.signIn(account.getUsername(), account.getPassword());

        return SignInFactory.createSignInResponse(0, model);
    }
}
