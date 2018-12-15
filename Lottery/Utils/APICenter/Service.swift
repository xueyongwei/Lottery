//
//  Service.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/15.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit
import CodableAlamofire
import Alamofire
import SwiftyJSON

class Service: NSObject {
    typealias SucessBlock = (_ response:Response)->()
    typealias FailureBlock = (_ error:Error)->()
    
    enum ServiceError:Error,LocalizedError {
        case responseFormatterError
        var localizedDescription: String{
            switch self {
            case .responseFormatterError:
                return "server的数据格式不正确"
            default:
                return "未知错误"
            }
        }
    }
    
    struct Response:Decodable {
        var data:JSON
        var status:Int
        var message:String
        
//        /// 从JSON得到一个Response对象
//        static func with(alamJSON:Any) ->Response?{
//            if let dict = alamJSON as? Dictionary<String, Any>,
//                let data = dict["data"],
//                let status = dict["status"] as? Int{
//                let message = dict["message"] as? String ?? " "
//                let response = Response.init(data: data, status: status, message: message)
//                return response
//            }
//            XYWDebugLog("格式不正确:\(alamJSON)", type: .error)
//            return nil
//        }
    }
    
}
extension Service{
    struct Lottery {
        
        static func index(sucess:@escaping SucessBlock,failure: FailureBlock?){
            let url = APICenter.Lottery.index()
            //            Alamofire.request(url).responseData { (data) in
            //                switch data.result{
            //                case .success(let value):
            //                     JSONDecoder().decode(Response, from: value)
            //                    break
            //                case .failure(let error):
            //                    break
            //                }
            //            }
            
            Alamofire.request(url).responseJSON { (response) in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    let status = json["status"].intValue
                    let message = json["message"].stringValue
                    let data = json["data"]
                    let response = Response.init(data: data, status: status, message: message)
                    sucess(response)
                    break
                case .failure(let error):
                    
                    failure?(error)
                    break
                }
            }
        }
        
        
    }
    
}



