//
//  NotificationExtension.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/12.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    struct EX {
        /// 退出登录
        static let logoutCompleted       = NSNotification.Name(rawValue: "logoutCompleted")
        /// 登录成功
        static let loginCompleted     = NSNotification.Name(rawValue: "loginCompleted")
    }
}
