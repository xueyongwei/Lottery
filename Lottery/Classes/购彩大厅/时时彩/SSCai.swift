//
//  SSCai.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/12.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

/// 时时彩
class SSCai {
    
    /// 玩法分类
    var category:BetCategory
    /// 投注类型
    var type:BetType
    /// 投注方法
    var way:BetWay
    
    init(category:BetCategory,type:BetType,way:BetWay) {
        self.category = category
        self.way = way
        self.type = type
    }
    var allCategeory:[BetCategory]{
        return []
    }
}


extension SSCai{
    
    /// 玩法类型
    enum BetCategory {
        case wuxing
        case sixing
        case sanxing
        case erxing
        case douniu
        case teshuhao
        case daxiaodanshuang
        case longhu
        case quwei
        case renxuan
        case budingwei
        case dingweidan
    }
    
    /// 投注类型
    enum BetType {
        case wuxingzhixuan
        case wuxingzuxuanc
        case housizhixuan
        case housizuxuan
        case qiansizhixuan
        case qiansizuxuan
        case douniu
        case teshufuhao
        case zonghe
        case dingwei
        case chuanguan
        case longhu
        case teshu
        case rener
        case rensan
        case rensi
        case sanxingbudingwei
        case sixingbudingwei
        case wuxingbudingwei
        case dingweidan
        case houerzhixuan
        case houerzuxuan
        case qianerzhixuan
        case qianerzuxuan
        case housanzhixuan
        case housanzuxuan
        case zhongsanzhixuan
        case zhongsanzuxuan
        case qiansanzhixuan
        case qiansanzuxuan
    }
    
    /// 投注方法
    enum BetWay {
        case fushi
        case danshi
        case zuhe
        case zuxuan120
        case zuxuan60
        case zuxuan30
        case zuxuan20
        case zuxuan10
        case zuxuan5
    }
}

//MARK: - -----------BetType扩展方法------------
extension SSCai.BetCategory {
    var info:(name:String,betWays:[SSCai.BetType]){
        switch self {
        case .wuxing:
            return ("五星",[.wuxingzhixuan,.wuxingzuxuanc])
        case .sixing:
            return ("四星",[.housizhixuan,.housizuxuan,.qiansizhixuan,.qiansizuxuan])
        case .sanxing:
            return ("三星",[])
        case .erxing:
            return ("二星",[])
        case .douniu:
            return ("斗牛",[])
        case .teshuhao:
            return ("特殊号",[])
        case .daxiaodanshuang:
            return ("大小单双",[])
        case .longhu:
            return ("龙虎",[])
        case .quwei:
            return ("趣味",[])
        case .renxuan:
            return ("任选",[])
        case .budingwei:
            return ("不定号",[])
        case .dingweidan:
            return ("定位胆",[])
        }
    }
    
    /// 是几星的玩法（五星，四星等）,非星玩法返回0
    var starCount:Int{
        switch self {
        case .wuxing:
            return 5
        case .sixing:
            return 4
        case .sanxing:
            return 3
        case .erxing:
            return 2
        default:
            return 0
        }
    }
    
}

//MARK: - -----------BetWay扩展方法------------
extension SSCai.BetType{
    
    /// 信息
    var info:(name:String,betWays:[SSCai.BetWay]){
        switch self {
        case .wuxingzhixuan:
            return ("五星直选",[])
        default:
            return ("直选",[])
        }
    }
}
