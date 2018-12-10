//
//  BettingTitleViwable.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

protocol BettingTitleViwable: NSObjectProtocol {
    var moreBtn:UIButton {get set}
    func addRightItem()
}
extension BettingTitleViwable where Self:UIViewController{
    func addRightItem(){
        self.navigationItem.rightBarButtonItem = moreBtn
    }
}
