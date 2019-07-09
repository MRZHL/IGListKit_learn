//
//  NSObject+ListDiffable.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
import IGListKit

extension NSObject: ListDiffable{
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}

