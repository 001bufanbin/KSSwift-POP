//
//  KSUserViewModel.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSUserViewModel: KSBaseViewModel {

    // MARK: - 用户相关请求单例
    static let share = KSUserViewModel ()
    private override init() {
        super.init()
    }
    
    //MARK: - 登录请求
    ///
    /// - Parameters:
    ///   - userName: 用户名
    ///   - pwd: 密码
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func login(userName:String,
               pwd:String,
               success:@escaping successModelBlock<KSLoginService.ResponseModel>,
               failure:@escaping failureModelBlock) -> Void {
        self.loadRequest(service: KSLoginService(userName: userName, pwd: pwd), success: { (request, json) in
            if let dic:NSDictionary = json as? NSDictionary,
                let userModel = KSUserModel.deserialize(from: dic) {
                //登录成功保存本地
                //KSGlobal.share.userModel = userModel
                success(request, userModel)
            }
        }, failure: { (request, error) in
            failure(request, error)
        })
    }
    
}
