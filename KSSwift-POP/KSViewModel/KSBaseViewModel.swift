//
//  KSBaseViewModel.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

import Alamofire

/// 请求回调-参数为json（Any）
typealias successBlock = (_ request:Request?, _ responseData:Any?) -> Void
typealias failureBlock = (_ request:Request?, _ error:Error) -> Void

/// 请求回调-参数为model(子类使用，子类对应的model实体)
typealias successModelBlock<T> = (_ request:Request?, _ responseData:T) -> Void
typealias failureModelBlock = (_ request:Request?, _ error:Error) -> Void

class KSBaseViewModel: NSObject, KSServiceProtocol {
    
    var request:Request?
    var allRequest = Array<Request> ()
    
    /// 请求
    ///
    /// - Parameters:
    ///   - service: 请求SERVICE
    ///   - success: 请求成功回调
    ///   - failure: 请求失败回调
    func loadRequest<T: KSBaseService>(service: T,
                     success:@escaping successBlock,
                     failure:@escaping failureBlock) {
        
        switch service.method {
        case .get:
            request = self.getRequest(url: service.url, parameters: service.parameter, success: { (request, json) in
                success(request, json)
            }, failure: { (request, error) in
                failure(request, error)
            })
        case .post:
            request = self.postRequest(url: service.url, parameters: service.parameter, success: { (request, json) in
                success(request, json)
            }, failure: { (request, error) in
                failure(request, error)
            })
        default:
            request = self.postRequest(url: service.url, parameters: service.parameter, success: { (request, json) in
                success(request, json)
            }, failure: { (request, error) in
                failure(request, error)
            })
        }
        
    }
    
}

protocol KSServiceProtocol {
    
}

extension KSServiceProtocol {
    
    /// GET 请求
    ///
    /// - Parameters:
    ///   - url: 请求URL
    ///   - parameters: 请求字典
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func getRequest(url: String,
                    parameters:Dictionary<String, Any>? = nil,
                    success:@escaping successBlock,
                    failure:@escaping failureBlock) -> Request? {
        
        var request:Request?
        request = Alamofire.request(url,
                                    method: .get,
                                    parameters: parameters,
                                    encoding: URLEncoding.default,
                                    headers: nil).responseJSON { (response) in
                                        switch response.result {
                                        case .success:
                                            if let value = response.result.value {
                                                success(request, value)
                                            }
                                        case .failure(let error):
                                            failure(request, error)
                                        }
        }
        return request;
    }
    
    /// POST 请求
    ///
    /// - Parameters:
    ///   - url: 请求URL
    ///   - parameters: 请求字典
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func postRequest(url: String,
                     parameters:Dictionary<String, Any>? = nil,
                     success:@escaping successBlock,
                     failure:@escaping failureBlock) -> Request? {
        var request:Request?
        request = Alamofire.request(url,
                                    method: .post,
                                    parameters: parameters,
                                    encoding: URLEncoding.default,
                                    headers: nil).responseJSON { (response) in
                                        switch response.result {
                                        case .success:
                                            if let value = response.result.value {
                                                success(request, value)
                                            }
                                        case .failure(let error):
                                            failure(request, error)
                                        }
        }
        return request;
    }
    
}
