//
//  KSNavCustomView.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSNavCustomView: UIView {

    var btnTitle: UIButton!
    var btnLeft: UIButton!
    var btnRight: UIButton!
    var rightCorner: UIView!
    
    
    // MARK: - 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        let xOffset: CGFloat = 0
        
        //导航栏返回按钮
        let rectLeft  = CGRect(x: xOffset,
                               y: kStatusBarHeight,
                               width: kNavBtnLeftAndRight_W,
                               height: kNavBarHeight)
        btnLeft = self.createBtn(frame: rectLeft)
        self.addSubview(btnLeft)
        //导航栏标题按钮
        let rectTitle = CGRect(x: (kAppWidth-kNavBtnTitle_W)/2,
                               y: kStatusBarHeight,
                               width: kNavBtnTitle_W,
                               height: kNavBarHeight)
        btnTitle = self.createBtn(frame: rectTitle)
        btnTitle.titleLabel?.font = KSFont(18)
        self.addSubview(btnTitle)
        //导航栏右边按钮
        let rectRight = CGRect(x: kAppWidth-kNavBtnLeftAndRight_W-xOffset,
                               y: kStatusBarHeight,
                               width: kNavBtnLeftAndRight_W,
                               height: kNavBarHeight)
        btnRight = self.createBtn(frame: rectRight)
        self.addSubview(btnRight)
        //右边小红点
        let rectCorner = CGRect(x: kAppWidth-22, y: kStatusBarHeight+8, width: 7, height: 7)
        rightCorner = UIView(frame: rectCorner)
        rightCorner.isHidden = false
        rightCorner.clipsToBounds = true
        rightCorner.layer.cornerRadius = 3.5
        rightCorner.backgroundColor = RGBCOLOR(253, 115, 38)
        self.addSubview(rightCorner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 按钮生成方法（私有）
    private func createBtn(frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = KSFont(16)
        return button
    }
    
    // MARK: - 设置按钮标题+图片
    func setTitleBtn(strTitle: String, enable: Bool, imgNor: String, imgSel: String) {
        if strTitle.isEmpty {
            btnTitle.isEnabled = false
            return;
        }
        btnTitle.setTitle(strTitle, for: .normal)
        btnTitle.setImage(LOADPATHIMAGE(imgNor), for: .normal)
        btnTitle.setImage(LOADPATHIMAGE(imgSel), for: .selected)
    }
    
    func setGoBackBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
        if hidden {
            btnLeft.isHidden = true
            return;
        }
        btnLeft.setTitle(strTitle, for: .normal)
        btnLeft.setImage(LOADPATHIMAGE(imgNor), for: .normal)
        btnLeft.setImage(LOADPATHIMAGE(imgSel), for: .selected)
    }
    
    func setRightBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
        if hidden {
            btnRight.isHidden = true
            return
        }
        btnRight.setTitle(strTitle, for: .normal)
        btnRight.setImage(LOADPATHIMAGE(imgNor), for: .normal)
        btnRight.setImage(LOADPATHIMAGE(imgSel), for: .selected)
    }

}
