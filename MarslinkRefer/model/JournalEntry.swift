//
//  JournalEntry.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit

class JournalEntry: NSObject ,DateSortable{
    let date: Date
    let text: String
    let user: User
    
    init(date: Date, text: String, user: User) {
        self.date = date
        self.text = text
        self.user = user
    }
}
