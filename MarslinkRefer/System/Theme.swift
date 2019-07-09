//
//  Theme.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/5.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

let CommentInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)

// 字体导入是需要在plist文件里声明的
func AppFont(size: CGFloat = 18) -> UIFont {
    return UIFont(name: "OCRAStd", size: size)!
}

