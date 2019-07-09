//
//  SolFormatter.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

struct SolFormatter {
    let landingDate:Date
    
    init(landingDate:Date = Date(timeIntervalSince1970: -31725960)) {
        self.landingDate = landingDate
    }
    
    func sols(fromDate date: Date) -> Int {
        let martianDay: TimeInterval = 1477 * 60 // 24h37m
        let seconds = date.timeIntervalSince(landingDate)
        return lround(seconds / martianDay)
    }
    
}
