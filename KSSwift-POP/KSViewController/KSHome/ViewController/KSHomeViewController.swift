//
//  KSHomeViewController.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSHomeViewController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        
        self.initContainsView()
    }

    // MARK: - init contains view
    func initContainsView() -> Void {
        self.initNavView()
        
    }
    
    private func initNavView() -> Void {
        let rect = CGRect(x: 0, y: 0, width: kAppWidth, height: kStatusBarHeight+kNavBarHeight)
        let navView:KSNavCustomView = KSNavCustomView(frame: rect)
        navView.setGoBackBtn(strTitle: "", hidden: false, imgNor: "Home_BtnSet.png", imgSel: "Home_BtnSet.png")
        navView.setTitleBtn(strTitle: "", enable: true, imgNor: "", imgSel: "")
        navView.setRightBtn(strTitle: "", hidden: false, imgNor: "Home_BtnMsg.png", imgSel: "Home_BtnMsg.png")
        navView.btnLeft.addTarget(self, action: #selector(goBackBtnClickHandler(_:)), for: .touchUpInside)
        navView.btnTitle.addTarget(self, action: #selector(titleBtnClickedHandeler(_:)), for: .touchUpInside)
        navView.btnRight.addTarget(self, action: #selector(rightBtnClickedHandeler(_:)), for: .touchUpInside)
        self.view.addSubview(navView)
    }
    
    // MARK: - left and right btn handler
    override func goBackBtnClickHandler(_ sender: UIButton) {
        let settingVC = KSSettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    override func rightBtnClickedHandeler(_ sender: UIButton) {
        
    }

}
