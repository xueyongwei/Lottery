//
//  MathTool.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

/// 排列组合算法
class MathTool: NSObject {
    
    /// 排列算法。计算排列的结果个数（从m中选取n个）
    class func permutation(n:Int,in m:Int) -> Int {
        if ((m == 0) || (n == 0)) {
            return 0
        }
        if (m < n) {
            return 0
        }
        var r = 1
        for i in 0..<n {
            r = r * (m - i)
        }
        return r
    }
    
    /// 计算排列算法中，如果可以重复时总的结果个数（从m中选取n个）
    class func permutationRepeatable(n:Int, in m:Int) -> Int{
        if ((m == 0) || (n == 0)) {
            return 0
        }
        if (m < n) {
            return 0
        }
        var r = 1
        for _ in 0..<n {
            r = r * m
        }
        return r
    }
    
    /// 组合算法。计算组合的结果个数
    class func combination(n:Int, in m:Int) -> Int {
        if ((m == 0) || (n == 0)) {
            return 0
        }
        if (m < n) {
            return 0
        }
        var r = 1
        for i in 0..<n {
            r = r * (m - i)
        }
        for i in (2...n).reversed() {
            r = r / (i)
        }
        return r
    }
    
}

