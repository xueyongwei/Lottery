//
//  RootViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/12.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(rgb: 0xD33A31),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11)], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(rgb: 0x666666),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11)], for: .normal)
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
