//
//  Preferences.swift
//  Browser
//
//  Created by 薛永伟 on 2018/5/9.
//  Copyright © 2018年 114la.com. All rights reserved.
//

import UIKit
//MARK: - --------------UserDefaultsCenter--------------
enum UserDefaultsCenter:String {
    
    /// 新版本引导是否已完成
    case hasAppVersionGuided = "hasAppVersionGuided"
    
    /// 开发者设置：运行环境
    case DeveloperAPIEnvironment = "DevelopEnvironment"
    
    
    
}
extension UserDefaultsCenter {
    
    var isTrue:Bool{
        return UserDefaults.standard.bool(forKey: self.rawValue)
    }
    
    var string:String?{
        return UserDefaults.standard.string(forKey: self.rawValue)
    }
    
    var int:Int{
        return UserDefaults.standard.integer(forKey: self.rawValue)
    }
    
    func setValue(any:Any?) {
        UserDefaults.standard.set(any, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
}

//MARK: - --------------XYWDebugLog--------------

//封装的日志输出功能（T表示不指定日志信息参数类型）
enum XYWDebugLogType {
    case error
    case warning
    case info
    case verbose
}

/// 仅在debug模式输出日志
///
/// - Parameters:
///   - message: 日志信息
///   - type: 日志类型
///   - file: 所在文件
///   - function: 所在方法
///   - line: 所在行
func XYWDebugLog<T>(_ message:T, type:XYWDebugLogType = .verbose, file:String = #file, function:String = #function,
              line:Int = #line) {
    #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        var flag = ":"
        switch type {
        case .error:
            flag = "❌_❌ ❗️"
        case .warning:
            flag = "⚠️_⚠️"
        default:
            break
        }
        print("\(fileName)（line\(line)） - \(function) \(flag) \n \(message)")
    #endif
}


