//
//  KSLoginViewController.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSLoginViewController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let  rect = CGRect(x: 100, y: 100, width: 60, height: 40)
        let loginButton = UIButton(frame: rect)
        loginButton.backgroundColor = RGBVCOLOR(0x4996ff)
        
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = KSFont(16)
        
        loginButton.addTarget(self, action: #selector(btnLoginDidClick(_:)), for: .touchUpInside)
        
        self.view.addSubview(loginButton)
        
    }

    func btnLoginDidClick(_ sender: UIButton) -> Void {
        KSUserViewModel.share.login(userName: "", pwd: "", success: { (request, model) in
            let homeVC: KSHomeViewController = KSHomeViewController(navStyle: .hidden)
            self.navigationController?.pushViewController(homeVC, animated: true)
        }) { (request, error) in
            self.manageFailStatus()
        }
//        let homeVC: KSHomeViewController = KSHomeViewController(navStyle: .hidden)
//        self.navigationController?.pushViewController(homeVC, animated: true)
    }

}
