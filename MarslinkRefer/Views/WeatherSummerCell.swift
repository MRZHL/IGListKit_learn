//
//  WeatherSummerCell.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit

class WeatherSummerCell: UICollectionViewCell {
    private let expandLabel : UILabel = {
        let label = UILabel()
        label.text = ">>"
        label.backgroundColor = UIColor.clear
        label.font = AppFont(size: 30)
        label.textAlignment = .center
        label.textColor = UIColor(hex6: 0x44758b)
        label.sizeToFit()
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
    
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        let subtitleAttributes = [
            NSAttributedString.Key.font: AppFont(size: 14),
            NSAttributedString.Key.foregroundColor: UIColor(hex6: 0x42c84b),
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        let titleAttributes = [
            NSAttributedString.Key.font: AppFont(size: 24),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        let attributedText = NSMutableAttributedString(string: "LATEST\n", attributes: subtitleAttributes)
        attributedText.append(NSAttributedString(string: "WEATHER",attributes: titleAttributes))
        label.attributedText = attributedText
        label.sizeToFit()
        return label
    }()
    
    func setExpanded(_ expanded:Bool) -> Void {
        self.expandLabel.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi/2):.identity
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(expandLabel)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = CommentInsets
        titleLabel.frame = CGRect(x: insets.left, y: 0, width: titleLabel.bounds.width, height: bounds.height)
        expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width / 2 - insets.right, y: bounds.height / 2)
        
    }
}
