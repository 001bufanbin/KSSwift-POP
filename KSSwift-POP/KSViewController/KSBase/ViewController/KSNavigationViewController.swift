//
//  KSNavigationViewController.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSNavigationViewController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //导航栏颜色
        self.navigationBar.barTintColor = RGBVCOLOR(0x4996FF)
        //是否半透明
        self.navigationBar.isTranslucent = true
        //是否隐藏栈顶VC的返回按钮
        self.navigationItem.hidesBackButton = true
        //self.navigationItem.setHidesBackButton(true, animated: false)
        //是否返回手势可用
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        //是否点击屏幕隐藏导航栏
        self.navigationController?.hidesBarsOnTap = false
        //手势代理
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    //MARK: - UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIScreenEdgePanGestureRecognizer {
            if (self.viewControllers.count == 1 ||
                self.topViewController is KSLoginViewController ||
                self.topViewController is KSHomeViewController) {
                return false
            }
        }
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
