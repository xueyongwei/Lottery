//
//  CodeLayoutView.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/13.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

protocol ViewCodeLayoutable:NSObjectProtocol {
    func codeCustomSubviews()
}

class CodeLayoutView: UIView ,ViewCodeLayoutable{
    
    func codeCustomSubviews() {
        XYWDebugLog("CodeLayoutView派生类应该遵循ViewCodeLayoutable协议", type: .error)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        codeCustomSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        codeCustomSubviews()
    }
    

}
