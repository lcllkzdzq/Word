package com.vulpes.word.Utils;

import com.vulpes.word.Model.ResponseHeaderModel;
import com.vulpes.word.Model.ResponseModel;

public class ResponseModelFactory {
    public static ResponseModel createResponseModel(int status, Object data) {
        ResponseModel model = new ResponseModel();
        model.setHeader(new ResponseHeaderModel(status));
        model.setData(data);

        return model;
    }
}
