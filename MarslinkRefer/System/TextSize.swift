//
//  TextSize.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
import UIKit

public struct TextSize{
    
    private struct CacheEntry:Hashable,Equatable{
        
        let text: String
        let font: UIFont
        let width: CGFloat
        let insets: UIEdgeInsets
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(width)
            hasher.combine(insets.bottom)
            hasher.combine(insets.top)
            hasher.combine(insets.right)
            hasher.combine(insets.left)
        }
        
        static func == (lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
            return lhs.font == rhs.font &&
            lhs.text == rhs.text &&
            lhs.width == rhs.width &&
            lhs.insets == rhs.insets
        }
    }
    
    static private var cache = [CacheEntry:CGRect](){
        didSet{
            assert(Thread.isMainThread)
        }
    }
    
    
    // 计算文本的高度
    public static func size(_ text:String,font:UIFont,width:CGFloat,insets:UIEdgeInsets = .zero)->CGRect{
        
        let key = CacheEntry(text: text, font: font, width: width, insets: insets)
        // 如果有缓存 直接返回 省的计算了
        if let hit = cache[key] {
            return hit
        }
        
        let constrainedSize = CGSize(width: width-insets.left-insets.right, height: .greatestFiniteMagnitude)
        let arrtibutes = [NSAttributedString.Key.font:font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: arrtibutes, context: nil)
        bounds.size.width = width
        bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
        cache[key] = bounds
        return bounds
    }
    
}
