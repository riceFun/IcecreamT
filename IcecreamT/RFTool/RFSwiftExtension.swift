//
//  RFSwiftExtension.swift
//  IcecreamT
//
//  Created by riceFun on 2018/5/9.
//  Copyright © 2018年 riceFun. All rights reserved.
//

import UIKit

extension UIImage {
    class func rf_imageWithColor(_ color:UIColor,_ size:CGSize) -> UIImage{
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
       return image
    }
}
