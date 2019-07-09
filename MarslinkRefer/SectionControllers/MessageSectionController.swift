//
//  MessageSectionController.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit
import IGListKit
class MessageSectionController: ListSectionController {
    var message: Message!
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
    }
}

extension MessageSectionController{
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard
        let message = message,
        let context = collectionContext
        else {
            return .zero
        }
        return MessageCell.cellSize(width: context.containerSize.width, text: message.text)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: MessageCell.self, for: self, at: index) as! MessageCell
        cell.messageLabel.text = message.text
        cell.titleLabel.text = message.user.name.uppercased()
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        message = object as? Message
    }
    
}
