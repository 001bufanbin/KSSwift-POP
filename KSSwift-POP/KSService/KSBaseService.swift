//
//  KSBaseService.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation

enum KSHttpMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

protocol KSBaseService {
    
    var host:String { get }
    var path:String { get }
    var url: String { get }
    
    var method:KSHttpMethod { get }
    
    var parameter: Dictionary<String, Any>  { get }
    
    associatedtype ResponseModel
    
}

extension KSBaseService {
    
    var host:String {
        return HOME_URL
    }
    
    var url: String {
        return host+path
    }
    
    var method:KSHttpMethod {
        return .post
    }
    
    var parameter:Dictionary<String, Any> {
        return [:]
    }
    
}
