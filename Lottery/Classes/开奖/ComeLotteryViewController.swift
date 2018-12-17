//
//  LotteryComeViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/12.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class ComeLotteryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onShare(_ sender: UIButton) {
        // 1.创建分享参数
        let params = NSMutableDictionary()
        
        params.ssdkSetupShareParams(byText: "test", images: "http://c.hiphotos.baidu.com/image/pic/item/b58f8c5494eef01f40ef23e9edfe9925bc317d26.jpg", url: nil, title: nil, type: .image)
        //2.进行分享
        ShareSDK.showShareActionSheet(nil, items: nil, shareParams: params) { (state, type, userData, contentEntity, error, end) in
            
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
