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
            }
        }
    }
    
    struct Response:Decodable {
        var data:JSON
        var status:Int
        var message:String
    }
    
}
extension Service{
    struct Lottery {
        
        static func index(sucess:@escaping SucessBlock,failure: FailureBlock?){
            let url = APICenter.Lottery.index()
            Service.request(url, parameters: nil).responseJSON { (response) in
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





extension Service {
    
    @discardableResult
    public static func request(_ url: URLConvertible,parameters: Parameters? = nil) -> DataRequest
    {
        let headers:HTTPHeaders? = nil
        return SessionManager.default.request(
            url,
            method: .post,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: headers
        )
    }
    
    /// 登录成功后更新本地的cookie
    static func updateCookies(response:DataResponse<Any>){
        let headerFields = response.response?.allHeaderFields as! [String: String]
        let url = response.request?.url
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url!)
        var cookieArray = [ [HTTPCookiePropertyKey : Any ] ]()
        for cookie in cookies {
            cookieArray.append(cookie.properties!)
        }
        UserDefaults.standard.set(cookieArray, forKey: "server_tokens")
    }
    
    /// 恢复cookies
    static func restoreCookies(){
        
        addTestCookie()
        
        if let cookieArray = UserDefaults.standard.array(forKey: "server_tokens") {
            for cookieData in cookieArray {
                if let dict = cookieData as? [HTTPCookiePropertyKey : Any] {
                    if let cookie = HTTPCookie.init(properties : dict) {
                        HTTPCookieStorage.shared.setCookie(cookie)
                    }
                }
            }
        }
    }
    
    static func addTestCookie(){
        
        var cookieProperties = [HTTPCookiePropertyKey: String]()
        cookieProperties[HTTPCookiePropertyKey.name] = "testToken" as String
        cookieProperties[HTTPCookiePropertyKey.value] = "XueYongWei" as String
        cookieProperties[HTTPCookiePropertyKey.domain] = "123.59.124.153" as String
        cookieProperties[HTTPCookiePropertyKey.path] = "/" as String
        
        let cookie = HTTPCookie(properties: cookieProperties)
        HTTPCookieStorage.shared.setCookie(cookie!)
        
    }
    
}

