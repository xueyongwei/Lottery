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
    
    func betCountDidChanged(count:Int)
}


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
        
        sscBetDoneAndCalculate()
        
    }
    
    /// 押注完毕，进行计算
    func sscBetDoneAndCalculate(){
        switch playMethod.type {
        case .wuxing,.sixing,.sanxing,.erxing :
            if playMethod.way == .fushi{
                starMultiple(in: playMethod.type.starCount)
                return
            }
            break
        default:
            break
        }
    }
    
}

//MARK: - --------------时时彩算法--------------
extension SSCCountCountable {
    /// N星中复式玩法的算法
    func starMultiple(in nStar:Int){
        var count = 1
        guard selectedIndex.count == nStar else {
            self.betCountDidChanged(count: 0)
            return
        }
        for section in selectedIndex.keys{
            let numbers = selectedIndex[section]!
            count = numbers.count * count
        }
        self.betCountDidChanged(count: count)
    }
}
