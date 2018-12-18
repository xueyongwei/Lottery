//
//  CodeLayoutCollectionViewCell.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/13.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class CodeLayoutCollectionViewCell: UICollectionViewCell ,ViewCodeLayoutable{
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

class CodeLayoutTableViewCell:UITableViewCell,ViewCodeLayoutable{
    func codeCustomSubviews() {
        XYWDebugLog("CodeLayoutView派生类应该遵循ViewCodeLayoutable协议", type: .error)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        codeCustomSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        codeCustomSubviews()
    }
    
}
