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
import SwiftProtobuf

protocol NetServiceProtocol {
    associatedtype ResponseType
    
    func checkValue() -> Bool
    func url() -> String
    func requestMessage() throws -> Data
    func responseMessage(data: Data) throws -> ResponseType
}

class NetService {
    fileprivate static func sendProtobufService(url: String, data: Data, completionHandler: @escaping (Result<Data>) -> Void) {
        let header = ["Accept": "application/x-protobuf",
                      "Content-Type":"application/x-protobuf"]
        
        Alamofire.request(url, method: .post, parameters: [:], encoding: data, headers: header).responseData { response in
            completionHandler(response.result)
        }
    }
    
    static func protobufService<E: NetServiceProtocol, F>(service: E) -> SignalProducer<F, NetError> where E.ResponseType == F {
        return SignalProducer<F, NetError> { observer, _ in
            if service.checkValue() {
                do {
                    let data = try service.requestMessage()
                    
                    self.sendProtobufService(url: service.url(), data: data) { result in
                        if result.isSuccess {
                            do {
                                let value = try service.responseMessage(data: result.value!)
                                observer.send(value: value)
                            } catch { // response serialize fail
                                observer.send(error: NetError())
                            }
                        } else { // request fail
                            observer.send(error: NetError())
                        }
                    }
                } catch { // request serialize fail
                    observer.send(error: NetError())
                }
            } else { // parament check fail
                observer.send(error: NetError())
            }
        }
    }
}

extension Data: ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = self
        return request
    }
}

