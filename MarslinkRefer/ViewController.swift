//
//  ViewController.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/5.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let button :UIButton = {
       let button = UIButton.init(type: .custom)
        button.setTitle("跳转", for: .normal)
        button.backgroundColor = UIColor.gray
        return button;
    }()
    
    
    let insets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(pushNewView), for: .touchUpInside)
        button.frame = view.bounds.inset(by:insets)
        
    }
    
    
    
    @objc func pushNewView(){
    self.navigationController?.pushViewController(ClassicFeedViewController.init(), animated: true)
    }
    
    
}

