//
//  LotteryListViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/16.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class LotteryListViewController: UIViewController {

    var titles = [String]()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isPagingEnabled = true
        return view
    }()
    
    lazy var myCategoryView: JXCategoryTitleView = {
        let view = JXCategoryTitleView()
        let lines = JXCategoryIndicatorLineView()
        view.indicators = [lines]
        view.delegate = self
        view.titleColorGradientEnabled = true
        view.contentScrollView = scrollView
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myCategoryView)
        myCategoryView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(myCategoryView.snp.bottom).offset(0)
        }
        self.titles = ["时时彩","快3","11选5","PK10","PC蛋蛋","六合彩","测试","更多"]
        self.myCategoryView.titles = titles
        
        customChildredVC()
        // Do any additional setup after loading the view.
    }

    func customChildredVC(){
        
        var leftVC:LotteryCollectionViewController?
        
        for i in 0..<titles.count {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize.init(width: 60, height: 60)
            layout.scrollDirection = .vertical
            
            let vc = LotteryCollectionViewController.init(collectionViewLayout: layout)
            vc.cate = .ssc
            self.addChild(vc)
            vc.didMove(toParent: self)
            scrollView.addSubview(vc.view)
            
            vc.view.snp.makeConstraints { (make) in
                make.top.height.width.equalToSuperview()
                if let left = leftVC {
                    make.left.equalTo(left.view.snp.right).offset(0)
                }else{
                    make.left.equalToSuperview()
                }
                if i == titles.count - 1 {//最后一个
                    make.right.equalToSuperview()
                }
            }
            leftVC = vc
            
        }
//        for title in titles{
//            let layout = UICollectionViewFlowLayout()
//            layout.itemSize = CGSize.init(width: 60, height: 60)
//            layout.scrollDirection = .vertical
//
//            let vc = LotteryCollectionViewController.init(collectionViewLayout: layout)
//            vc.cate = .ssc
//            self.addChild(vc)
//            vc.didMove(toParent: self)
//            scrollView.addSubview(vc.view)
//
//            vc.view.snp.makeConstraints { (make) in
//                make.top.height.width.equalToSuperview()
//                if let left = leftVC {
//                    make.left.equalTo(left.view.snp.right).offset(0)
//                }else{
//                    make.left.equalToSuperview()
//                }
//            }
//            leftVC = vc
//        }
        
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

extension LotteryListViewController:JXCategoryViewDelegate{
    func categoryView(_ categoryView: JXCategoryBaseView!, didSelectedItemAt index: Int) {
        self.scrollView.setContentOffset(CGPoint.init(x: self.scrollView.bounds.size.width * CGFloat(index), y: 0), animated: true)
    }
}
