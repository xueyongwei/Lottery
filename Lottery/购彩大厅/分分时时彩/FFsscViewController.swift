//
//  FFsscViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class FFsscViewController: BaseBettingViewController {

    class func loadFormStb() ->FFsscViewController{
        let stb = UIStoryboard.init(name: "FFSSCS", bundle: nil)
        let vc = stb.instantiateInitialViewController() as! FFsscViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func customTitleView(){
        
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
