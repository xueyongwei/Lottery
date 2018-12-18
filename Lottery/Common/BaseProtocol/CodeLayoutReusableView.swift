//
//  CodeLayoutReusableView.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/13.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

/// 代码布局的ReusableView（header，footer等）
class CodeLayoutReusableView: UICollectionReusableView ,ViewCodeLayoutable{
    override init(frame: CGRect) {
        super.init(frame: frame)
        codeCustomSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        codeCustomSubviews()
    }
    func codeCustomSubviews() {
        XYWDebugLog("CodeLayoutView派生类应该遵循ViewCodeLayoutable协议", type: .error)
    }
}

/// 使用code布局的collectionViewCell
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
/// 使用code布局的tableViewCell
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
