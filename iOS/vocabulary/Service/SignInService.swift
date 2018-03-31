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
        return "http://english-word-server.appspot.com/account/\(username)?sign=\(password)"
    }
    
    func parameters() -> [String : String]? {
        return nil
    }
    
    func method() -> HTTPMethod {
        return .get
    }
    
    func completionHandler(result: SignalProducer<String, NetError>) -> SignalProducer<String, NetError> {
        return result
    }
    

}
