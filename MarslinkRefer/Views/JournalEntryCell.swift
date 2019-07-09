//
//  JournalEntryCell.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit

class JournalEntryCell: UICollectionViewCell {
    static let font = AppFont()
    static let insets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    static func cellSize(width:CGFloat,text:String)->CGSize{
        return TextSize.size(text, font: font, width: width, insets: insets).size
    }
    
    let label : UILabel = {
        let label = UILabel()
        label.font = JournalEntryCell.font
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    }
    
    // 在这里的时候Label已经有 内容了 可以根据内容来调整高度了
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds.inset(by: JournalEntryCell.insets)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
