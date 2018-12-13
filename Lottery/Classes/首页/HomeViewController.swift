//
//  HomeViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/12.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var msgBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: "home_邮箱"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContentVC()
        
        addMsgBtn()
        
    }
    func addMsgBtn(){
        view.addSubview(msgBtn)
        msgBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(26)
            make.width.equalTo(26)
        }
    }
    
    ///
    func loadContentVC(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: 80, height: 80)
        let vc = HomeFeedCollectionViewController.init(collectionViewLayout: layout)
        self.addChild(vc)
        vc.didMove(toParent: self)
        self.view.addSubview(vc.view)
        vc.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
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
