//
//  BettingPayBoardViwable.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/11.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol BettingPayBoardViwable: NSObjectProtocol {
    var payBoardHeight:CGFloat {get set}
    var payBoardVC:PayBoardViewController?{set get}
}
extension BettingPayBoardViwable where Self:UIViewController {
    
    func addPayBoard() {
        let stb = UIStoryboard.init(name: "LotteryHall", bundle: nil)
        let vc = stb.instantiateViewController(withIdentifier: "PayBoardViewController") as! PayBoardViewController
        self.addChild(vc)
        vc.didMove(toParent: self)
        self.view.addSubview(vc.view)
        vc.payBoardHeight = payBoardHeight
        vc.view.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(payBoardHeight)
        }
        
        self.payBoardVC = vc
    }
    
}
