//
//  HomeFeedModels.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/15.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit
import SwiftyJSON

extension HomeFeedCollectionViewController{
    //MARK: ----模型
    struct TopBarner {
        var jumpType:Int
        var lotteryId:Int
        var imageUrl:String
        var webViewUrl:String
        
        static func getListFrom(_ datas:[JSON]) -> [TopBarner]{
            var models = [TopBarner]()
            for itm in datas{
                let webViewUrl = itm["webViewUrl"].stringValue
                let imageUrl = itm["imageUrl"].stringValue
                let jumpType = itm["jumpType"].intValue
                let lotteryId = itm["lotteryId"].intValue
                let model = TopBarner.init(jumpType: jumpType, lotteryId: lotteryId, imageUrl: imageUrl, webViewUrl: webViewUrl)
                models.append(model)
            }
            return models
        }
    }
    struct FuncItem {
        var name:String
        var imageUrl:String
        var jumpType:Int
        static func getListFrom(_ datas:[JSON]) -> [FuncItem]{
            var models = [FuncItem]()
            for itm in datas{
                let name = itm["name"].stringValue
                let imageUrl = itm["imageUrl"].stringValue
                let jumpType = itm["jumpType"].intValue
                let model = FuncItem.init(name: name, imageUrl: imageUrl, jumpType: jumpType)
                models.append(model)
            }
            return models
        }
    }
    struct BigImg {
        var webViewUrl:String
        var imageUrl:String
        var jumpType:Int
        static func getListFrom(_ datas:[JSON]) -> [BigImg]{
            var models = [BigImg]()
            for itm in datas{
                let webViewUrl = itm["webViewUrl"].stringValue
                let imageUrl = itm["imageUrl"].stringValue
                let jumpType = itm["jumpType"].intValue
                let model = BigImg.init(webViewUrl: webViewUrl, imageUrl: imageUrl, jumpType: jumpType)
                models.append(model)
            }
            return models
        }
    }
    struct HotLottery {
        var name:String
        var imageUrl:String
        var lotteryId:Int
        var introduction:String
        var betMax:String
        static func getListFrom(_ datas:[JSON]) -> [HotLottery]{
            var models = [HotLottery]()
            for itm in datas{
                let model = HotLottery.init(name: itm["name"].stringValue, imageUrl: itm["imageUrl"].stringValue, lotteryId: itm["lotteryId"].intValue, introduction: itm["introduction"].stringValue, betMax: itm["betMax"].stringValue)
                models.append(model)
            }
            return models
        }
    }
    struct Lotterycategor{
        var id:Int
        var name:String
        var categoryId:Int
        var lotteryList:[Lottery]
        static func getListFrom(_ datas:[JSON]) -> [Lotterycategor]{
            var models = [Lotterycategor]()
            for itm in datas{
                let model = Lotterycategor.init(id: itm["id"].intValue, name: itm["name"].stringValue, categoryId: itm["categoryId"].intValue, lotteryList: Lottery.getListFrom(itm["lotteryList"].arrayValue))
                models.append(model)
            }
            return models
        }
    }
    struct Lottery {
        var name:String
        var lotteryId:Int
        var introduction:String
        var description:String
        var icon:String
        static func getListFrom(_ datas:[JSON]) -> [Lottery]{
            var models = [Lottery]()
            for itm in datas{
                let model = Lottery.init(name: itm["name"].stringValue, lotteryId: itm["lotteryId"].intValue, introduction: itm["introduction"].stringValue, description: itm["description"].stringValue, icon: itm["icon"].stringValue)
                models.append(model)
            }
            return models
        }
    }
}
