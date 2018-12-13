//
//  QdxdsqCollectionHeader.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/12.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class QdxdsqCollectionHeader: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customSubviews()
    }
    
    func customSubviews(){
        self.backgroundColor = UIColor.lightGray
    }
}
