//
//  LotteryListViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/16.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class LotteryListViewController: UIViewController {

    var lotterycategorScource = [HomeFeedCollectionViewController.Lotterycategor](){
        didSet{
            customChildredVC()
        }
    }
    
    
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
        
        
//        customChildredVC()
        // Do any additional setup after loading the view.
    }

    func customChildredVC(){
        
        let titles = self.lotterycategorScource.map({return $0.name})
        self.myCategoryView.titles = titles
        self.myCategoryView.reloadData()
        
        scrollView.removeAllSubviews()
        
        var leftVC:LotteryCollectionViewController?
        
        for i in 0..<titles.count {
            let lottery = self.lotterycategorScource[i]
            
            let layout = UICollectionViewFlowLayout()
            let sectionInset = UIEdgeInsets.init(top: 18, left: 18, bottom: 18, right: 18)
            layout.sectionInset = sectionInset
            layout.minimumInteritemSpacing = 20
            layout.minimumLineSpacing = 10
            let width:CGFloat = (self.view.width - sectionInset.left - sectionInset.right - 60)*0.25
            let heigth:CGFloat = 76
            layout.itemSize = CGSize.init(width: width, height: heigth)
            layout.scrollDirection = .vertical
            
            let vc = LotteryCollectionViewController.init(collectionViewLayout: layout)
            vc.lotteryList = lottery.lotteryList
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
