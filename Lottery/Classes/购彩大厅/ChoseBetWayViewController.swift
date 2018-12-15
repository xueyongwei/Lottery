//
//  ChoseBetWayViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/13.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class ChoseBetWayViewController: UIViewController {

    @IBOutlet weak var topContentView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias  ChoseComplete = ((category:Int,section:Int,item:Int))->()
    
    fileprivate var complete:ChoseComplete?
    fileprivate var lotteryCategory:LotteryCategory?
    
    class func presentFrom(VC parent:UIViewController,lotteryCategory:LotteryCategory,chosed:@escaping ChoseComplete) {
        let choseVC = UIStoryboard.init(name: "LotteryHall", bundle: nil).instantiateViewController(withIdentifier: "ChoseBetWayViewController") as! ChoseBetWayViewController
        choseVC.complete = chosed
        choseVC.lotteryCategory = lotteryCategory
        let navi = UINavigationController.init(rootViewController: choseVC)
        parent.present(navi, animated: true, completion: nil)
    }
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(onBackClick(sender:)), for: .touchUpInside)
        return btn
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightItem = UIBarButtonItem.init(customView: closeBtn)
        self.navigationItem.rightBarButtonItem = rightItem
        

        // Do any additional setup after loading the view.
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
//MARK: - --------------辅助方法--------------
extension ChoseBetWayViewController{
    func customSubviews(){
        guard let category = self.lotteryCategory else {
            return
        }
        switch category {
        case .ssc:
            let cai = SSCai.init(category: .wuxing, type: .wuxingzhixuan, way: .fushi)
            
            
            break
        case .kuai3:
            break
        default:
            break
        }
    }
    
    func customCategory(_ categorys:[String]){
        
    }
}
//MARK: - --------------响应方法--------------
extension ChoseBetWayViewController{
    @objc func onBackClick(sender:UIButton){
        self.complete?((0,0,0))
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK: - --------------类中类--------------
extension ChoseBetWayViewController{
    enum LotteryCategory {
        case ssc
        case kuai3
        case shiyixuan5
        case pk10
        case pcdandan
        case liuhecai
    }
}
