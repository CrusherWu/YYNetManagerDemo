//
//  YYNetWorkingManager.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit
import Alamofire

typealias YYNetworkingFetchResultBlock = (_ result: YYNetworkingResult) -> Void

class YYNetWorkingManager: NSObject {
    
    @discardableResult
    static func fetch(netParams: YYNetworkingFetchParam,
                      success: YYNetworkingFetchResultBlock?,
                      fail: YYNetworkingFetchResultBlock?) -> DataRequest {
        
        var method = HTTPMethod.get
        switch netParams.networkingMethod {
        case .get:
            method = .get
        case .post:
            method = .post
        case .delete:
            method = .delete
        case .put:
            method = .put
        }
        
        return request(netParams.urlString, method: method, parameters: netParams.otherParam, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            if response.result.value != nil{
                
                let result = YYNetworkingResult(code: 0, message: response.description, responeData: response.data, object: response.value)
                if let complete = success {
                    complete(result)
                }
                
            } else {
                let result = YYNetworkingResult(code: 0, message: response.description, responeData: nil, object: response.data)
                if let complete = fail {
                    complete(result)
                }
            }
        }
    }
}
