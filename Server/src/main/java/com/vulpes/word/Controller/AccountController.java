package com.vulpes.word.Controller;


import com.vulpes.word.Dao.AccountDao;
import com.vulpes.word.Model.AccountModel;
import com.vulpes.word.Model.ResponseModel;
import com.vulpes.word.Utils.ResponseModelFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/account")
public class AccountController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    @ResponseBody
    public ResponseModel signUp(String usr, String pwd) {
        AccountModel model = AccountDao.signUp(usr, pwd);

        return ResponseModelFactory.createResponseModel(0, model);
    }

    @RequestMapping(value = "/{usr}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseModel signIn(@PathVariable String usr, String sign) {
        AccountModel model = AccountDao.signIn(usr, sign);
        return ResponseModelFactory.createResponseModel(0, model);
    }
}
