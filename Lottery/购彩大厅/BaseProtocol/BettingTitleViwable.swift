//
//  BettingTitleViwable.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

@objc protocol BettingTitleViwable: NSObjectProtocol {
    
    @objc func onRightItemClick()
    @objc func onTitleViewClick()
    
}

extension BettingTitleViwable where Self:UIViewController{
    
    /// 添加右边更多按钮
    func setRightMoreItem(){
        let btn = UIButton.init(type: .custom)
        btn.setTitle("三", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onRightItemClick), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
    
    func setNaviTitleView(){
        let stb = UIStoryboard.init(name: "LotteryHall", bundle: nil)
        
        guard let vc = stb.instantiateViewController(withIdentifier: "BuyTitleViewController") as? BuyTitleViewController else {
            print("无法获取BuyTitleViewController")
            return
        }
        self.navigationItem.titleView = vc.view
        vc.clickBtn.addTarget(self, action: #selector(onTitleViewClick), for: .touchUpInside)
    }
}
