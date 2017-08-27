//
//  KSFuncs.swift
//  KSSwift-POP
//
//  Created by kris on 2017/8/27.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation
import UIKit

/**
 *  适用：重复性不高+大图，内存可释放，已经加载过的会重复加载
 *  LOADPATHIMAGE("test.png")
 *
 *  适用：重复性高+小图，内存不能释放，已经加载过的不会重复加载
 *  LOADIMAGENAMED("test.png")
 */

func LOADPATHIMAGE(_ named: String) -> UIImage? {
    let imgPath = Bundle.main.resourcePath! + ("/") + (named)
    return UIImage(contentsOfFile: imgPath)
}

func LOADNAMEDIMAGE(_ named: String) -> UIImage? {
    return UIImage(named:named)
}

/**
 *  RGBCOLOR
 *  RGBCOLOR(100, 100, 100)
 *  RGBACOLOR(100, 100, 100, 0.5)
 *  RGBVCOLOR(0x029588)
 *
 */
func RGBCOLOR(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor
{
    return UIColor(red: (red)/255,
                   green: (green)/255,
                   blue: (blue)/255,
                   alpha: 1)
}

func RGBACOLOR(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat , _ alpha: CGFloat) -> UIColor
{
    return UIColor(red: (red)/255,
                   green: (green)/255,
                   blue: (blue)/255,
                   alpha: alpha)
}

func RGBVCOLOR(_ rgbValue: CLong) -> UIColor
{
    return UIColor(red: (CGFloat((rgbValue & 0xFF0000) >> 16))/255,
                   green: (CGFloat((rgbValue & 0xFF00) >> 8))/255,
                   blue: (CGFloat(rgbValue & 0xFF))/255,
                   alpha: 1)
}

func RGBVACOLOR(_ rgbValue: CLong, _ alpha: CGFloat) -> UIColor
{
    return UIColor(red: (CGFloat((rgbValue & 0xFF0000) >> 16))/255,
                   green: (CGFloat((rgbValue & 0xFF00) >> 8))/255,
                   blue: (CGFloat(rgbValue & 0xFF))/255,
                   alpha: alpha)
}

/**
 *  Font & BoldFont
 *  KSFont(14)
 *  KSBoldFont(14)
 *
 */
func KSFont(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: kTextFont, size: fontSize)!
}

func KSBoldFont(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: kTextBoldFont, size: fontSize)!
}

/**
 *  NSLOG (WHEN DUBUG DOES NOT OUTPUT)
 */
func printLog<T>(_ message: T,
              file: String = #file,
              fuc: String = #function,
              line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent) [\(fuc)] [Line \(line)]\r\n\(message)")
    #endif
}
