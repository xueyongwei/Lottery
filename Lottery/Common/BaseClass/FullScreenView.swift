//
//  FullScreenView.swift
//  Browser
//
//  Created by 薛永伟 on 2018/5/14.
//  Copyright © 2018年 114la.com. All rights reserved.
//

import UIKit
import YYKit

class FullScreenCorverView: UIView {

    
    typealias ViewRemovedHandle = () -> ()
    
    var finishedHandle : ViewRemovedHandle!
    
    /// 点击空白区域隐藏view
    var touchEmptyToHidden = true
    
    func show(in view:UIView,animate:Bool = true, stopFullScreenBack:Bool = true,finished:@escaping ViewRemovedHandle) {
        
        finishedHandle = finished
        
        view.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        //全屏状态禁用全屏返回，如果view添加在navc中，需要禁用，否则会一直盖着无法消失
        if stopFullScreenBack == true,let nav = self.viewController.navigationController as? BaseNavigationController{
            nav.canDragBack = false
        }
        
        let duration = animate ? 0.3:0.0
        
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
    
    func dismiss(animate:Bool = true){
        let duration = animate ? 0.3:0.0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }) { (finished) in
            //恢复全屏返回
            if let nav = self.viewController.navigationController as? BaseNavigationController{
                nav.canDragBack = true
            }
            
            self.removeAllSubviews()
            self.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touchEmptyToHidden{
            self.dismiss(animate: true)
        }
    }
    

    
}
