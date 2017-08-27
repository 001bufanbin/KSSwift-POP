//
//  KSSettingViewController.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSSettingViewController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setTitleBtn(strTitle: "设置", enable: false, imgNor: "", imgSel: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
