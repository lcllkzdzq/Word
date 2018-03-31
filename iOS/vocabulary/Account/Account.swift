//
//  Account.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import Foundation
import ReactiveSwift

class Account {
    static let current = Account()
    let username = MutableProperty<String?>(nil)
}
