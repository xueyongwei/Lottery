//
//  AppDelegate.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/10.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //注册分享平台
        self.registSharePlatforms()
        
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
//MARK: - --------------Mob分享--------------
extension AppDelegate{
    /// 注册分享平台
    func registSharePlatforms(){
        ShareSDK.registPlatforms { (platformsRegister) in
            //QQ
            platformsRegister?.setupQQ(withAppId: "100371282", appkey: "aed9b0303e3ed1e27bae87c33761161d")
            //微信
            platformsRegister?.setupWeChat(withAppId: "wx617c77c82218ea2c", appSecret: "c7253e5289986cf4c4c74d1ccc185fb1")
            //新浪
            platformsRegister?.setupSinaWeibo(withAppkey: "568898243", appSecret: "38a4f8204cc784f81f9f0daaf31e02e3", redirectUrl: "http://www.sharesdk.cn")
        }
    }
    /// 注册推送
    func registPushService(){
        #if DEBUG
        MobPush.setAPNsForProduction(false)
        #else
        MobPush.setAPNsForProduction(true)
        #endif
        let pushConfig = MPushNotificationConfiguration()
        pushConfig.types = [MPushAuthorizationOptions.badge , MPushAuthorizationOptions.sound , MPushAuthorizationOptions.alert]
        MobPush.setupNotification(pushConfig)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveMessage(notification:)), name: NSNotification.Name.MobPushDidReceiveMessage, object: nil)

    }
    /// 收到了推送消息
    @objc func didReceiveMessage(notification:NSNotification){
        
        guard let message = notification.object as? MPushMessage else { return  }
        
        switch message.messageType {
        case .custom:
            break
        case .apns:
            if UIApplication.shared.applicationState == .active {//前台
                XYWDebugLog("前台通知", type: .warning)
            }else{//后台
                XYWDebugLog("后台通知", type: .warning)
            }
            break
        case .clicked:
            XYWDebugLog("点击了通知", type: .warning)
            break
        case .local:
            break
        case .udpNotify:
            break
        }
    }
    
}
