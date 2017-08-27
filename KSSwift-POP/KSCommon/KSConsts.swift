//
//  KSConsts.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation
import UIKit

/// In Swift the situation is the same - there are no headers and no macros so there is also no precompiled header. Use extensions, global constants or singletons instead.


// MARK: - SERVICE & SecurityPolicy
let HOME_URL = "https://httpbin.org"


// MARK: - DEVICE INFO
let kSysVersion     = (UIDevice.current.systemVersion as NSString).floatValue
let kDevice         = "IOS"
let kDeviceUUID     = UIDevice.current.identifierForVendor?.uuidString
let kDeviceUserName = UIDevice.current.name


// MARK: - APP INFO
let kAppBundleID      = Bundle.main.bundleIdentifier
let kAppName          = Bundle.main.infoDictionary?["CFBundleDisplayName"]
let kAppVersion       = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
let kAppBundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"]


// MARK: - APP FRAME
let kStatusBarHeight: CGFloat = 20.0
let kNavBarHeight: CGFloat    = 44.0
let kTabBarHeight: CGFloat    = 49.0
let kAppHeight: CGFloat       = UIScreen.main.bounds.size.height
let kAppWidth: CGFloat        = UIScreen.main.bounds.size.width


// MARK: - TEXT FONT
let kTextFont     = "Helvetica"
let kTextBoldFont = "Helvetica-Bold"


// MARK: - NSUSERDEFAULTS
let USERDEFAULT = UserDefaults.standard
