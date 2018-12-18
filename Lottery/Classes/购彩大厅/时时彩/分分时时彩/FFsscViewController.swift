//
//  FFsscViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class FFsscViewController:UIViewController,BettingTitleViwable ,BettingPayBoardViwable {
    
    var payBoardVC: PayBoardViewController?
    
    
    var cai: SSCai = SSCai.init(category: .wuxing, type: .wuxingzhixuan, way: .fushi)
    
    var payBoardHeight: CGFloat = 120
    
    func onRightItemClick() {
        print("点击了更多")
        
    }
    
    func onTitleViewClick() {
        print("点击了标题")
        ChoseBetWayViewController.presentFrom(VC: self, lotteryCategory: .ssc) { (result) in
            XYWDebugLog("result = \(result)", type: .warning)
        }
    }
    
    var selectedIndex = [Int:[Int]]()

    class func loadFormStb() ->FFsscViewController{
        let stb = UIStoryboard.init(name: "FFSSCS", bundle: nil)
        let vc = stb.instantiateInitialViewController() as! FFsscViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.customContentView()
        
        self.customComonView()
    }
    /// 定制通用视图控制器
    func customComonView(){
        self.setRightMoreItem()
        self.setNaviTitleView()
        self.addPayBoard()
    }

    /// 定制内容控制器
    func customContentView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: 50, height: 50)
        let content = FfsscStarCollectionViewController.init(collectionViewLayout: layout)
        self.addChild(content)
        content.didMove(toParent: self)
        self.view.addSubview(content.view)
        content.view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        content.choseDelegate = self
        content.collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: payBoardHeight, right: 0)
        
    }


}

//MARK: - --------------CollectionSelectedChangedProtocol--------------
extension FFsscViewController:CollectionSelectedChangedProtocol,SSCCountCountable{
    
    
    
    func betCountDidChanged(count: Int) {
        self.payBoardVC?.msgLabel.text = "已选择\(count)注"
    }
    
    func selectedChanged(in collectionView: UICollectionView) {
        
        let selectedIndexPaths = collectionView.indexPathsForSelectedItems
        
        self.updateSelectedIndex(with: selectedIndexPaths)
        
    }
}

//MARK: - --------------类中类--------------
extension FFsscViewController{
    
}
