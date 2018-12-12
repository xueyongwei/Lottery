//
//  BaseNavigationController.swift
//  Browser
//
//  Created by 115 on 2017/9/5.
//  Copyright © 2017年 114la.com. All rights reserved.
//

import UIKit
import YYKit

class BaseNavigationController: UINavigationController {

    var fullScreenGe: UIPanGestureRecognizer!
    
    var canDragBack = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let target = self.interactivePopGestureRecognizer?.delegate
        
        let sel = NSSelectorFromString("handleNavigationTransition:")
        
        let targetView = self.interactivePopGestureRecognizer?.view
        
        fullScreenGe = UIPanGestureRecognizer(target: target, action: sel)
        
        fullScreenGe.delegate = self
        
        targetView?.addGestureRecognizer(fullScreenGe)
        
        self.interactivePopGestureRecognizer?.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    let backImage = UIImage(named: "new_nav_bar_return")!.withRenderingMode(.alwaysOriginal).byResize(to: CGSize.init(width: 20, height: 20))
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.popToRootViewController(animated: true)
    }
    
    @objc func myPopVC() {
        self.popViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = createNavBackButton()
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func createNavBackButton() -> UIBarButtonItem {
        return UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(myPopVC))
    }
    
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard canDragBack == true else {
            return false
        }
        
        /// 被特殊处理禁止响应
        if specialHandlingStop(gestureRecognizer) {
            return false
        }
        
        guard let gestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer else { return false }
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view)
        if translation.x <= 0 { return false }
        return self.children.count == 1 ? false : true
    }

    /// 特殊情况的处理
    fileprivate func specialHandlingStop(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

