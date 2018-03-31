//
//  NetService.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveSwift

protocol NetServiceProtocol {
    func checkValue() -> Bool
    func url() -> String
    func parameters() -> [String: String]?
    func method() -> HTTPMethod
    func completionHandler(result: SignalProducer<String, NetError>) -> SignalProducer<String, NetError>
}

class NetService {
    static func sendNetService(url: String, parameters: [String: String]?, method: HTTPMethod, completionHandler: @escaping (Result<String>) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString { response in
            completionHandler(response.result)
        }
    }
    
    static func sendService(service: NetServiceProtocol) -> SignalProducer<String, NetError> {
        let signalProducer = SignalProducer<String, NetError> { observer, _ in
            if service.checkValue() {
                self.sendNetService(url: service.url(), parameters: service.parameters(), method: service.method()) { response in
                    if response.isSuccess {
                        observer.send(value: response.value!)
                    } else {
                        observer.send(error: NetError())
                    }
                }
            } else {
                observer.send(error: NetError())
            }
        }
        
        return service.completionHandler(result: signalProducer)
    }
}
