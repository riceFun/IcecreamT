//
//  RFUIButton.swift
//  IcecreamT
//
//  Created by riceFun on 2018/5/9.
//  Copyright © 2018年 riceFun. All rights reserved.
//

import UIKit

class RFUIButton: UIButton {
    public func setButtonStyle(_ titleColor:UIColor,_ text:String,_ bgColor:UIColor,for state:UIControlState) {
        self.setTitleColor(titleColor, for: state)
        self.setTitle(text, for: state)
        self.setBackgroundImage(UIImage.rf_imageWithColor(bgColor, self.frame.size), for: state)
    }
}
