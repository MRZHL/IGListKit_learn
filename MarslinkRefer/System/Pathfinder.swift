//
//  Pathfinder.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
import UIKit


protocol PathfinderDelegate: class {
    func pathfinderDidUpdateMessage(pathfinder:Pathfinder)
}


private func delay(time:Double = 1, excute work:@escaping @convention(block) ()->Swift.Void){
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        work()
    }
}

private func lewisMessage(text: String, interval: TimeInterval = 0) -> Message {
    let user = User(id: 2, name: "cpt.lewis")
    return Message(date: Date(timeIntervalSinceNow: interval), text: text, user: user)
}

class Pathfinder {
    weak var delegate: PathfinderDelegate?
    var message:[Message] = {
        var arr = [Message]()
        arr.append(lewisMessage(text: "Mark, are you receiving me?", interval: -803200))
        arr.append(lewisMessage(text: "I think I left behind some ABBA, might help with the drive 😜", interval: -259200))
        return arr;
    }(){
        didSet{
            delegate?.pathfinderDidUpdateMessage(pathfinder: self)
        }
    }
    
    func connect() -> Void {
        delay(time: 2.3) {
            self.message.append(lewisMessage(text: "Liftoff in 3..."))
            delay {
                self.message.append(lewisMessage(text: "2...."))
                delay {
                    self.message.append(lewisMessage(text: "1..."))
                }
            }
        }
    }
    
}
