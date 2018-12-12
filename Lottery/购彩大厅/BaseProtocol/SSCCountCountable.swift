//
//  SSCCountCountable.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/12.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import Foundation

protocol SSCCountCountable: NSObjectProtocol {
    
    var playMethod:FFsscViewController.PlayMethod {get set}
    
    var selectedIndex: [Int:[Int]] {get set}
}

/// 计算注数方式，核心算法
extension SSCCountCountable{
    
    func updateSelectedIndex(with selectedIndexPahts:[IndexPath]?){
        XYWDebugLog("-----重算-----", type: .info)
        self.selectedIndex.removeAll()
        guard let indexPaths = selectedIndexPahts else {
            //TODO: 注数量也为0
            return
        }
        
        for indexPath in indexPaths {
            if selectedIndex.keys.contains(indexPath.section) {
                selectedIndex[indexPath.section]?.append(indexPath.item)
                XYWDebugLog("添加\(indexPath.item)到\(indexPath.section)组", type: .info)
            }else{
                XYWDebugLog("添加一个新的组\(indexPath.section):\(indexPath.item)", type: .info)
                selectedIndex[indexPath.section] = [indexPath.item]
            }
            XYWDebugLog("现有:\(selectedIndex.description)", type: .info)
        }
        
        switch playMethod.type {
        case .wuxing:
            switch playMethod.way{
            case .fushi:
                let count = calcute(in: 5)
                print("注数：\(count)")
                break
            case .zuhe:
                break
            }
            break
        default:
            break
        }
    }
    
    func calcute(in optionNumber:Int) -> Int{
        var count = 1
        guard selectedIndex.count == optionNumber else {
            return 0
        }
        for section in selectedIndex.keys{
            let numbers = selectedIndex[section]!
            count = numbers.count * count
        }
//        for i in 1 ..< selectedIndex.count {
//            let numbers = selectedIndex[i]!
//            count = numbers.count * count
//        }
        return count
    }
}
