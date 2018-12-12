//
//  LotteryHallViewController.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/10.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class LotteryHallViewController: UIViewController {

    lazy var childrenVC: HallCollectionViewController = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.scrollDirection = .vertical
        let vc =  HallCollectionViewController.init(collectionViewLayout: layout)
        vc.collectionView.alwaysBounceVertical = true
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hall"
        
//        self.addChild(childrenVC)
//        childrenVC.didMove(toParent: self)
//        self.view.addSubview(childrenVC.view)
//        childrenVC.view.translatesAutoresizingMaskIntoConstraints = false
//        childrenVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        childrenVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        childrenVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        childrenVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
