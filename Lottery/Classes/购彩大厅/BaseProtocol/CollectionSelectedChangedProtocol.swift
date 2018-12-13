//
//  CollectionSelectedChangedProtocol.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/12.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import Foundation
import UIKit

/// collectionView的选择状态改变协议
protocol CollectionSelectedChangedProtocol: NSObjectProtocol {
    
    /// collectionView的选择状态改变了
    func selectedChanged(in collectionView:UICollectionView)
}

/// 含有collectionView的选择状态改变协议的代理
protocol CollectionChoseable: NSObjectProtocol {
    weak var choseDelegate:CollectionSelectedChangedProtocol? {set get}
}
