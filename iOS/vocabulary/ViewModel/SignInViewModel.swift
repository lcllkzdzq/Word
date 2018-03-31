//
//  SignInViewModel.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class SignInViewModel {
    let username = MutableProperty<String?>(nil)
    let password = MutableProperty<String?>(nil)

    var signInAction: Action<(), String, NetError>!
    var signInSuccessSignal: Signal<Void, NoError>!
    var signInFailSignal: Signal<Void, NoError>!
    
    init() {
        signInAction = Action { _ in
            let usr = self.username.value ?? ""
            let pwd = self.password.value ?? ""
            return NetService.sendService(service: SignInService(usr: usr, pwd: pwd))
        }

        signInSuccessSignal = signInAction.values.map{_ in }
        signInFailSignal = signInAction.errors.map{_ in }
        
        Account.current.username <~ signInAction.values
    }
}

