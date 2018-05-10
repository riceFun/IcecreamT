//
//  RFSwiftMacroOrConst.swift
//  IcecreamT
//
//  Created by riceFun on 2018/5/8.
//  Copyright © 2018年 riceFun. All rights reserved.
//

import UIKit

//MARK: - 尺寸
let RFScreen_W:CGFloat = UIScreen.main.bounds.size.width
let RFScreen_H:CGFloat = UIScreen.main.bounds.size.height
let RFStatusBar_H:CGFloat = IsIphoneX ? 44 : 20
let RFNaviBar_H:CGFloat = IsIphoneX ? 88 : 64
let RFTabbar_H:CGFloat = IsIphoneX ? (49 + 34) : 49
let IsIphoneX = (RFScreen_W == 375 && RFScreen_H == 812)
let Iphone_Tabbar_SafeBottom_margin:CGFloat = IsIphoneX ? 34 : 0

//MARK: - 颜色
func RF_RGBA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func RF_RGB(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return RF_RGBA(r, g, b, 1.0)
}

//MARK: - 工程信息
func projectInfoDic() -> NSDictionary {
    let infoDic  = Bundle.main.infoDictionary
    return infoDic! as NSDictionary
}
let P_Name = projectInfoDic()["CFBundleDisplayName"] as! String
let P_Version = projectInfoDic()["CFBundleShortVersionString"] as! String
let P_Build = projectInfoDic()["CFBundleVersion"] as! String

//MARK: - 设备信息
let Ios_Version:String = UIDevice.current.systemVersion//ios 版本
let Device_UDID = UIDevice.current.identifierForVendor//设备UIID
let Device_Name = UIDevice.current.systemName//设备名称
let Device_Model = UIDevice.current.model//设备型号
let Device_LocalizedModelL = UIDevice.current.localizedModel//设备区域化型号eg：A1533











