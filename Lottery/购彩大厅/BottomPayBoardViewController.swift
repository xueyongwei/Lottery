//
//  BuyBottomPayBoardViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit
import SnapKit

class BottomPayBoardViewController: UIViewController,backViewTapable {
    
    func backViewTaped(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var inputTF: UITextField!
    
    @IBOutlet weak var boardBottomLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAction(noti:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAction(noti:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        self.addEndEditTap()
    }
    

    @objc func keyboardAction(noti:Notification){
        guard let info = noti.userInfo else {
            return
        }
        
        guard let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let fullHeight = self.parent?.view.bounds.size.height ?? 400.0
        self.view.snp.updateConstraints { (make) in
            make.height.equalTo(fullHeight)
        }
        
        let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.3
        let bottomCosnt = -(fullHeight - keyboardFrame.size.height)

        self.boardBottomLayout.constant = bottomCosnt
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
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
