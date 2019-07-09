//
//  WeatherSectionController.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit
import IGListKit
class WeatherSectionController: ListSectionController {
    var weather:Weather!
    var expand = false
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension WeatherSectionController{
    override func didUpdate(to object: Any) {
        weather = object as? Weather
    }
    
    override func numberOfItems() -> Int {
        return expand ? 5 : 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        if index == 0 {
            return CGSize(width: width, height: 70.0)
        }else{
            return CGSize(width: width, height: 40.0)
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = index == 0 ? WeatherSummerCell.self : WeatherDetailCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        
        if let cell = cell as? WeatherSummerCell {
            cell.setExpanded(expand)
        } else if let cell = cell as? WeatherDetailCell {
            let title: String, detail: String
            switch index {
            case 1:
                title = "SUNRISE"
                detail = weather.sunrise
            case 2:
                title = "SUNSET"
                detail = weather.sunset
            case 3:
                title = "HIGH"
                detail = "\(weather.high) C"
            case 4:
                title = "LOW"
                detail = "\(weather.low) C"
            default:
                title = "n/a"
                detail = "n/a"
            }
            cell.titleLabel.text = title
            cell.detailLabel.text = detail
        }
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        collectionContext?.performBatch(animated: true, updates: { (batchContext) in
            self.expand.toggle()
            batchContext.reload(self)
        }, completion: nil)
    }
}
