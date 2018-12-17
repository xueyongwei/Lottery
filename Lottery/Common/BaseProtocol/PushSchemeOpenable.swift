//
//  PushSchemeOpenable.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/17.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

/**
 ## 推送打开指定链接页面
   如果开发者想要对通知消息进行点击跳转到H5页面的操作，可以在开发者管理后台配置url额外字段。
 ## 推送打开指定应用内指定页面
   如果开发者想要对通知消息进行点击跳转到app内指定页面的操作，可以在开发者管理后台打开配置开关和参数设置。
 ## 开发者需要在自己的应用内对所跳转的控制器进行相关代码设置。
 #import <MobPush/UIViewController+MobPush.h>
 **/

import Foundation

protocol PushSchemeOpenable:NSObjectProtocol {
    static func MobPushPath()->String
    static func initWithMobPushScene(params:Dictionary<String,Any>)
}
