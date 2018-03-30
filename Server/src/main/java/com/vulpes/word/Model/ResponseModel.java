package com.vulpes.word.Model;

public class ResponseModel {
    private ResponseHeaderModel header;
    private Object data;



    public ResponseHeaderModel getHeader() {
        return header;
    }

    public void setHeader(ResponseHeaderModel header) {
        this.header = header;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
