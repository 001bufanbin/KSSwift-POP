//
//  KSUserService.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation

// MARK: - 登录接口
struct KSLoginService: KSBaseService {
    
    var userName: String
    var pwd: String
    
    let path:String = "/post"
    //let method: KSHttpMethod = .get
    
    var parameter: Dictionary<String, Any> {
        return ["lgcode":userName, "pwd":pwd, "op":"login"]
    }
    typealias ResponseModel = KSUserModel
    
}
