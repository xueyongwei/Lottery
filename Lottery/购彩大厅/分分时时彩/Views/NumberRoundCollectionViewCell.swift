//
//  NumberRoundCollectionViewCell.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/12.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class NumberRoundCollectionViewCell: UICollectionViewCell {
    lazy var numberBtn: BgChangedButton = {
        let btn = BgChangedButton.init(type: .custom)
        btn.backgroundColor = UIColor.white
        btn.selectedBgColor = UIColor.red
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor.white, for: .selected)
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customSubviews()
    }
    
    func customSubviews(){
        addSubview(numberBtn)
        numberBtn.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(numberBtn.superview!)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    override var isSelected: Bool{
        didSet{
            self.numberBtn.isSelected = isSelected
        }
    }
}

extension NumberRoundCollectionViewCell{
    class BgChangedButton:UIButton {
        
        var selectedBgColor:UIColor?
        
        override var isSelected: Bool{
            didSet{
                if selectedBgColor != nil{
                    let normalBgColor = backgroundColor
                    self.backgroundColor = isSelected ? selectedBgColor : normalBgColor
                }
            }
        }
    }
}
