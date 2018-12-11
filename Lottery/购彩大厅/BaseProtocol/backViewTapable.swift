//
//  TapBackToEndEditable.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/11.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

@objc protocol backViewTapable: NSObjectProtocol {
    func backViewTaped(recognizer:UITapGestureRecognizer)
}

extension backViewTapable where Self:UIView{
    func addEndEditTap(){
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(backViewTaped(recognizer:)))
        self.addGestureRecognizer(tap)
    }
    
    func tapBack(tap:UITapGestureRecognizer){
        self.endEditing(true)
    }
    
}
extension backViewTapable where Self:UIViewController{
    
    func addEndEditTap(){
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(backViewTaped(recognizer:)))
        self.view.addGestureRecognizer(tap)
    }
    
    func tapBack(){
        self.view.endEditing(true)
    }
    
}
