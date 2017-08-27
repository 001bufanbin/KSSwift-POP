//
//  KSBaseViewController.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit


/// 导航栏左右按钮宽度
let kNavBtnLeftAndRight_W: CGFloat = 60.0
/// 导航栏标题按钮宽度
let kNavBtnTitle_W: CGFloat        = 120.0


public enum KSNavStyle {
    case show, hidden
}


class KSBaseViewController: UIViewController, UINavigationControllerDelegate {

    var btnTitle: UIButton!
    var btnLeft: UIButton!
    var btnRight: UIButton!
    
    var navStyle: KSNavStyle?
    
    
    //MARK: - 初始化
    convenience init() {
        self.init(navStyle: .show)
    }
    
    init(navStyle: KSNavStyle?) {
        self.navStyle = navStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGBVCOLOR(0xf8f8f8)
        
        if self.navStyle == .show {
            self.initNavigationBar()
            self.setNavTitleAndBtn()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navStyle == .show {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        self.navigationController?.delegate = self;
    }
    
    //MARK: - 导航相关
    private func initNavigationBar() {
        //导航栏返回按钮
        let rectLeft  = CGRect(x: 0, y: 0, width: kNavBtnLeftAndRight_W, height: kNavBarHeight)
        btnLeft = self.createBtn(frame: rectLeft)
        btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btnLeft.addTarget(self, action: #selector(goBackBtnClickHandler(_:)), for: .touchUpInside)
        //导航栏标题按钮
        let rectTitle = CGRect(x: 0, y: 0, width: kNavBtnTitle_W, height: kNavBarHeight)
        btnTitle = self.createBtn(frame: rectTitle)
        btnTitle.titleLabel?.font = KSFont(18)
        btnTitle.addTarget(self, action: #selector(titleBtnClickedHandeler(_:)), for: .touchUpInside)
        //导航栏右边按钮
        let rectRight = CGRect(x: 0, y: 0, width: kNavBtnLeftAndRight_W, height: kNavBarHeight)
        btnRight = self.createBtn(frame: rectRight)
        btnRight.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        btnRight.addTarget(self, action: #selector(rightBtnClickedHandeler(_:)), for: .touchUpInside)
        //导航赋值
        self.navigationItem.titleView = btnTitle
        let leftSpc = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftSpc.width = -8
        self.navigationItem.leftBarButtonItems = [leftSpc,UIBarButtonItem(customView: btnLeft)]
        let rightSpc = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightSpc.width = -10
        self.navigationItem.rightBarButtonItems = [rightSpc,UIBarButtonItem(customView: btnRight)]
    }
    
    private func createBtn(frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = KSFont(16)
        return button
    }
    
    //MARK: - 导航栏元素赋值
    func setNavTitleAndBtn() {
        self.setTitleBtn(strTitle: "KSBase", enable: false, imgNor: "", imgSel: "")
        self.setGoBackBtn(strTitle: "", hidden: false, imgNor: "backButton.png", imgSel: "backButton.png")
        self.setRightBtn(strTitle: "", hidden: true, imgNor: "", imgSel: "")
    }
    
    func setTitleBtn(strTitle: String, enable: Bool, imgNor: String, imgSel: String) {
        if strTitle.isEmpty {
            btnTitle.isEnabled = false
            return;
        }
        btnTitle.isEnabled = enable
        btnTitle.setTitle(strTitle, for: .normal)
        btnTitle.setImage(LOADPATHIMAGE(imgNor), for: .normal)
        btnTitle.setImage(LOADPATHIMAGE(imgSel), for: .selected)
    }
    
    func setGoBackBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
        if hidden {
            btnLeft.isHidden = true
            return;
        }
        btnLeft.isHidden = hidden
        btnLeft.setTitle(strTitle, for: .normal)
        btnLeft.setImage(LOADPATHIMAGE(imgNor), for: .normal)
        btnLeft.setImage(LOADPATHIMAGE(imgSel), for: .selected)
        //btnLeft.backgroundColor = UIColor.red
    }
    
    func setRightBtn(strTitle: String, hidden: Bool, imgNor: String, imgSel: String) {
        if hidden {
            btnRight.isHidden = true
            return
        }
        btnRight.isHidden = hidden
        btnRight.setTitle(strTitle, for: .normal)
        btnRight.setImage(LOADPATHIMAGE(imgNor), for: .normal)
        btnRight.setImage(LOADPATHIMAGE(imgSel), for: .selected)
        btnRight.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 6)
        //btnRight.backgroundColor = UIColor.red
    }
    
    //MARK: - 导航栏响应函数
    func titleBtnClickedHandeler(_ sender: UIButton) {
        
    }
    func goBackBtnClickHandler(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
        self.releaseRequestTasks()
    }
    func rightBtnClickedHandeler(_ sender: UIButton ) {
        
    }
    
    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if navigationController is KSNavigationViewController {
            if let coordinator = navigationController.topViewController?.transitionCoordinator {
                if coordinator.initiallyInteractive {
                    coordinator.notifyWhenInteractionEnds({ (context) in
                        if !coordinator.isCancelled {
                            let fromVC = context.viewController(forKey: UITransitionContextViewControllerKey.from)
                            if let baseVC: KSBaseViewController = fromVC as? KSBaseViewController {
                                baseVC.releaseRequestTasks()
                            }
                        }
                        //                            //手势返回，打印栈内元素情况
                        //                            printLog("isAnimated == \(context.isAnimated)")
                        //                            printLog("presentationStyle == \(context.presentationStyle)")
                        //                            printLog("initiallyInteractive == \(context.initiallyInteractive)")
                        //                            printLog("isInteractive == \(context.isInteractive)")
                        //                            printLog("isCancelled == \(context.isCancelled)")
                        //                            printLog("transitionDuration == \(context.transitionDuration)")
                        //                            printLog("percentComplete == \(context.percentComplete)")
                        //                            printLog("completionVelocity == \(context.completionVelocity)")
                        //                            printLog("completionCurve == \(context.completionCurve)")
                        //                            printLog("From VC == \(String(describing: context.viewController(forKey: UITransitionContextViewControllerKey.from)))")
                        //                            printLog("To VC == \(String(describing: context.viewController(forKey: UITransitionContextViewControllerKey.to)))")
                        //                            printLog("From View == \(String(describing: context.view(forKey: UITransitionContextViewKey.from)))")
                        //                            printLog("To View == \(String(describing: context.view(forKey: UITransitionContextViewKey.to)))")
                        //                            printLog("Container View == \(context.containerView)")
                        //                            printLog("targetTransform == \(context.targetTransform)")
                    })
                }
            }
        }
    }
    
    //MARK: - 页面点击取消编辑
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    final func endEdit() -> Void {
        self.view.endEditing(true)
    }
    
    // MARK: - 统一处理请求错误码+请求失败
    func manageErrorStatus(_ : String, msg: String) {
        
    }
    
    func manageFailStatus() {
        
    }
    
    //MARK: - 释放请求
    func releaseRequestTasks() -> Void {
        //printLog("releaseRequestTasks == \(String(describing: type(of: self)))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        printLog("deinit == \(String(describing: type(of: self)))")
    }
    
    
    
}
