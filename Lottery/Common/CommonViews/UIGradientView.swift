//
//  UIGradientView.swift
//  Browser
//
//  Created by 薛永伟 on 2018/11/13.
//  Copyright © 2018年 114la.com. All rights reserved.
//

import UIKit

/// 渐变View
class UIGradientView: UIView {

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var colors:[CGColor]?
    var locations:[NSNumber]?
    var startPoint:CGPoint?
    var endPoint:CGPoint?
    
    convenience init(colors:[CGColor],locations:[NSNumber],startPoint:CGPoint,endPoint:CGPoint) {
        self.init(frame: CGRect.zero)
        self.colors = colors
        self.locations = locations
        self.startPoint = startPoint
        self.endPoint = endPoint
        
        self.customGradientLayer()
    }
    
    fileprivate func customGradientLayer(){
        if let glayer = self.layer as? CAGradientLayer {
            glayer.colors = colors
            glayer.locations = locations
            glayer.startPoint = startPoint ?? CGPoint.init(x: 0, y: 0)
            glayer.endPoint = endPoint ?? CGPoint.init(x: 1, y: 0)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        XYWDebugLog("无法设置value:\(key)", type: .error)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
