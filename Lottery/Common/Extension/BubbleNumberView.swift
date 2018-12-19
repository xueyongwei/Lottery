//
//  BubbleNumberView.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/19.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

extension UILabel{
    class func bubbleLabel(frame:CGRect,_ textColor:UIColor = UIColor.white,_ bgColor:UIColor = UIColor.red,_ font:UIFont = UIFont.systemFont(ofSize: 12)) -> UILabel{
        let label = UILabel.init(frame: frame)
        label.textColor = textColor
        label.font = font
        label.layer.backgroundColor = bgColor.cgColor
        label.layer.cornerRadius = frame.size.height * 0.5
        label.textAlignment = .center
        return label
    }
    /// 运算符的label，比如“+”，“=”
    class func opreateLabel(frame:CGRect,text:String,_ textColor:UIColor = UIColor.lightGray,_ font:UIFont = UIFont.systemFont(ofSize: 12)) -> UILabel{
        let label = UILabel.init(frame: frame)
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.font = font
        return label
    }
}
extension UIButton {
    class func bubbleBtn(frame:CGRect,_ textColor:UIColor = UIColor.white,_ bgColor:UIColor = UIColor.red,_ font:UIFont = UIFont.systemFont(ofSize: 12)) -> UIButton{
        let btn = UIButton.init(type: .custom)
        btn.frame = frame
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = font
        btn.setTitleColor(textColor, for: .normal)
        
        btn.layer.backgroundColor = bgColor.cgColor
        btn.layer.cornerRadius = frame.size.height * 0.5
        
        return btn
    }
}
