//
//  BuyViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit


class BaseBettingViewController: UIViewController {

    lazy var moreBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("三", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(onRightItemClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var titleVC: BuyTitleViewController = {
        let stb = UIStoryboard.init(name: "LotteryHall", bundle: nil)
        let vc = stb.instantiateViewController(withIdentifier: "BuyTitleViewController") as! BuyTitleViewController
        return vc
    }()
    
    lazy var payBoardVC: BottomPayBoardViewController = {
        let stb = UIStoryboard.init(name: "LotteryHall", bundle: nil)
        let vc = stb.instantiateViewController(withIdentifier: "BottomPayBoardViewController") as! BottomPayBoardViewController
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moreBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        let rightItem = UIBarButtonItem.init(customView: moreBtn)
        self.navigationItem.rightBarButtonItem = rightItem
        
//        self.addChild(titleVC)
//        titleVC.didMove(toParent: self)
        self.navigationItem.titleView = self.titleVC.view
        
        self.addChild(payBoardVC)
        payBoardVC.didMove(toParent: self)
        self.view.addSubview(payBoardVC.view)
        payBoardVC.view.translatesAutoresizingMaskIntoConstraints = false
        payBoardVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        payBoardVC.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        payBoardVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        payBoardVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        // Do any additional setup after loading the view.
    }
    
    @objc func onRightItemClick(sender:UIButton){
        
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
