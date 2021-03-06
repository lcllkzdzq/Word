//
//  SignInService.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveSwift
import SwiftProtobuf

class SignInService: NetServiceProtocol {
    let username: String
    let password: String
    
    init(usr: String, pwd: String) {
        username = usr
        password = pwd
    }
    
    func checkValue() -> Bool {
        return username.count > 0 && password.count > 0
    }
    
    func url() -> String {
        return "http://english-word-server.appspot.com/account/signIn"
    }
    
    func requestMessage() throws -> Data {
        let account = SignInRequest.with{
            $0.username = username
            $0.password = password
        }
        
        return try account.serializedData()
    }
    
    func responseMessage(data: Data) throws -> SignInResponse {
        return try SignInResponse(serializedData: data)
    }
}
