//
//  MainViewModel.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class MainViewModel {
    let mainState = MutableProperty<Void>(())
    let noAccountSignal: Signal<Void, NoError>
    
    init() {
        noAccountSignal = mainState.signal.filter{_ in
            Account.current.username.value == nil
        }.map{_ in }
    }
}
