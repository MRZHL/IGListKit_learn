//
//  FeedViewController.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/8.
//  Copyright © 2019 scn. All rights reserved.
//

import UIKit
import IGListKit

class FeedViewController: UIViewController {

    var loader = JournalLoader()
    let collectionView: UICollectionView = {
        let col = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        col.backgroundColor = UIColor.black
        return col
    }()
    
    lazy var adapter:ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let path = Pathfinder()
    let wxscan = WxScanner()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadLatest()
        print("1")
        view.addSubview(collectionView)
        print("2")
        adapter.collectionView = collectionView
        adapter.dataSource = self
        path.delegate = self
        path.connect()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
        print("3")
    }
}
extension FeedViewController: ListAdapterDataSource{
    
    // 返回列表的内容
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items:[ListDiffable] = [wxscan.currentWeather]
        items += loader.entries
        items += path.message
        return items.sorted(by: { (left:Any, right:Any) -> Bool in
            guard let left = left as? DateSortable, let right = right as? DateSortable else {
                return false
            }
            return left.date > right.date
        })
    }
    
    // 对应内容的cell
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Message {
            return MessageSectionController()
        }else if object is Weather{
            return WeatherSectionController()
        }else {
            return JournalSectionController()
        }
    }
    
    // 空视图
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}


extension FeedViewController: PathfinderDelegate{
    func pathfinderDidUpdateMessage(pathfinder: Pathfinder) {
        
        // 利用adepter 来更新 列表
        adapter.performUpdates(animated: true, completion: nil)
    }
}
